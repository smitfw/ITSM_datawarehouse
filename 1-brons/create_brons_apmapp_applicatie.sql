-- Table: brons.apmapp_applicatie

-- DROP TABLE IF EXISTS brons.apmapp_applicatie;

CREATE TABLE IF NOT EXISTS brons.apmapp_applicatie
(
    id text COLLATE pg_catalog."default",
    naam text COLLATE pg_catalog."default",
    omschrijving text COLLATE pg_catalog."default",
    hoofdapplicatie_id text COLLATE pg_catalog."default",
    eigenaar_id text COLLATE pg_catalog."default",
    leverancier_id text COLLATE pg_catalog."default",
    ingestion_timestamp timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    source_file_name text COLLATE pg_catalog."default",
    source_system text COLLATE pg_catalog."default" DEFAULT 'APM_SQL_DB'::character varying
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS brons.apmapp_applicatie
    OWNER to postgres;