-- insertion query

INSERT INTO public.animals(
	id, name, date_of_birth, escape_attempts, neutered, weight_kg)
	VALUES (1, 'Agumon', '2020-02-03', 0, 'true', 10.23);
	
	INSERT INTO public.animals(
	id, name, date_of_birth, escape_attempts, neutered, weight_kg)
	VALUES (2, 'Gabumon', '2018-11-15', 2, 'true', 8);
	
	INSERT INTO public.animals(
	id, name, date_of_birth, escape_attempts, neutered, weight_kg)
	VALUES (3, 'Pikachu', '2021-01-07', 1, 'false', 15.04);
	
	INSERT INTO public.animals(
	id, name, date_of_birth, escape_attempts, neutered, weight_kg)
	VALUES (4, 'Devimon', '2017-05-12', 5, 'true', 11);

	-- Project part 2

INSERT INTO public.animals(
	id, name, date_of_birth, escape_attempts, neutered, weight_kg)
	VALUES (5, 'Charmander', '2020-02-08', 0, 'false', -11);

	INSERT INTO public.animals(
	id, name, date_of_birth, escape_attempts, neutered, weight_kg)
	VALUES (6, 'Plantmon', '2021-11-15', 2, 'true', -5.7);

	INSERT INTO public.animals(
	id, name, date_of_birth, escape_attempts, neutered, weight_kg)
	VALUES (7, 'Squirtle', '1993-04-02', 3, 'false', -12.13);

	INSERT INTO public.animals(
	id, name, date_of_birth, escape_attempts, neutered, weight_kg)
	VALUES (8, 'Angemon', '2005-05-12', 1, 'true', -45);

	INSERT INTO public.animals(
	id, name, date_of_birth, escape_attempts, neutered, weight_kg)
	VALUES (9, 'Boarmon', '2005-05-07', 7, 'true', 20.4);

	INSERT INTO public.animals(
	id, name, date_of_birth, escape_attempts, neutered, weight_kg)
	VALUES (10, 'Blossom', '1998-10-13', 3, 'true', 17);

	INSERT INTO public.animals(
	id, name, date_of_birth, escape_attempts, neutered, weight_kg)
	VALUES (11, 'Ditto', '2022-05-14', 4, 'true', 22);

	
	--Project part 3

/* Insert the following data into the owners table: */
INSERT INTO owners (full_name, age) VALUES('Sam Smith', 34);
INSERT INTO owners (full_name, age) VALUES('Jennifer Orwell', 19);
INSERT INTO owners (full_name, age) VALUES('Bob', 45);
INSERT INTO owners (full_name, age) VALUES('Melody Pond', 77);
INSERT INTO owners (full_name, age) VALUES('Dean Winchester', 14);
INSERT INTO owners (full_name, age) VALUES('Jodie Whittaker', 38);

/* Insert the following data into the species table: */
INSERT INTO species (name) VALUES('Pokemon');
INSERT INTO species (name) VALUES('Digimon');

-- Modify inserted animals so it includes the species_id value:
UPDATE animals
SET species_id = (SELECT id from species WHERE name = 'Digimon')
WHERE name like '%mon';

UPDATE animals
SET species_id = (SELECT id from species WHERE name = 'Pokemon')
WHERE species_id IS NULL;

-- Modify inserted animals to include owner information (owner_id): 
UPDATE animals
SET owner_id = (SELECT id from owners WHERE full_name = 'Sam Smith')
WHERE name = 'Agumon';

UPDATE animals
SET owner_id = (SELECT id from owners WHERE full_name = 'Jennifer Orwell')
WHERE name = 'Gabumon' OR name = 'Pikachu';

UPDATE animals
SET owner_id = (SELECT id from owners WHERE full_name = 'Bob')
WHERE name = 'Devimon' OR name = 'Plantmon';

UPDATE animals
SET owner_id = (SELECT id from owners WHERE full_name = 'Melody Pond')
WHERE name = 'Charmander' OR name = 'Squirtle' OR name = 'Blossom';

UPDATE animals
SET owner_id = (SELECT id from owners WHERE full_name = 'Dean Winchester')
WHERE name = 'Angemon'  OR name = 'Boarmon';
