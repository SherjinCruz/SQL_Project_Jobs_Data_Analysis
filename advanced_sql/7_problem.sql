/*
Find the count of the number of remote job postings per skill
    - Display the top 5 skills by their demand in remote jobs
    - Include skill ID, name, and count of postings requiring the skill
*/

WITH remote_jobs AS(
    SELECT
        sjd.skill_id,
        COUNT(sjd.*) as skill_count
    FROM
        skills_job_dim sjd
    LEFT JOIN  job_postings_fact jpc
    ON sjd.job_id = jpc.job_id
    WHERE
        jpc.job_work_from_home = TRUE AND
        jpc.job_title_short = 'Data Analyst'
)

SELECT
    skill_id,
    skills as skill_name,
    skill_count
FROM
    remote_jobs rj
LEFT JOIN skills_dim sd
ON sd.skill_id = rj.skill_id
ORDER BY
    skills DESC
LIMIT 5;