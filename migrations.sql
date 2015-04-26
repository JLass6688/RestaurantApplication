

CREATE DATABASE restaurant;

\c restaurant;

CREATE TABLE users (id SERIAL PRIMARY KEY, username VARCHAR(75), password VARCHAR(15));

CREATE TABLE customers (id SERIAL PRIMARY KEY);

CREATE TABLE tables (id SERIAL PRIMARY KEY, waiter_id INTEGER, customer_id INTEGER);

CREATE TABLE orders (id SERIAL PRIMARY KEY, food_id INTEGER, customer_id INTEGER);

CREATE TABLE foods (id SERIAL PRIMARY KEY, name VARCHAR(255), description VARCHAR(255));


