-- Verwijder eerst de oude tabel als deze nog bestaat
DROP TABLE IF EXISTS goud.fact_support_tickets;

CREATE TABLE IF NOT EXISTS goud.fact_support_tickets
(
    ticket_id integer NOT NULL,
    applicatie_sk bigint NOT NULL,
    eigenaar_sk bigint NOT NULL,      -- Veranderd van afdeling_sk naar eigenaar_sk
    datum_sk integer NOT NULL,
    aantal_tickets integer NOT NULL DEFAULT 1,
    oplostijd_uren numeric(8,2),
    kosten_euro numeric(10,2),
    
    -- Primary key op de combinatie van ticket en applicatie (conform jouw huidige model)
    CONSTRAINT pk_fact_support_tickets PRIMARY KEY (ticket_id, applicatie_sk),
    
    -- Foreign Key naar dim_applicaties
    CONSTRAINT fact_support_tickets_applicatie_sk_fkey FOREIGN KEY (applicatie_sk)
        REFERENCES goud.dim_applicaties (applicatie_sk) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
        
    -- Foreign Key naar dim_eigenaar
    CONSTRAINT fact_support_tickets_eigenaar_sk_fkey FOREIGN KEY (eigenaar_sk)
        REFERENCES goud.dim_eigenaar (eigenaar_sk) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
        
    -- Foreign Key naar dim_datum
    CONSTRAINT fact_support_tickets_datum_sk_fkey FOREIGN KEY (datum_sk)
        REFERENCES goud.dim_datum (datum_sk) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
TABLESPACE pg_default;

ALTER TABLE IF EXISTS goud.fact_support_tickets
    OWNER to postgres;

-- Indexen opnieuw aanmaken voor snelle rapportage performance
CREATE INDEX IF NOT EXISTS idx_fact_tickets_eigenaar
    ON goud.fact_support_tickets USING btree (eigenaar_sk ASC NULLS LAST);

CREATE INDEX IF NOT EXISTS idx_fact_tickets_applicatie
    ON goud.fact_support_tickets USING btree (applicatie_sk ASC NULLS LAST);

CREATE INDEX IF NOT EXISTS idx_fact_tickets_datum
    ON goud.fact_support_tickets USING btree (datum_sk ASC NULLS LAST);
