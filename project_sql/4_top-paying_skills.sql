/*
Answer: What are the top skills based on salary?
- Look at the average salary associated with each skill for Data Analyst positions
- Focuses on roles with specified salaries, regardless of location
- Why? It reveals how different skills impact salary levels for Data Analysts and
  helps identify the most financially rewarding skills to acquire or improve
*/

SELECT 
skills,
ROUND(AVG(salary_year_avg),1)  AS AVG_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON skills_job_dim.job_id = job_postings_fact.job_id
INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
WHERE job_title_short ='Data Analyst' AND salary_year_avg IS NOT NULL 
GROUP BY
    skills 
ORDER BY 
  AVG_salary DESC
LIMIT 10;

/*
Insights: 

1. Niche and Emerging Skills Drive Top Pay: Specialized skills like SVN ($400,000), 
Solidity ($179,000), and Couchbase ($160,515) dominate the high-paying bracket, 
reflecting their importance in legacy systems, blockchain technology, and large-scale database management.

2. AI/ML and Cloud Expertise are Key: Machine learning frameworks like DataRobot ($155,485.5), 
Hugging Face ($123,950), and TensorFlow ($120,646.8), along with cloud/DevOps tools like Terraform ($146,733.8), 
emphasize the demand for advanced analytics, automation, and scalable cloud infrastructure.

3. Demand for Collaborative and Real-Time Tools: High-paying tools like GitLab ($134,126), 
Kafka ($129,999.2), and Twilio ($138,500) highlight the critical role of collaboration, 
real-time data processing, and communication APIs in modern software ecosystems.

*/