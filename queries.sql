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



/* last Milestone  */

-- Write queries to answer the following:


-- Who was the last animal seen by William Tatcher?
SELECT animals.name, vets.name, visits.date_of_visit FROM vets
JOIN visits ON vets.id = visits.vets_id
JOIN animals ON animals.id = visits.animals_id
WHERE vets.name = 'William Tatcher'
ORDER BY visits.date_of_visit DESC
LIMIT 1;

-- How many different animals did Stephanie Mendez see?
SELECT COUNT(*) as num_animals_visited FROM vets
JOIN visits ON vets.id = visits.vets_id
WHERE vets.name = 'Stephanie Mendez';

-- List all vets and their specialties, including vets with no specialties.
SELECT vets.name, species.name AS specialized_in FROM vets
LEFT JOIN specializations ON specializations.vets_id = vets.id
LEFT JOIN  species ON specializations.species_id = species.id;

-- List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020.
SELECT animals.name AS animal_name, visits.date_of_visit FROM animals
JOIN visits ON visits.animals_id = animals.id
JOIN vets ON vets.id = visits.vets_id
WHERE vets.name = 'Stephanie Mendez' AND visits.date_of_visit >= '2020-04-01' AND visits.date_of_visit <= '2020-08-30';

-- What animal has the most visits to vets?
SELECT animals.name, COUNT(*) AS count FROM animals
JOIN visits ON visits.animals_id = animals.id
GROUP BY animals.name
ORDER BY count DESC
LIMIT 1;

-- -- Who was Maisy Smith's first visit?
SELECT vets.name, visits.date_of_visit, animals.name FROM visits 
JOIN vets ON vets.id = visits.vets_id
JOIN animals ON animals.id = visits.animals_id
WHERE vets.name = 'Maisy Smith'
ORDER BY visits.date_of_visit
LIMIT 1;

-- -- Details for most recent visit: animal information, vet information, and date of visit.
SELECT date_of_visit,
	animals.date_of_birth AS animal_date,
	animals.escape_attempts,
	animals.neutered,
	animals.weight_kg AS animal_weight,
	vets.name AS vet_name,
	vets.age AS vet_age,
	vets.date_of_graduation
FROM visits
JOIN animals ON animals.id = visits.animals_id
JOIN vets ON vets.id = visits.vets_id
ORDER BY date_of_visit
LIMIT 1;

-- How many visits were with a vet that did not specialize in that animal's species?
SELECT COUNT(*)
FROM visits
JOIN animals ON animals.id = visits.animals_id
JOIN vets ON vets.id = visits.vets_id
JOIN specializations ON specializations.vets_id = visits.vets_id
WHERE animals.species_id != specializations.species_id;

-- What specialty shoudl Maisy Smith consider getting? Look for the species she gets the most.
SELECT species.name as species, COUNT(*) from visits
join vets ON vets.id = visits.vets_id
JOIN animals ON animals.id = visits.animals_id
JOIN species ON species.id = animals.species_id
WHERE vets.name = 'Maisy Smith'
GROUP BY species.name;

-- PAIr programming Part 

EXPLAIN ANALYSE SELECT COUNT(*) FROM visits where animal_id = 4;
EXPLAIN ANALYSE SELECT * FROM visits where vet_id = 2;
EXPLAIN ANALYSE SELECT * FROM owners where email = 'owner_18327@mail.com';
