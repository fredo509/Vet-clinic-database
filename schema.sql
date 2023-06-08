-- Database creation
CREATE DATABASE vet_clinic;

-- Table: public.animals

-- DROP TABLE IF EXISTS public.animals;

CREATE TABLE IF NOT EXISTS public.animals
(
    id integer,
    name varchar(255),
    date_of_birth date,
    escape_attempts integer,
    neutered boolean,
    weight_kg decimal
);

-- Project part 2

-- ADD new column

ALTER TABLE animals add species TEXT;