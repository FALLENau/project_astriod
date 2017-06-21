-- db name: space_flights_db
DROP TABLE flight_deals;
DROP TABLE deals;
DROP TABLE flights;
DROP TABLE ships;
DROP TABLE days;


CREATE TABLE days (
id SERIAL8 PRIMARY KEY,
name VARCHAR(255)
);

CREATE TABLE ships
(
id SERIAL8 PRIMARY KEY,
name VARCHAR(255),
url VARCHAR(255),
company VARCHAR(255)
);

CREATE TABLE flights
(
id SERIAL8 PRIMARY KEY,
price REAL,
time INT4,
ship_id INT8 REFERENCES ships(id)
);

CREATE TABLE deals
(
id SERIAL8 PRIMARY KEY,
name VARCHAR(255),
day_id INT8 REFERENCES days(id),
price_mod REAL
);

CREATE TABLE flight_deals
(
id SERIAL8 PRIMARY KEY,
flight_id INT8 REFERENCES flights(id),
deal_id INT8 REFERENCES deals(id)
);
