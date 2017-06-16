DROP TABLE flight_deals;
DROP TABLE deals;
DROP TABLE flights;
DROP TABLE ships;
-- droping days table for now

CREATE TABLE ships;
(
id SERIAL8 PRIMARY KEY,
name VARCHAR(255)
img VARCHAR(255)
)

CREATE TABLE flights;
(
id SERIAL8 PRIMARY KEY,
price INT4
time INT4
ship_id INT8 REFERENCES ships(id),
)

CREATE TABLE deals;
(
id SERIAL8 PRIMARY KEY,
name VARCHAR(255),
-- price_mod NUMERIC
-- day_id INT8 REFERENCES days(id)
)

CREATE TABLE flight_deals;
(
id SERIAL8 PRIMARY KEY,
flight_id INT8 REFERENCES flights(id),
deal_id INT8 REFERENCES deal(id)
)
