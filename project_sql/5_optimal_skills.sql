/*

Answer: What are the most optimal skills to learn (aka it’s in high demand and a high-paying skill)?

Identify skills in high demand and associated with high average salaries for Data Analyst roles
Concentrates on remote positions with specified salaries
Why? Targets skills that offer job security (high demand) and financial benefits (high salaries), offering strategic insights for career development in data analysis

*/

WITH skills_demand AS (
SELECT  
skills_dim.skill_id,
skills_dim.skills,
count(skills_job_dim.job_id) AS skill_demand
FROM job_postings_fact
INNER JOIN skills_job_dim ON skills_job_dim.job_id = job_postings_fact.job_id
INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
WHERE job_title_short ='Data Analyst' AND job_location = 'Anywhere' AND salary_year_avg IS NOT NULL 
GROUP BY
skills_dim.skill_id
),

 avg_salary AS(

SELECT 
skills_dim.skill_id,
skills_dim.skills,
ROUND(AVG(salary_year_avg),0)  AS AVG_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON skills_job_dim.job_id = job_postings_fact.job_id
INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
WHERE job_title_short ='Data Analyst' AND salary_year_avg IS NOT NULL 
GROUP BY
skills_dim.skill_id
)

SELECT 
    skills_demand.skill_id,
    avg_salary.skills,
    skill_demand,
    AVG_salary
FROM 
    skills_demand
    INNER JOIN avg_salary ON skills_demand.skill_id = avg_salary.skill_id
    WHERE skill_demand>10

ORDER BY
skill_demand DESC,
AVG_salary DESC




