select
	a.*,
	mrm.id_tingkat as id_tingkat_inheren,
	mrm.skala as skala_inheren,
	mrmt.id_tingkat as id_tingkat_target,
	mrmt.skala as skala_target,
	mrmr.id_tingkat as id_tingkat_real,
	mrmr.skala as skala_real
from
	(
		select
		id_kriteria_dampak,
		id_risk_agregasi_risiko,
			a.jenis,
			a.nama,
			is_kuantitatif,
			case
				when is_kuantitatif = 0
				or is_kuantitatif is null then a.id_dampak_kualitatif_inheren
				else mrd.id_dampak
			end as id_dampak_inheren,
			case
				when is_kuantitatif = 0
				or is_kuantitatif is null then null
				else a.nilai_dampak_inheren
			end as nilai_dampak_inheren,
			a.nilai_kemungkinan_inheren,
			mrk.id_kemungkinan as id_kemungkinan_inheren,
			case
				when is_kuantitatif = 0
				or is_kuantitatif is null then null
				else a.nilai_eksposur_inheren
			end as nilai_eksposur_inheren,
			case
				when is_kuantitatif = 0
				or is_kuantitatif is null then a.id_dampak_kualitatif_target
				else mrdt.id_dampak
			end as id_dampak_target,
			case
				when is_kuantitatif = 0
				or is_kuantitatif is null then null
				else a.nilai_dampak_target
			end as nilai_dampak_target,
			a.nilai_kemungkinan_target,
			mrkt.id_kemungkinan as id_kemungkinan_target,
			case
				when is_kuantitatif = 0
				or is_kuantitatif is null then null
				else a.nilai_eksposur_target
			end as nilai_eksposur_target,
			case
				when is_kuantitatif = 0
				or is_kuantitatif is null then a.id_dampak_kualitatif_real
				else mrdr.id_dampak
			end as id_dampak_real,
			case
				when is_kuantitatif = 0
				or is_kuantitatif is null then null
				else a.nilai_dampak_real
			end as nilai_dampak_real,
			a.nilai_kemungkinan_real,
			mrkr.id_kemungkinan as id_kemungkinan_real,
			case
				when is_kuantitatif = 0
				or is_kuantitatif is null then null
				else a.nilai_eksposur_real
			end as nilai_eksposur_real
		from
			(
				select
					mra.nama,
					rp.*,
					mras.nilai_sasaran,
					rp.nilai_dampak_inheren / mras.nilai_sasaran * 100 as persen_dampak_inheren,
					rp.nilai_dampak_target / mras.nilai_sasaran * 100 as persen_dampak_target,
					rp.nilai_dampak_real / mras.nilai_sasaran * 100 as persen_dampak_real
				from
					(
						select
							rp.jenis,
							to_char(rp.tgl_risiko, 'yyyy')::int tahun,
							is_kuantitatif,
							rp.id_risk_agregasi_risiko,
						rp.id_kriteria_dampak,
							sum(rp.nilai_dampak_inheren) as nilai_dampak_inheren,
							case
								when is_kuantitatif = 0
								or is_kuantitatif is null then avg(rp.nilai_kemungkinan)
								else round(
									sum(
										rp.nilai_dampak_inheren * rp.nilai_kemungkinan / 100
									) / sum(rp.nilai_dampak_inheren) * 100
								)
							end as nilai_kemungkinan_inheren,
							sum(
								rp.nilai_dampak_inheren * rp.nilai_kemungkinan / 100
							) as nilai_eksposur_inheren,
							floor(avg(rp.id_dampak_inheren)) as id_dampak_kualitatif_inheren,
							sum(rpts.nilai_dampak) as nilai_dampak_target,
							case
								when is_kuantitatif = 0
								or is_kuantitatif is null then avg(rpts.nilai_kemungkinan)
								else round(
									sum(rpts.nilai_dampak * rpts.nilai_kemungkinan / 100) / sum(rpts.nilai_dampak) * 100
								)
							end as nilai_kemungkinan_target,
							sum(rpts.nilai_dampak * rpts.nilai_kemungkinan / 100) as nilai_eksposur_target,
							floor(avg(rpts.id_dampak)) as id_dampak_kualitatif_target,
							sum(rprr.nilai_dampak) as nilai_dampak_real,
							case
								when is_kuantitatif = 0
								or is_kuantitatif is null then avg(rprr.nilai_kemungkinan)
								else round(
									sum(rprr.nilai_dampak * rprr.nilai_kemungkinan / 100) / sum(rpts.nilai_dampak) * 100
								)
							end as nilai_kemungkinan_real,
							sum(rprr.nilai_dampak * rprr.nilai_kemungkinan / 100) as nilai_eksposur_real,
							floor(avg(rprr.id_dampak)) as id_dampak_kualitatif_real
						from
							risk_profile rp
							left join risk_profile_target_residual rpts on rp.id_risk_profile = rpts.id_risk_profile
							and rpts.periode = '2024q2'
							left join risk_profile_realisasi_residual rprr on rp.id_risk_profile = rprr.id_risk_profile
							and rprr.periode = '20243'
						group by
							jenis,
						rp.id_kriteria_dampak,
							id_risk_agregasi_risiko,
							is_kuantitatif,
							to_char(rp.tgl_risiko, 'yyyy')
					) rp
					join mt_risk_agregasi_risiko mra on rp.id_risk_agregasi_risiko = mra.id_risk_agregasi_risiko
					left join mt_risk_agregasi_risiko_sasaran mras on mra.id_risk_agregasi_risiko = mras.id_risk_agregasi_risiko
					and mras.tahun = rp.tahun
			) a
			join mt_risk_dampak mrd on (
				persen_dampak_inheren >= mrd.mulai
				or mrd.id_dampak = 1
			)
			and (
				persen_dampak_inheren < mrd.sampai
				or mrd.id_dampak = 5
			)
			join mt_risk_kemungkinan mrk on (
				nilai_kemungkinan_inheren >= mrk.persentase_mulai
				or mrk.id_kemungkinan = 1
			)
			and (
				nilai_kemungkinan_inheren < mrk.persentase_sampai
				or mrk.id_kemungkinan = 5
			)
			join mt_risk_dampak mrdt on (
				persen_dampak_target >= mrdt.mulai
				or mrdt.id_dampak = 1
			)
			and (
				persen_dampak_target < mrdt.sampai
				or mrdt.id_dampak = 5
			)
			join mt_risk_kemungkinan mrkt on (
				nilai_kemungkinan_target >= mrkt.persentase_mulai
				or mrkt.id_kemungkinan = 1
			)
			and (
				nilai_kemungkinan_target < mrkt.persentase_sampai
				or mrkt.id_kemungkinan = 5
			)
			join mt_risk_dampak mrdr on (
				persen_dampak_real >= mrdr.mulai
				or mrdr.id_dampak = 1
			)
			and (
				persen_dampak_real < mrdr.sampai
				or mrdr.id_dampak = 5
			)
			join mt_risk_kemungkinan mrkr on (
				nilai_kemungkinan_real >= mrkr.persentase_mulai
				or mrkr.id_kemungkinan = 1
			)
			and (
				nilai_kemungkinan_real < mrkr.persentase_sampai
				or mrkr.id_kemungkinan = 5
			)
	) a
	join mt_risk_matrix mrm on a.id_dampak_inheren = mrm.id_dampak
	and a.id_kemungkinan_inheren = mrm.id_kemungkinan
	and a.jenis = mrm.jenis
	join mt_risk_matrix mrmt on a.id_dampak_target = mrmt.id_dampak
	and a.id_kemungkinan_target = mrmt.id_kemungkinan
	and a.jenis = mrmt.jenis
	join mt_risk_matrix mrmr on a.id_dampak_real = mrmr.id_dampak
	and a.id_kemungkinan_real = mrmr.id_kemungkinan
	and a.jenis = mrmr.jenis
order by
	skala_inheren desc;