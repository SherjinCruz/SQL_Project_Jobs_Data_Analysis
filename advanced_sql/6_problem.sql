-- January Jobs

CREATE TABLE january_jobs AS
SELECT *
FROM job_postings_fact
WHERE   
    EXTRACT(MONTH FROM job_postings_fact) = 1;

-- February Jobs

CREATE TABLE february_jobs AS
SELECT *
FROM job_postings_fact
WHERE   
    EXTRACT(MONTH FROM job_postings_fact) = 2;

-- March Jobs

CREATE TABLE march_jobs AS
SELECT *
FROM job_postings_fact
WHERE   
    EXTRACT(MONTH FROM job_postings_fact) = 3;   