SELECT 
    f.ticket_id,
    d_app.applicatie_naam,
    d_app.beheerder_naam,
    d_eig.eigenaar_naam,
    d_dat.volledige_datum,
    f.oplostijd_uren,
    f.kosten_euro
FROM goud.fact_support_tickets f
LEFT JOIN goud.dim_applicaties d_app ON f.applicatie_sk = d_app.applicatie_sk
LEFT JOIN goud.dim_eigenaar d_eig     ON f.eigenaar_sk = d_eig.eigenaar_sk
LEFT JOIN goud.dim_datum d_dat       ON f.datum_sk = d_dat.datum_sk
ORDER BY applicatie_naam, volledige_datum
--LIMIT 10;