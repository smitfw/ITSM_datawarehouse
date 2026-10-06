DROP TABLE IF EXISTS zilver.tickets_integrated;

CREATE TABLE zilver.tickets_integrated AS
SELECT 
    -- Zet ID's om naar integers
    CAST(TRIM(id) AS integer)                           AS ticket_id,
    CAST(TRIM(applicatie_id) AS integer)                AS applicatie_id,
    
    -- Afdeling/Eigenaar ID opschonen (max 10 tekens conform goud)
    CAST(SUBSTRING(TRIM(afdeling_id) FROM 1 FOR 10) 
         AS character varying(10))                      AS afdeling_id,
    
    -- Converteer de tekstdatum naar een echt Date object (formaat afhankelijk van je bron, bijv 'YYYY-MM-DD')
    CAST(TRIM(aanmaak_datum) AS date)                   AS aanmaak_datum,
    
    -- Vang lege waarden op en zet om naar de juiste numerieke datatypes
    NULLIF(TRIM(oplostijd_uren), '')::numeric(8,2)     AS oplostijd_uren,
    NULLIF(TRIM(kosten_euro), '')::numeric(10,2)        AS kosten_euro
FROM brons.apmapp_support_tickets
WHERE id IS NOT NULL AND TRIM(id) != '';
