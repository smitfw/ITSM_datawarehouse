SELECT 
    d_dat.jaar,
    d_dat.maand_naam,
    COUNT(f.ticket_id) AS aantal_tickets
FROM goud.fact_support_tickets f
JOIN goud.dim_datum d_dat ON f.datum_sk = d_dat.datum_sk
GROUP BY d_dat.jaar, d_dat.maand, d_dat.maand_naam
ORDER BY d_dat.jaar DESC, d_dat.maand ASC;
