DROP TABLE tickets;
DROP TABLE screenings;
DROP TABLE films;
DROP TABLE customers;

CREATE TABLE films(
  id SERIAL4 PRIMARY KEY,
  title VARCHAR,
  price INT
);

CREATE TABLE screenings(
  id SERIAL4 PRIMARY KEY,
  film_id INT REFERENCES films(id) ON DELETE CASCADE,
  showtimes VARCHAR
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
