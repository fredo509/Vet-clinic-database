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

update animals set species = 'unspecified';
ROLLBACK;
select * from animals;

Update animals set species = 'digimon' WHERE name like '%mon';
select * from animals;

Update animals set species = 'pokemon' WHERE species isnull;
select * from animals;

COMMIT;

select * from animals;

drop table animals;
Rollback;

-- Delete queries of part 2

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

