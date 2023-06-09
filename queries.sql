-- select queries Of part 1

select * from animals WHERE name like '%mon';
select name from animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
select * from animals WHERE neutered = 'true' and escape_attempts < 3;
select name, date_of_birth from animals WHERE name NOT IN ('Agumon','Pikachu');
select name, escape_attempts, weight_kg from animals WHERE weight_kg > 10.5;
select * from animals WHERE neutered = 'true';
select * from animals WHERE name NOT IN ('Gabumon');
select * from animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

-- UPDATE queries OF PART 2
BEGIN;
update animals set species = 'unspecified';
ROLLBACK;
select * from animals;

BEGIN:
Update animals set species = 'digimon' WHERE name like '%mon';
select * from animals;

Update animals set species = 'pokemon' WHERE species isnull;
select * from animals;

COMMIT;

select * from animals;

drop table animals;
Rollback;

-- Delete queries of part 2
BEGIN;
Delete from animals where date_of_birth > '2022-01-01';
select * from animals;

savepoint removeBirth;

update animals set weight_kg = weight_kg*(-1);
select * from animals;

rollback to removeBirth;
select * from animals;

-- Select query of part 2

select count(name) as Numbers_of_animals from animals;

select count(name) as Numbers_of_animals from animals where escape_attempts = 0;

SELECT AVG(weight_kg) AS AverageWeight FROM animals;

select * from animals where escape_attempts=(select max(escape_attempts) from animals);

(select max(weight_kg) as Maximum_weight, min(weight_kg) as Minimum_weight from animals);


-- Project part 3

-- What animals belong to Melody Pond?
SELECT name, owners.full_name FROM animals
JOIN owners ON animals.owner_id = owners.id 
WHERE full_name = 'Melody Pond';

-- List of all animals that are pokemon (their type is Pokemon).
SELECT animals.*, species.name AS pokemon_type FROM animals
JOIN species ON animals.species_id = species.id
WHERE species.name = 'Pokemon';

-- List all owners and their animals, remember to include those that don't own any animal.
SELECT animals.name AS animal_name, owners.fulL_name AS owner_name FROM owners
LEFT JOIN animals ON owners.id = animals.owner_id;

-- How many animals are there per species?
SELECT species.name AS species_name, COUNT(*) FROM animals
JOIN species ON species.id = animals.species_id
GROUP BY species.name;

-- List all Digimon owned by Jennifer Orwell.
SELECT animals.name as animal_name, owners.full_name AS owner_name, species.name AS species_name 
from animals
JOIN species ON species.id = animals.species_id
JOIN owners ON owners.id = animals.owner_id
WHERE species.name = 'Digimon' AND owners.full_name = 'Jennifer Orwell';

-- List all animals owned by Dean Winchester that haven't tried to escape.
SELECT * from animals
JOIN owners ON animals.owner_id = owners.id
WHERE owners.full_name = 'Dean Winchester' AND animals.escape_attempts = 0;

-- Who owns the most animals?
SELECT owners.full_name, COUNT(animals.name) AS num_animals
FROM owners
LEFT JOIN animals ON owners.id = animals.owner_id
GROUP BY owners.full_name
ORDER BY num_animals DESC;
