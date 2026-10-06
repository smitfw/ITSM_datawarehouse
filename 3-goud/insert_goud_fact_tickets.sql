INSERT INTO goud.fact_support_tickets 
(
    ticket_id, 
    applicatie_sk, 
    eigenaar_sk,        -- Aangepast naar de nieuwe kolomnaam
    datum_sk, 
    aantal_tickets, 
    oplostijd_uren, 
    kosten_euro
)
SELECT 
    stg.ticket_id                               AS ticket_id,
    COALESCE(dim_app.applicatie_sk, -1)         AS applicatie_sk,
    
    -- We mappen de afdeling_id uit het ticket naar de eigenaar_sk uit dim_eigenaar
    COALESCE(dim_eig.eigenaar_sk, -1)           AS eigenaar_sk,
    
    CAST(TO_CHAR(stg.aanmaak_datum, 'YYYYMMDD') 
         AS integer)                            AS datum_sk,
    1                                           AS aantal_tickets,
    stg.oplostijd_uren                          AS oplostijd_uren,
    stg.kosten_euro                             AS kosten_euro
FROM zilver.tickets_integrated stg
LEFT JOIN goud.dim_applicaties dim_app 
    ON stg.applicatie_id = dim_app.applicatie_id 
    AND dim_app.is_actueel = TRUE
LEFT JOIN goud.dim_eigenaar dim_eig 
    ON stg.afdeling_id = dim_eig.eigenaar_id;