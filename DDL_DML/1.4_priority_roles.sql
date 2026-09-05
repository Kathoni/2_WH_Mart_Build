CREATE OR REPLACE TABLE staging.priority_roles(
   role_id INTEGER PRIMARY KEY,
   role_name VARCHAR,
   priority_lvl INTEGER
);

INSERT INTO staging.priority_roles (role_id, role_name, priority_lvl)
VALUES
(1, 'Data Engineer', 1),
(2, 'Senior Data Engineer', 1),
(3, 'Software Engineer', 3),
(4, 'Senior Software Engineer', 3),
(5, 'Data Scientist', 2),
(6, 'Senior Data Scientist', 2),
(7, 'Machine Learning Engineer', 2),
(8, 'Senior Machine Learning Engineer', 2),
(9, 'Business Intelligence Analyst', 4),
(10, 'Business Intelligence Developer', 4),
(11, 'Data Analyst', 5),
(12, 'Senior Data Analyst', 5);

SELECT * FROM staging.priority_roles;
