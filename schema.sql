/* Initialize database and navigate to it
createdb vet_clinic
psql vet_clinic */

/* Database schema to keep the structure of entire database. */
CREATE TABLE animals (
    id                INT GENERATED ALWAYS AS IDENTITY,
    name              TEXT,
    date_of_birth     DATE,
    escape_attempts   INT,
    neutered          BOOLEAN,
    weight_kg         DECIMAL,
    PRIMARY KEY(id)
);

/* Add column species of type string */
ALTER TABLE animals
ADD COLUMN species TEXT;

/* Create a table named owners with the following columns:
-id: integer (set it as autoincremented PRIMARY KEY)
- full_name: string
- age: integer */

CREATE TABLE owners (
  id         INT GENERATED ALWAYS AS IDENTITY,
  full_name   TEXT,
  age        INT,
  PRIMARY KEY(id)
);

/* Create a table named species with the following columns:
- id: integer (set it as autoincremented PRIMARY KEY)
- name: string */

CREATE TABLE species (
  id    INT GENERATED ALWAYS AS IDENTITY,
  name  TEXT,
  PRIMARY KEY(id)
);

/* Modify animals table:
- Make sure that id is set as autoincremented PRIMARY KEY
- Remove column species
- Add column species_id which is a foreign key referencing species table
- Add column owner_id which is a foreign key referencing the owners table */

ALTER TABLE animals
DROP COLUMN species,
ADD COLUMN species_id INT,
ADD CONSTRAINT species_key
  FOREIGN KEY (species_id)
    REFERENCES species(id),
ADD COLUMN owner_id INT,
ADD CONSTRAINT owner_key
  FOREIGN KEY (owner_id)
    REFERENCES owners(id);
