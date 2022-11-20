-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

CREATE TABLE countries
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE cities
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  country_id INTEGER NOT NULL REFERENCES countries ON DELETE CASCADE
);

CREATE TABLE airlines
(
  id SERIAL PRIMARY KEY,
  name TEXT UNIQUE
);

CREATE TABLE flights
(
  id SERIAL PRIMARY KEY,
  airline INTEGER NOT NULL REFERENCES airlines ON DELETE CASCADE,
  from_city INTEGER NOT NULL REFERENCES cities ON DELETE CASCADE,
  departure TIMESTAMP NOT NULL,
  to_city INTEGER NOT NULL REFERENCES cities ON DELETE CASCADE,
  arrival TIMESTAMP NOT NULL
);

CREATE TABLE tickets
(
  id SERIAL PRIMARY KEY,
  flight_id INTEGER NOT NULL REFERENCES flights ON DELETE CASCADE,
  passenger_first_name TEXT NOT NULL,
  passenger_last_name TEXT NOT NULL,
  seat TEXT NOT NULL
);

INSERT INTO countries (name)
VALUES ('Brazil'),
('Chile'),
('China'),
('France'),
('Japan'),
('Mexico'),
('Morocco'),
('UAE'),
('United Kingdom'),
('United States');

INSERT INTO cities (name, country_id)
VALUES ('Cedar Rapids', 10),
('Charlotte', 10),
('Chicago', 10),
('Las Vegas', 10),
('Los Angeles', 10),
('New Orleans', 10),
('New York', 10),
('Seattle', 10),
('Washington DC', 10),
('Beijing', 3),
('Casablanca', 7),
('Dubai', 8),
('London', 9),
('Mexico City', 6),
('Paris', 4),
('Santiago', 2),
('Sao Paolo', 1),
('Tokyo', 5);

INSERT INTO airlines (name)
VALUES ('United'),
('British Airways'),
('Delta'),
('TUI Fly Belgium'),
('Air China'),
('American Airlines'),
('Avianca Brasil');

INSERT INTO flights
  (departure, arrival, airline, from_city, to_city)
VALUES
  ('2018-04-08 09:00:00', '2018-04-08 12:00:00', 1, 9, 8),
  ('2018-12-19 12:45:00', '2018-12-19 16:15:00', 2, 18, 13),
  ('2018-01-02 07:00:00', '2018-01-02 08:03:00', 3, 5, 4),
  ('2018-04-15 16:50:00', '2018-04-15 21:00:00', 3, 8, 14),
  ('2018-08-01 18:30:00', '2018-08-01 21:50:00', 4, 15, 11),
  ('2018-10-31 01:15:00', '2018-10-31 12:55:00', 5, 12, 10),
  ('2019-02-06 06:00:00', '2019-02-06 07:47:00', 1, 7, 2),
  ('2018-12-22 14:42:00', '2018-12-22 15:56:00', 6, 1, 3),
  ('2019-02-06 16:28:00', '2019-02-06 19:18:00', 6, 2, 6),
  ('2019-01-20 19:30:00', '2019-01-20 22:45:00', 7, 17, 16);

INSERT INTO tickets
  (flight_id, passenger_first_name, passenger_last_name, seat)
VALUES
  (1, 'Jennifer', 'Finch', '33B'),
  (2, 'Thadeus', 'Gathercoal', '8A'),
  (3, 'Sonja', 'Pauley', '12F'),
  (4, 'Jennifer', 'Finch', '20A'),
  (5, 'Waneta', 'Skeleton', '23D'),
  (6, 'Thadeus', 'Gathercoal', '18C'),
  (7, 'Berkie', 'Wycliff', '9E'),
  (8, 'Alvin', 'Leathes', '1A'),
  (9, 'Berkie', 'Wycliff', '32B'),
  (10, 'Cory', 'Squibbes', '10D');