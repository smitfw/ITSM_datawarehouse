-- Table: brons.apmapp_support_tickets

-- DROP TABLE IF EXISTS brons.apmapp_support_tickets;

CREATE TABLE IF NOT EXISTS brons.apmapp_support_tickets
(
    id text COLLATE pg_catalog."default",
    applicatie_id text COLLATE pg_catalog."default",
    afdeling_id text COLLATE pg_catalog."default",
    aanmaak_datum text COLLATE pg_catalog."default",
    oplostijd_uren text COLLATE pg_catalog."default",
    kosten_euro text COLLATE pg_catalog."default",
    ingestion_timestamp timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    source_file_name text COLLATE pg_catalog."default",
    source_system text COLLATE pg_catalog."default" DEFAULT 'TOPDESK_SQL_DB'::character varying,
    omschrijving text COLLATE pg_catalog."default"
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS brons.apmapp_support_tickets
    OWNER to postgres;