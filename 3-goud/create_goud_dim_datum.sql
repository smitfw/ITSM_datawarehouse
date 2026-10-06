-- Table: goud.dim_datum

-- DROP TABLE IF EXISTS goud.dim_datum;

CREATE TABLE IF NOT EXISTS goud.dim_datum
(
    datum_sk integer NOT NULL,
    volledige_datum date NOT NULL,
    jaar integer NOT NULL,
    kwartaal integer NOT NULL,
    maand integer NOT NULL,
    maand_naam character varying(20) COLLATE pg_catalog."default" NOT NULL,
    dag_van_de_maand integer NOT NULL,
    dag_van_de_week integer NOT NULL,
    dag_naam character varying(20) COLLATE pg_catalog."default" NOT NULL,
    is_weekend boolean NOT NULL,
    CONSTRAINT dim_datum_pkey PRIMARY KEY (datum_sk)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS goud.dim_datum
    OWNER to postgres;