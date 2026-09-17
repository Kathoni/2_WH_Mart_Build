SELECT 
    job_posted_date,
    job_posted_date::DATE AS date,
    job_posted_date::TIME AS time,
    job_posted_date::TIMESTAMP AS timestamp,
    job_posted_date::TIMESTAMPTZ AS timestamptz
FROM job_postings_fact
LIMIT 10;

-- EXTRACT function
SELECT 
    EXTRACT(YEAR FROM job_posted_date) AS job_posted_year,
    EXTRACT(MONTH FROM job_posted_date) AS job_posted_month,
    COUNT(job_id) AS job_count
FROM job_postings_fact
WHERE job_title_short = 'Data Engineer'
GROUP BY
     EXTRACT(YEAR FROM job_posted_date),
     EXTRACT(MONTH FROM job_posted_date) 
ORDER BY  
     job_posted_year,
     job_posted_month   
;    
-- DATE_TRUNC function
SELECT
    job_posted_date,
    DATE_TRUNC('month', job_posted_date) AS truncated_month,
    DATE_TRUNC('year', job_posted_date) AS truncated_year,
    DATE_TRUNC('quarter', job_posted_date) AS truncated_quarter,
    DATE_TRUNC('week', job_posted_date) AS truncated_week,
    DATE_TRUNC('day', job_posted_date) AS truncated_day,
    DATE_TRUNC('hour', job_posted_date) AS truncated_hour
FROM job_postings_fact
ORDER BY RANDOM()
LIMIT 10;    

SELECT 
    DATE_TRUNC('month', job_posted_date) AS job_posted_month,
    COUNT(job_id) AS job_count
FROM job_postings_fact
WHERE 
    job_title_short = 'Data Engineer' AND 
   -- EXTRACT(YEAR FROM job_posted_date) = 2024
     DATE_TRUNC('year', job_posted_date) = '2024-01-01'
GROUP BY
     DATE_TRUNC('month', job_posted_date)
ORDER BY  
     job_posted_month   
;    

-- AT TIME ZONE function
SELECT
    '2027-01-01 00:00:00+00'::TIMESTAMPTZ AT TIME ZONE 'EAT';

SELECT
    job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'EST'
FROM job_postings_fact
LIMIT 10;        