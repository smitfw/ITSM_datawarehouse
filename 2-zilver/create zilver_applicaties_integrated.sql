CREATE TABLE zilver.applicaties_integrated AS
SELECT 
    -- Cast text ID naar integer voor een schone basis
    CAST(app.id AS integer)                           AS applicatie_id,
    COALESCE(app.naam, 'Onbekend')                    AS applicatie_naam,
    
    -- Voeg alle beheerdersnamen samen tot één tekstveld
    COALESCE(STRING_AGG(beh.naam, ', '), 'Onbekend')  AS beheerder_naam,
    
    COALESCE(eig.afdeling, 'Onbekend')                AS eigenaar_afdeling_naam,
    COALESCE(lev.naam, 'Onbekend')                    AS leverancier_naam
FROM brons.apmapp_applicatie app

-- Joins naar de brontabellen
LEFT JOIN brons.apmapp_applicatie_beheerder abeh ON app.id = abeh.applicatie_id
LEFT JOIN brons.apmapp_beheerder beh             ON abeh.beheerder_id = beh.id
LEFT JOIN brons.apmapp_eigenaar eig              ON app.eigenaar_id = eig.id
LEFT JOIN brons.apmapp_leverancier lev           ON app.leverancier_id = lev.id

-- Groeperen op alle velden behalve de beheerder, om de aggregatie mogelijk te maken
GROUP BY 
    app.id, 
    app.naam, 
    eig.afdeling, 
    lev.naam;
