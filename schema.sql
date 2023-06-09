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

-- Project part 3 

CREATE TABLE owners (
    id BIGSERIAL NOT NULL PRIMARY KEY,
	full_name VARCHAR(100) NOT NULL,
	age INT NOT NULL
);

CREATE TABLE species (
    id BIGSERIAL NOT NULL PRIMARY KEY,
	name VARCHAR(100) NOT NULL,
);

ALTER TABLE animals DROP COLUMN species;
ALTER TABLE animals ADD species_id BIGINT REFERENCES species (id);
ALTER TABLE animals ADD owner_id BIGINT REFERENCES owners (id);



/* last Milestone  */

CREATE TABLE vets (
    id BIGSERIAL NOT NULL PRIMARY KEY,
	name VARCHAR(100) NOT NULL,
	age INT NOT NULL,
	date_of_graduation DATE
);

CREATE TABLE specializations (
	species_id BIGINT REFERENCES species (id),
	vets_id BIGINT REFERENCES vets (id)
);

CREATE TABLE visits (
	animals_id BIGINT REFERENCES animals (id),
	vets_id BIGINT REFERENCES vets (id),
	date_of_visit DATE
);

-- Pair programming part 

-- Add an email column to your owners table
ALTER TABLE owners ADD COLUMN email VARCHAR(120);

 --Add index to update query performance 
 CREATE INDEX animals_id_idx ON visits (animal_id ASC);
 CREATE INDEX email_id_idx ON owners (email ASC);
 CREATE INDEX vets_id_idx ON visits (vet_id);
