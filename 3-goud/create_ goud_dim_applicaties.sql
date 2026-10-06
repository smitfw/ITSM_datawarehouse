-- Table: goud.dim_applicaties

-- DROP TABLE IF EXISTS goud.dim_applicaties;

CREATE TABLE IF NOT EXISTS goud.dim_applicaties
(
    applicatie_sk bigserial NOT NULL,
    applicatie_id integer NOT NULL,
    applicatie_naam character varying(100) COLLATE pg_catalog."default" NOT NULL,
    beheerder_naam character varying(100) COLLATE pg_catalog."default" NOT NULL,
    eigenaar_afdeling_naam character varying(100) COLLATE pg_catalog."default",
    geldig_van date NOT NULL DEFAULT CURRENT_DATE,
    geldig_tot date NOT NULL DEFAULT '9999-12-31'::date,
    is_actueel boolean NOT NULL DEFAULT true,
    CONSTRAINT "goud.dim_applicaties_pkey" PRIMARY KEY (applicatie_sk)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS goud.dim_applicaties
    OWNER to postgres;
-- Index: idx_dim_applicaties_id_actueel

-- DROP INDEX IF EXISTS goud.idx_dim_applicaties_id_actueel;

CREATE INDEX IF NOT EXISTS idx_dim_applicaties_id_actueel
    ON goud.dim_applicaties USING btree
    (applicatie_id ASC NULLS LAST, is_actueel ASC NULLS LAST)
;