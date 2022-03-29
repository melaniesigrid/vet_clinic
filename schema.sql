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
