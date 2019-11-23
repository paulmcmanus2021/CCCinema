DROP TABLE tickets;
DROP TABLE films;
DROP TABLE customers;

CREATE TABLE films(
  id SERIAL4 PRIMARY KEY,
  title VARCHAR,
  price INT
);

CREATE TABLE customers(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR,
  funds INT
);

CREATE TABLE tickets(
  id SERIAL4 PRIMARY KEY,
  customer_id INT REFERENCES customers(id) ON DELETE CASCADE,
  film_id INT REFERENCES films(id) ON DELETE CASCADE
);
