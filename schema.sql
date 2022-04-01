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

/* Create a table named vets with the following columns:
- id: integer (set it as autoincremented PRIMARY KEY)
- name: string
- age: integer
- date_of_graduation: date */

CREATE TABLE vets (
  id INT GENERATED ALWAYS AS IDENTITY,
  name TEXT,
  age INT,
  date_of_graduation DATE,
  PRIMARY KEY(id)
);

/* There is a many-to-many relationship between the tables species and vets:
a vet can specialize in multiple species, and a species can have multiple vets specialized in it.
Create a "join table" called specializations to handle this relationship. */

CREATE TABLE specializations (
  vet_id INT,
  species_id INT,
  FOREIGN KEY (vet_id) REFERENCES vets(id),
  FOREIGN KEY (species_id) REFERENCES species (id),
  PRIMARY KEY (vet_id, species_id)
);

/* There is a many-to-many relationship between the tables animals and vets:
an animal can visit multiple vets and one vet can be visited by multiple animals.
Create a "join table" called visits to handle this relationship,
it should also keep track of the date of the visit. */

CREATE TABLE visits (
  animal_id INT,
  vet_id INT,
  visit_date DATE,
  FOREIGN KEY (animal_id) REFERENCES animals (id),
  FOREIGN KEY (vet_id) REFERENCES vets (id),
);
