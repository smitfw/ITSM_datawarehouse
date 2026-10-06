-- Table: brons.apmapp_eigenaar

-- DROP TABLE IF EXISTS brons.apmapp_eigenaar;

CREATE TABLE IF NOT EXISTS brons.apmapp_eigenaar
(
    id text COLLATE pg_catalog."default",
    naam text COLLATE pg_catalog."default",
    email text COLLATE pg_catalog."default",
    afdeling text COLLATE pg_catalog."default",
    ingestion_timestamp timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    source_file_name text COLLATE pg_catalog."default",
    source_system text COLLATE pg_catalog."default" DEFAULT 'APM_SQL_DB'::character varying
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS brons.apmapp_eigenaar
    OWNER to postgres;