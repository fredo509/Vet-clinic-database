-- select queries

select * from animals WHERE name like '%mon';
select name from animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-01-01';
select * from animals WHERE neutered = 'true' and escape_attempts < 3;
select name, date_of_birth from animals WHERE name NOT IN ('Agumon','Pikachu');
select name, escape_attempts, weight_kg from animals WHERE weight_kg > 10.5;
select * from animals WHERE neutered = 'true';
select * from animals WHERE name NOT IN ('Gabumon');
select * from animals WHERE weight_kg BETWEEN 10.4 AND 17.3;