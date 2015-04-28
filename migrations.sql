

CREATE DATABASE restaurant;

\c restaurant;

CREATE TABLE users (id SERIAL PRIMARY KEY, username VARCHAR(255), password_hash VARCHAR(255));

CREATE TABLE parties (id SERIAL PRIMARY KEY, table_num INTEGER, party_size INTEGER, paid BOOLEAN, user_id INTEGER);

CREATE TABLE orders (id SERIAL PRIMARY KEY, food_id INTEGER, party_id INTEGER, no_charge BOOLEAN);

CREATE TABLE foods (id SERIAL PRIMARY KEY, name VARCHAR(255), cuisine_type VARCHAR(255), cents INTEGER, nut_allergens BOOLEAN, gluten_allergens BOOLEAN);


