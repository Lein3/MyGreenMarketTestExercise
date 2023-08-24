-- Table: public.Users

-- DROP TABLE IF EXISTS public."Users";

CREATE TABLE IF NOT EXISTS public."Users"
(
    "ID" integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    "ID_Owner" integer,
    "Name" character varying(250) COLLATE pg_catalog."default" NOT NULL,
    "Salary" numeric(10,2) NOT NULL,
    CONSTRAINT "Users_pkey" PRIMARY KEY ("ID"),
    CONSTRAINT "Users_fkey" FOREIGN KEY ("ID_Owner")
        REFERENCES public."Users" ("ID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."Users"
    OWNER to postgres;
-- Index: ix_OwnerID

-- DROP INDEX IF EXISTS public."ix_OwnerID";

CREATE INDEX IF NOT EXISTS "ix_OwnerID"
    ON public."Users" USING btree
    ("ID_Owner" ASC NULLS LAST)
    INCLUDE("Name", "Salary")
    WITH (deduplicate_items=True)
    TABLESPACE pg_default;