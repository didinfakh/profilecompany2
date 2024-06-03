select 
rp.id_register, 
mrmi.id_tingkat id_tingkat_inheren, 
mrmt.id_tingkat id_tingkat_target, 
mrmr.id_tingkat id_tingkat_real, 
count(mrmi.id_tingkat) tot_tingkat_inheren, 
count(mrmt.id_tingkat) tot_tingkat_target, 
count(mrmr.id_tingkat) tot_tingkat_real
FROM
RISK_PROFILE RP
LEFT JOIN RISK_PROFILE_TARGET_RESIDUAL RPTS ON RP.ID_RISK_PROFILE = RPTS.ID_RISK_PROFILE
AND RPTS.PERIODE = '2024q2'
LEFT JOIN RISK_PROFILE_REALISASI_RESIDUAL RPRR ON RP.ID_RISK_PROFILE = RPRR.ID_RISK_PROFILE
AND RPRR.PERIODE = '20243'
left join mt_risk_matrix mrmi on rp.id_dampak_inheren = mrmi.id_dampak and rp.id_kemungkinan_inheren = mrmi.id_kemungkinan
left join mt_risk_matrix mrmt on RPTS.id_dampak = mrmt.id_dampak and RPTS.id_kemungkinan = mrmt.id_kemungkinan
left join mt_risk_matrix mrmr on RPRR.id_dampak = mrmr.id_dampak and RPTS.id_kemungkinan = mrmr.id_kemungkinan
group by rp.id_register, 
mrmi.id_tingkat, 
mrmt.id_tingkat, 
mrmr.id_tingkat
							