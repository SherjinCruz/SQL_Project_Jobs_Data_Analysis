/*
Look at companies that don’t require a degree 
- Degree requirements are in the job_posting_fact table
- Use subquery to filter this in the company_dim table for company_names
- Order by the company name alphabetically
*/

SELECT
    company_id,
    name as company_name
FROM
    company_dim
WHERE
    company_id IN (SELECT company_id
    FROM job_postings_fact
    WHERE job_no_degree_mention = TRUE)
ORDER BY
    company_name ASC;

/*
Find the companies that have the most job openings. 
- Get the total number of job postings per company id (job_posting_fact)
- Return the total number of jobs with the company name (company_dim)
*/

WITH company_count AS (
SELECT
    COUNT(*) as job_count,
    company_id
FROM
    job_postings_fact
GROUP BY
    company_id)

SELECT
    cc.job_count,
    cd.name as company_name
FROM 
    company_dim cd
LEFT JOIN  company_count cc
ON cd.company_id = cc.company_id
ORDER BY
    job_count DESC;