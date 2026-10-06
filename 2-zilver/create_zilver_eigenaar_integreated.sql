DROP TABLE IF EXISTS zilver.eigenaren_integrated;

CREATE TABLE zilver.eigenaren_integrated AS
SELECT DISTINCT ON (id)
    -- Zorg dat het ID netjes binnen de VARCHAR(10) past
    CAST(SUBSTRING(TRIM(id) FROM 1 FOR 10) AS character varying(10))        AS eigenaar_id,
    
    -- De naam van de eigenaar
    COALESCE(TRIM(naam), 'Onbekend')::character varying(100)               AS eigenaar_naam,
    
    -- Kostenplaats is niet aanwezig in brons, dus vullen we met een vaste waarde
    'Onbekend'::character varying(50)                                      AS kostenplaats
FROM brons.apmapp_eigenaar
WHERE id IS NOT NULL AND TRIM(id) != ''
-- Sorteer op de meest recente rij per ID mochten er duplicaten in brons zitten
ORDER BY id, ingestion_timestamp DESC;
