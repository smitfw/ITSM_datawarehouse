SELECT 
    d_eig.eigenaar_naam,
    COUNT(f.ticket_id)  AS totaal_aantal_tickets,
    SUM(f.kosten_euro)   AS totale_kosten_euro,
    ROUND(AVG(f.oplostijd_uren), 2) AS gemiddelde_oplostijd_uren
FROM goud.fact_support_tickets f
JOIN goud.dim_eigenaar d_eig ON f.eigenaar_sk = d_eig.eigenaar_sk
GROUP BY d_eig.eigenaar_naam
ORDER BY totaal_aantal_tickets DESC;