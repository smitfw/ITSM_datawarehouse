-- Table: brons.apmapp_applicatie_beheerder

-- DROP TABLE IF EXISTS brons.apmapp_applicatie_beheerder;

CREATE TABLE IF NOT EXISTS brons.apmapp_applicatie_beheerder
(
    id text COLLATE pg_catalog."default",
    applicatie_id text COLLATE pg_catalog."default",
    beheerder_id text COLLATE pg_catalog."default",
    ingestion_timestamp timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    source_file_name text COLLATE pg_catalog."default",
    source_system text COLLATE pg_catalog."default" DEFAULT 'APM_SQL_DB'::character varying
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS brons.apmapp_applicatie_beheerder
    OWNER to postgres;