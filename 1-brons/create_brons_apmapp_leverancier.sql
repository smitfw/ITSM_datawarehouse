-- Table: brons.apmapp_leverancier

-- DROP TABLE IF EXISTS brons.apmapp_leverancier;

CREATE TABLE IF NOT EXISTS brons.apmapp_leverancier
(
    id text COLLATE pg_catalog."default",
    naam text COLLATE pg_catalog."default",
    straat text COLLATE pg_catalog."default",
    huisnummer text COLLATE pg_catalog."default",
    postcode text COLLATE pg_catalog."default",
    plaats text COLLATE pg_catalog."default",
    cp1_naam text COLLATE pg_catalog."default",
    cp1_email text COLLATE pg_catalog."default",
    cp1_telefoon text COLLATE pg_catalog."default",
    cp2_naam text COLLATE pg_catalog."default",
    cp2_email text COLLATE pg_catalog."default",
    cp2_telefoon text COLLATE pg_catalog."default",
    cp3_naam text COLLATE pg_catalog."default",
    cp3_email text COLLATE pg_catalog."default",
    cp3_telefoon text COLLATE pg_catalog."default",
    opmerkingen text COLLATE pg_catalog."default",
    interne_notities text COLLATE pg_catalog."default",
    aangemaakt_op text COLLATE pg_catalog."default",
    gewijzigd_op text COLLATE pg_catalog."default",
    aangemaakt_door_id text COLLATE pg_catalog."default",
    gewijzigd_door_id text COLLATE pg_catalog."default",
    ingestion_timestamp timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    source_file_name text COLLATE pg_catalog."default",
    source_system text COLLATE pg_catalog."default" DEFAULT 'TOPDESK_SQL_DB'::character varying
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS brons.apmapp_leverancier
    OWNER to postgres;