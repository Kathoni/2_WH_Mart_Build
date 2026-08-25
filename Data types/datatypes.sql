DESCRIBE 
SELECT * 
FROM job_postings_fact;

SELECT CAST (123 AS VARCHAR(10)) AS string_value;
/*Using CAST to convert
 a numeric value to a string representation.*/

SELECT
    job_id, -- more unique identifier
    company_id,
    job_work_from_home, -- from bool to numeric
    job_posted_date, -- from timestamp to date only
    salary_year_avg  -- from double to numbers wihout a decimal place
FROM job_postings_fact
LIMIT 10;    

SELECT
    CAST(job_id AS VARCHAR) ,
    CAST(company_id AS VARCHAR),
    CAST(job_work_from_home AS INT) AS job_work_from_home,
    CAST(job_posted_date AS DATE) AS job_posted_date,
    CAST(salary_year_avg AS DECIMAL (10,0)) AS salary 
FROM job_postings_fact
WHERE salary_year_avg IS NOT NULL
LIMIT 10;    