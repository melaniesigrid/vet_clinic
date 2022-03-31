/* Populate database with sample data. */
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Agumon', '2020-02-03', 0, 'true', 10.23);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Gabumon', '2018-11-15', 2, 'true', 8);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Pikachu', '2021-01-07', 1, 'false', 15.04);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Devimon', '2017-05-12', 5, 'true', 11);

/* Insert more animals */
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Charmander', '2020-02-08', 0, 'false', 11);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Plantmon', '2021-11-15', 2, 'true', 5.7);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Squirtle', '1993-04-02', 3, 'false', 12.13);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Angemon', '2005-06-12', 1, 'true', 45);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Boarmon', '2005-06-07', 7, 'true', 20.4);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Blossom', '1998-10-13', 3, 'true', 17);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Ditto', '2022-05-14', 4, 'true', 22);

/* Insert the following data into the owners table:
- Sam Smith 34 years old.
- Jennifer Orwell 19 years old.
- Bob 45 years old.
- Melody Pond 77 years old.
- Dean Winchester 14 years old.
- Jodie Whittaker 38 years old.*/
INSERT INTO owners (full_name, age) VALUES ('Sam Smith', 34);
INSERT INTO owners (full_name, age) VALUES ('Jennifer Orwell', 19);
INSERT INTO owners (full_name, age) VALUES ('Bob', 45);
INSERT INTO owners (full_name, age) VALUES ('Melody Pond', 77);
INSERT INTO owners (full_name, age) VALUES ('Dean Winchester', 14);
INSERT INTO owners (full_name, age) VALUES ('Jodie Whittaker', 38);

/* Insert the following data into the species table:
- Pokemon
- Digimon */

INSERT INTO species (name) VALUES ('Pokemon'), ('Digimon');

/* Modify your inserted animals so it includes the species_id value:
- If the name ends in "mon" it will be Digimon
- All other animals are Pokemon */

UPDATE animals
SET species_id = 1;

UPDATE animals
SET species_id = 2
WHERE name LIKE '%mon';

/* Modify your inserted animals to include owner information (owner_id):
- Sam Smith owns Agumon.
- Jennifer Orwell owns Gabumon and Pikachu.
- Bob owns Devimon and Plantmon.
- Melody Pond owns Charmander, Squirtle, and Blossom.
- Dean Winchester owns Angemon and Boarmon.*/

UPDATE animals SET owner_id = 1
WHERE name LIKE 'Agumon';

UPDATE animals SET owner_id = 2
WHERE name LIKE 'Gabumon' OR name LIKE 'Pikachu';

UPDATE animals SET owner_id = 3
WHERE name IN ('Devimon', 'Plantmon');

UPDATE animals SET owner_id = 4
WHERE name IN ('Charmander', 'Squirtle', 'Blossom');

UPDATE animals SET owner_id = 5
WHERE name IN ('Angemon', 'Boarmon');
