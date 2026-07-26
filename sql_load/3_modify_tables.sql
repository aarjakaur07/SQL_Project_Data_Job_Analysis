SELECT 
    job_title_short AS title,
    job_location AS location,
    job_posted_date::Date AS date
FROM
    job_postings_fact;