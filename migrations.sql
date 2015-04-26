

CREATE DATABASE restaurant;

\c restaurant;

CREATE TABLE users (id SERIAL PRIMARY KEY, username VARCHAR(255), password_hash VARCHAR(255));

CREATE TABLE customers (id SERIAL PRIMARY KEY, table_id INTEGER);

CREATE TABLE tables (id SERIAL PRIMARY KEY, user_id INTEGER);

CREATE TABLE orders (id SERIAL PRIMARY KEY, menuitem_id INTEGER, customer_id INTEGER);

CREATE TABLE menuitems (id SERIAL PRIMARY KEY, name VARCHAR(255), description VARCHAR(255));


