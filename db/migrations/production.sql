CREATE DATABASE "makersbnb";

\c makersbnb;

CREATE TABLE users(id SERIAL PRIMARY KEY,
username VARCHAR(60),
password VARCHAR(240));

CREATE TABLE spaces(id SERIAL PRIMARY KEY,
name VARCHAR(60),
description VARCHAR(240),
daily_price int4,
owner_id INTEGER REFERENCES users (id));

CREATE TABLE bookings(id SERIAL PRIMARY KEY,
space_id INTEGER REFERENCES
spaces (id), date VARCHAR(60));

CREATE TABLE dates_available(id SERIAL PRIMARY KEY,
space_id INTEGER REFERENCES
spaces(id), date VARCHAR(60));
