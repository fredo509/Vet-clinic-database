-- Table: public.animals

-- DROP TABLE IF EXISTS public.animals;

CREATE TABLE IF NOT EXISTS public.animals
(
    id integer,
    name character varying(50) COLLATE pg_catalog."default",
    date_of_birth date,
    escape_attempts integer,
    neutered boolean,
    weight_kg double precision
);
