/*
Answer: What are the top skills based on salary?
- Look at the average salary associated with each skill for Data Analyst positions.
- Focuses on roles with specified salaries, regardless of location.
- Why? It reveals how different skills impact salary levels for Data Analysts and
    helps identify the most financially rewarding skills to acquire or improve.
*/

SELECT 
    skills,
    ROUND(AVG(salary_year_avg), 0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE  
    job_title_short = 'Data Analyst' 
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home = TRUE
GROUP BY   
    skills
ORDER BY
    avg_salary DESC
LIMIT 25

/*
The analysis of the top 25 highest-paying data analyst skills reveals a clear 
shift toward professionals who combine data analysis expertise with big data, cloud, and engineering capabilities.

- Big Data & Cloud technologies command the highest salaries: Skills such as PySpark, Databricks, GCP, and Airflow 
dominate the list, highlighting the increasing demand for analysts who can work with large-scale, cloud-based data systems.
- Python remains the foundation of high-paying roles: Core Python tools like Pandas, NumPy, Jupyter, and Scikit-learn appear frequently, 
emphasizing the importance of programming, data manipulation, and machine learning skills.
- Cross-functional technical skills increase earning potential: Knowledge of DevOps tools, databases, and collaboration platforms 
(e.g., Kubernetes, GitLab, PostgreSQL, Linux) is associated with higher salaries, showing that employers value analysts who can contribute beyond traditional data analysis.
*/