DROP TABLE IF EXISTS owners;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS animals;



CREATE TABLE customers (
  id SERIAL4 PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  appointment VARCHAR(255),
  requirements VARCHAR(255)
);

CREATE TABLE animals (
  id SERIAL4 PRIMARY KEY,
  animal_name VARCHAR(255),
  species VARCHAR(255),
  age INT2,
  training VARCHAR(255),
  adoptable VARCHAR(255),
  admission_date DATE,
  description VARCHAR(255)
);

CREATE TABLE owners
(
  id SERIAL8 primary key,
  customer_id INT8 references customers(id),
  animal_id INT8 references animals(id)
);
