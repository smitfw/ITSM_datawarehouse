-- Table: goud.dim_eigenaar

-- DROP TABLE IF EXISTS goud.dim_eigenaar;

CREATE TABLE IF NOT EXISTS goud.dim_eigenaar
(
    eigenaar_sk bigserial NOT NULL,
    eigenaar_id character varying(10) COLLATE pg_catalog."default" NOT NULL,
    eigenaar_naam character varying(100) COLLATE pg_catalog."default" NOT NULL,
    kostenplaats character varying(50) COLLATE pg_catalog."default",
    CONSTRAINT dim_eigenaar_pkey PRIMARY KEY (eigenaar_sk)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS goud.dim_eigenaar
    OWNER to postgres;
-- Index: idx_dim_eigenaar_id

-- DROP INDEX IF EXISTS goud.idx_dim_eigenaar_id;

CREATE INDEX IF NOT EXISTS idx_dim_eigenaar_id
    ON goud.dim_eigenaar USING btree
    (eigenaar_id COLLATE pg_catalog."default" ASC NULLS LAST)
;