\c bryan;

-- clean the slate
  -- use if exists so the query doesn't error out

drop database if exists indexed_cars;
drop role if exists indexed_cars_user;

-- 1 Create a new postgres user named indexed_cars_user

create user indexed_cars_user;


-- 2 Create a new database named indexed_cars owned by indexed_cars_user

create database indexed_cars owner indexed_cars_user;
-- common convention to create specific user for a database

-- connect as that user

\c indexed_cars;

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


-- Timing Select Statements
-- 1 get a list of all make_title values from the car_models table where the make_code is 'LAM', without any duplicate rows

select distinct make_title from car_models where make_code = 'LAM'; -- can also use: group by make_title; -- Time ( 29.289 ms )


-- 2 list all model_title values where the make_code is 'NISSAN', and the model_code is 'GT-R' without any duplicate rows -- Time ( 22.333 ms )

select distinct model_title from car_models where make_code = 'NISSAN' AND model_code = 'GT-R';


--3 list all make_code, model_code, model_title, and year from car_models where the make_code is 'LAM' -- Time ( 22.935 ms )
    -- \pset pager <-- will turn off pagination of results

select make_code, model_code, model_title, year from car_models where make_code = 'LAM';


-- 4 list all fields from all car_models in years between 2010 and 2015 -- Time ( 66.383 ms )

select * from car_models where year > 2009 AND year < 2016;


-- 5 list all fields from all car_models in the year of 2010 -- Time ( 32.599 ms )

select * from car_models where year = 2010;


-- Indexing
  -- Create indexes on the columns that would improve query performance

create index make_title_index on car_models (make_title);
create index model_title_index on car_models (model_title);
create index make_code_index on car_models (make_code);
create index model_code_index on car_models (model_code);
create index year_index on car_models (year);


-- 1.b list of all make_title values from the car_models table where the make_code is 'LAM', without any duplicate rows Time ( 29.289 ms )

select distinct make_title from car_models where make_code = 'LAM'; -- time w/ index ( 21.756 ms )


-- 2b list all model_title values where the make_code is 'NISSAN', and the model_code is 'GT-R' without any duplicate rows -- Time ( 22.333 ms )

select distinct model_title from car_models where make_code = 'NISSAN' AND model_code = 'GT-R'; -- time w/ index ( 1.295 ms )


--3b list all make_code, model_code, model_title, and year from car_models where the make_code is 'LAM' -- Time ( 22.935 ms )

select make_code, model_code, model_title, year from car_models where make_code = 'LAM'; -- time w/ index ( 0.893 ms )


-- 4b list all fields from all car_models in years between 2010 and 2015 -- Time ( 66.383 ms )

select * from car_models where year > 2009 AND year < 2016; -- time w/ index ( 55.570 ms )


-- 5b list all fields from all car_models in the year of 2010 -- Time ( 32.599 ms )

select * from car_models where year = 2010; -- time w/ index ( 11. 737 ms )


-- Indexing on table create
