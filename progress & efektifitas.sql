select 
avg(progress)
from risk_profile_mitigasi_realisasi a
join risk_profile_mitigasi b on a.id_mitigasi = b.id_mitigasi and b.deleted_at is null
join risk_profile c on b.id_risk_profile = c.id_risk_profile and c.deleted_at is null
join risk_register d on d.id_register = c.id_register and d.deleted_at is null
where periode = '20245' 
and a.deleted_at is null;


select 
case when e.skala = f.skala then 'Efektif' else 'Tidak Efektif' end as efektif
from risk_profile_target_residual a
join risk_profile_realisasi_residual b on a.id_risk_profile = b.id_risk_profile and a.periode = (b.periode::int-1)::text
join risk_profile c on b.id_risk_profile = c.id_risk_profile and c.deleted_at is null
join risk_register d on d.id_register = c.id_register and d.deleted_at is null
join mt_risk_matrix e on a.id_kemungkinan = e.id_kemungkinan and a.id_dampak = e.id_dampak and e.deleted_at is null
join mt_risk_matrix f on b.id_kemungkinan = f.id_kemungkinan and b.id_dampak = f.id_dampak and f.deleted_at is null
where b.periode = '20241' 
and a.deleted_at is null;