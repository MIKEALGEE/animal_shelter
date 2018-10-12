DROP TABLE IF EXISTS owners;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS animals;



CREATE TABLE customers (
  id SERIAL4 PRIMARY KEY,
  first_name VARCHAR(255) NULL,
  last_name VARCHAR(255) NULL,
  appointment VARCHAR(255) NULL,
  requirements VARCHAR(255) NULL
);

CREATE TABLE animals (
  id SERIAL4 PRIMARY KEY,
  animal_name VARCHAR(255) NULL,
  species VARCHAR(255) NULL,
  age INT2 NULL,
  training VARCHAR(255) NULL,
  adoptable VARCHAR(255) NULL,
  admission_date DATE NULL,
  description VARCHAR(255) NULL,
  image VARCHAR(255) NULL,
  video VARCHAR(255) NULL
);

CREATE TABLE owners(
  id SERIAL8 PRIMARY KEY,
  customers_id INT8 REFERENCES  customers(id) ON DELETE CASCADE,
  animals_id INT8 REFERENCES animals(id) ON DELETE CASCADE
)
