INSERT INTO goud.dim_applicaties 
(
    applicatie_id, 
    applicatie_naam, 
    beheerder_naam, 
    eigenaar_afdeling_naam, 
    geldig_van, 
    geldig_tot, 
    is_actueel
)
SELECT 
    applicatie_id,
    applicatie_naam,
    beheerder_naam,
    eigenaar_afdeling_naam,
    CURRENT_DATE        AS geldig_van,
    '9999-12-31'::date  AS geldig_tot,
    TRUE                AS is_actueel
FROM zilver.applicaties_integrated;
