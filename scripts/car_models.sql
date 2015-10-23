-- db indexed_cars

CREATE TABLE IF NOT EXISTS car_models
(
 id serial,
 make_code character varying(125) NOT NULL,
 make_title character varying(125) NOT NULL,
 model_code character varying(125) NOT NULL,
 model_title character varying(125) NOT NULL,
 year integer NOT NULL,
 PRIMARY KEY (id)
);

create index make_title_index on car_models (make_title);
create index model_title_index on car_models (model_title);
create index make_code_index on car_models (make_code);
create index model_code_index on car_models (model_code);
create index year_index on car_models (year);