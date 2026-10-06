-- Optioneel: Maak de tabel leeg als er al incomplete testdata in staat
TRUNCATE TABLE goud.dim_datum CASCADE;

-- Vul de datumdimensie van 2020 t/m 2035
INSERT INTO goud.dim_datum 
(
    datum_sk, 
    volledige_datum, 
    jaar, 
    kwartaal, 
    maand, 
    maand_naam, 
    dag_van_de_maand, 
    dag_van_de_week, 
    dag_naam, 
    is_weekend
)
SELECT 
    -- 1. datum_sk (Formaat: JJJJMMDD als integer, bijv. 20260919)
    CAST(TO_CHAR(datum, 'YYYYMMDD') AS integer) AS datum_sk,
    
    -- 2. volledige_datum
    datum::date AS volledige_datum,
    
    -- 3. jaar
    CAST(EXTRACT(YEAR FROM datum) AS integer) AS jaar,
    
    -- 4. kwartaal
    CAST(EXTRACT(QUARTER FROM datum) AS integer) AS kwartaal,
    
    -- 5. maand
    CAST(EXTRACT(MONTH FROM datum) AS integer) AS maand,
    
    -- 6. maand_naam (Nederlandstalig)
    CASE EXTRACT(MONTH FROM datum)
        WHEN 1 THEN 'Januari'   WHEN 2 THEN 'Februari' WHEN 3 THEN 'Maart' 
        WHEN 4 THEN 'April'     WHEN 5 THEN 'Mei'      WHEN 6 THEN 'Juni'
        WHEN 7 THEN 'Juli'      WHEN 8 THEN 'Augustus' WHEN 9 THEN 'September' 
        WHEN 10 THEN 'Oktober'  WHEN 11 THEN 'November'WHEN 12 THEN 'December'
    END AS maand_naam,
    
    -- 7. dag_van_de_maand
    CAST(EXTRACT(DAY FROM datum) AS integer) AS dag_van_de_maand,
    
    -- 8. dag_van_de_week (1 = maandag, 7 = zondag conform ISO)
    CAST(EXTRACT(ISODOW FROM datum) AS integer) AS dag_van_de_week,
    
    -- 9. dag_naam (Nederlandstalig)
    CASE EXTRACT(ISODOW FROM datum)
        WHEN 1 THEN 'Maandag'   WHEN 2 THEN 'Dinsdag'   WHEN 3 THEN 'Woensdag'
        WHEN 4 THEN 'Donderdag' WHEN 5 THEN 'Vrijdag'   WHEN 6 THEN 'Zaterdag' 
        WHEN 7 THEN 'Zondag'
    END AS dag_naam,
    
    -- 10. is_weekend
    CASE 
        WHEN EXTRACT(ISODOW FROM datum) IN (6, 7) THEN TRUE 
        ELSE FALSE 
    END AS is_weekend

FROM (
    -- Genereer een reeks van alle dagen tussen 2020-01-01 en 2035-12-31
    SELECT generate_series(
        '2020-01-01'::timestamp, 
        '2035-12-31'::timestamp, 
        '1 day'::interval
    )::date AS datum
) reeks;
