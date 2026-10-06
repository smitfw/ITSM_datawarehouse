INSERT INTO goud.dim_eigenaar 
(
    eigenaar_id, 
    eigenaar_naam, 
    kostenplaats
)
SELECT 
    eigenaar_id,
    eigenaar_naam,
    kostenplaats
FROM zilver.eigenaren_integrated;
