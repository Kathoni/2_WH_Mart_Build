CREATE DATABASE jobs_mart;
CREATE DATABASE IF NOT EXISTS jobs_mart;

SHOW DATABASES;

-- DROP DATABASE jobs_mart;
-- DROP DATABASE IF EXISTS jobs_mart;

-- creating and droping schemas.

SELECT *
FROM information_schema.schemata;

USE jobs_mart;

CREATE SCHEMA jobs_mart.staging;
CREATE SCHEMA IF NOT EXISTS staging;

-- DROP SCHEMA IF EXISTS staging;

CREATE TABLE IF NOT EXISTS staging.preferred_roles(
    role_id INT ,
    role_name VARCHAR(50) 
);

SELECT *
FROM information_schema.tables
WHERE table_catalog = 'jobs_mart';

-- DROP TABLE preferred_roles;

-- DROP TABLE IF EXISTS main.preferred_roles;