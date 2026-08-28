DESCRIBE
SELECT
    jpf.*,
    cd.*
FROM data_jobs.job_postings_fact AS jpf
LEFT JOIN data_jobs.company_dim AS cd
    ON jpf.company_id = cd.company_id
LIMIT 10;      