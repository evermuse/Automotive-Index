\c bryan;

-- clean the slate

drop database if exists indexed_cars;
drop role if exists indexed_cars_user;

-- 1 Create a new postgres user named indexed_cars_user

create user indexed_cars_user;


-- 2 Create a new database named indexed_cars owned by indexed_cars_user

create database indexed_cars owner indexed_cars_user;

set role indexed_cars_user;

-- 3 Run the provided scripts/car_models.sql script on the indexed_cars database

\i ./scripts/car_models.sql


-- 4 Run the provided scripts/car_model_data.sql script on the indexed_cars database 10 times

\i ./scripts/car_model_data.sql
\i ./scripts/car_model_data.sql
\i ./scripts/car_model_data.sql
\i ./scripts/car_model_data.sql
\i ./scripts/car_model_data.sql
\i ./scripts/car_model_data.sql
\i ./scripts/car_model_data.sql
\i ./scripts/car_model_data.sql
\i ./scripts/car_model_data.sql
\i ./scripts/car_model_data.sql

