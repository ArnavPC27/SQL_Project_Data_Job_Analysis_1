
/*
Question: What skills are required for the top-paying data analyst jobs?
- Use the top 10 highest-paying Data Analyst jobs from first query
- Add the specific skills required for these roles
- Why? It provides a detailed look at which high-paying jobs demand certain skills
*/

WITH top_paying_jobs AS (

SELECT
    job_id,
    job_title,
    salary_year_avg,
    name as company_name
FROM    
job_postings_fact
lEFT JOIN company_dim on job_postings_fact.company_id = company_dim.company_id
Where 
    job_title_short ='Data Analyst' AND job_location = 'Anywhere' AND
    salary_year_avg IS NOT NULL
ORDER BY 
    salary_year_avg DESC
LIMIT 10
)
SELECT 
    top_paying_jobs.*,
    skills
FROM top_paying_jobs
INNER JOIN skills_job_dim ON skills_job_dim.job_id = top_paying_jobs.job_id
INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
ORDER BY salary_year_avg DESC;

/*
The most important skills based on frequency in the dataset are:

SQL - Required for 8 jobs.
Python - Required for 7 jobs.
Tableau - Required for 6 jobs.
R - Required for 4 jobs.
Snowflake, Pandas, Excel - Each required for 3 jobs.
Other notable skills include Azure, Power BI, AWS, and Numpy, each appearing twice.

Insights:
Proficiency in SQL, Python, and Tableau appears crucial for high-paying jobs.
Data manipulation tools like Pandas and spreadsheet skills like Excel are also valuable.
Cloud computing platforms (AWS, Azure, Snowflake) and data visualization tools (Power BI, Tableau) are highly sought after.
*/
