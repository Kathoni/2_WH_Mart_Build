DROP TABLE IF EXISTS priority_roles ;
CREATE TABLE IF NOT EXISTS staging.priority_roles(
   role_id INTEGER PRIMARY KEY,
   role_name VARCHAR,
   priority_lvl INTEGER
);

INSERT INTO staging.priority_roles (role_id, role_name, priority_lvl)
VALUES
(1, 'Data Engineer', 1),
(2, 'Senior Data Engineer', 1),
(3, 'Software Engineer', 1);

SELECT * FROM staging.priority_roles;
