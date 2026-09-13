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

-- Handling Missing Data (Nulls)
-- Filter Null salary values

SELECT 
   job_title_short,
   salary_hour_avg,
   CASE
         WHEN salary_hour_avg IS NULL THEN 'Missing'
         WHEN salary_hour_avg < 25 THEN 'Low'
         WHEN salary_hour_avg >= 25 AND salary_hour_avg < 50 THEN 'Medium'
         ELSE 'High'
    END AS salary_category
FROM data_jobs.job_postings_fact
LIMIT 10;  

-- Categorizing Categorical Values
-- Clasify the 'job_title' column values as:
  -- 'Data Analyst'
  -- 'Data Engineer'
  -- 'Data Scientist'

SELECT
     job_title,
     CASE
        WHEN job_title_short LIKE '%Data%' AND job_title LIKE '%Analyst%' THEN 'Data Analyst'
        WHEN job_title_short LIKE '%Data%' AND job_title LIKE '%Engineer%' THEN 'Data Engineer'
        WHEN job_title_short LIKE '%Data%' AND job_title LIKE '%Scientist%' THEN 'Data Scientist'
        ELSE 'Other'
     END AS job_title_category,
     job_title_short
FROM job_postings_fact
ORDER BY RANDOM()  
LIMIT 20;       

-- Conditional Aggregation
-- Calculate Median Salaries for Different Buckets
 -- < $100k
 -- >= $100k

SELECT
   job_title_short,
    COUNT(*) AS total_postings,
    MEDIAN(
        CASE 
            WHEN salary_year_avg < 100000 THEN salary_year_avg
            ELSE NULL
        END
        ) AS median_low_salary,
    MEDIAN(
        CASE 
            WHEN salary_year_avg >= 100000 THEN salary_year_avg
            ELSE NULL
        END
        ) AS median_high_salary
FROM data_jobs.job_postings_fact   
wHERE salary_year_avg IS NOT NULL
GROUP BY job_title_short  ; 

-- Conditional Calculations
-- Compute a standardized_salary using yearly salary and adjusted hourly salary (e.g 2000 hours/year)
-- Categorize salaries into tiers of:
  -- < 75k 'low'
  -- 75k - 150k 'medium'
  -- > 150k 'high'
  
            