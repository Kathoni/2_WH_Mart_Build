-- Bucket salaries
-- <25 = Low
-- 25-50 = Medium
-- ? 50 = High

SELECT 
   job_title_short,
   salary_hour_avg,
   CASE
         WHEN salary_hour_avg < 25 THEN 'Low'
         WHEN salary_hour_avg >= 25 AND salary_hour_avg < 50 THEN 'Medium'
         ELSE 'High'
    END AS salary_category
FROM data_jobs.job_postings_fact
WHERE salary_hour_avg IS NOT NULL
LIMIT 10;    