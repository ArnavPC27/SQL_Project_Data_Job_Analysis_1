# Introduction 
📊 Dive into the data job market! Focusing on data analyst roles, this project explores 💰 top-paying jobs, 🔥 in-demand skills, and 📈 where high demand meets high salary in data analytics.

💡 SQL queries? Check them out here: [project_sql folder](/project_sql/)

# Background
Driven by a quest to navigate the data analyst job market more effectively, this project was born from a desire to pinpoint top-paid and in-demand skills, streamlining others' work to find optimal jobs.

Data hails from my [SQL Course](https://lukebarousse.com/sql). It’s packed with insights on job titles, salaries, locations, and essential skills.

### The questions I wanted to answer through my SQL queries were:
1. What are the top-paying data analyst jobs?
2. What skills are required for these top-paying jobs?
3. What skills are most in demand for data analysts?
4. Which skills are associated with higher salaries?
5. What are the most optimal skills to learn?
# Tools I Used 
For my deep dive into the data analyst job market, I harnessed the power of several key tools:

- SQL: The backbone of my analysis, allowing me to query the database and unearth critical insights.
- PostgreSQL: The chosen database management system, ideal for handling the job posting data.
- Visual Studio Code: My go-to for database management and executing SQL queries.
- Git & GitHub: Essential for version control and sharing my SQL scripts and analysis, ensuring collaboration and project tracking.

# The Analysis 
### 1. Top Paying Data Analyst Jobs

```sql
SELECT
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    name as company_name
FROM job_postings_fact
lEFT JOIN company_dim on job_postings_fact.company_id= company_dim.company_id
Where job_title_short ='Data Analyst' AND job_location = 'Anywhere' AND
    salary_year_avg IS NOT NULL
ORDER BY salary_year_avg DESC
LIMIT 10;

```

## Top 5 Highest Paying Jobs

## Top Job Opportunities

| Job ID   | Job Title                        | Company Name                 | Job Location | Schedule Type | Average Salary (Yearly) | Posted Date           |
|----------|----------------------------------|------------------------------|--------------|---------------|--------------------------|-----------------------|
| 226942   | Data Analyst                     | Mantys                       | Anywhere     | Full-time     | ₹650,000.0              | 2023-02-20 15:13:33  |
| 547382   | Director of Analytics            | Meta                         | Anywhere     | Full-time     | ₹336,500.0              | 2023-08-23 12:04:42  |
| 552322   | Associate Director- Data Insights| AT&T                         | Anywhere     | Full-time     | ₹255,829.5              | 2023-06-18 16:03:12  |
| 99305    | Data Analyst, Marketing          | Pinterest Job Advertisements | Anywhere     | Full-time     | ₹232,423.0              | 2023-12-05 20:00:40  |
| 1021647  | Data Analyst (Hybrid/Remote)     | Uclahealthcareers            | Anywhere     | Full-time     | ₹217,000.0              | 2023-01-17 00:17:23  |




1. **Top-Paying Roles and Sectors:** The highest-paying role, Data Analyst at Mantys, offers ₹650,000 annually, nearly double the next highest-paying job. Other top roles include Director of Analytics (Meta) and Associate Director- Data Insights (AT&T), reflecting the universal demand for analytics across industries like technology, telecommunications, and healthcare.

2. **Remote Work Flexibility:** All top-paying jobs are listed as "Anywhere", emphasizing the growing trend of remote work in analytics, making these roles attractive to a broader pool of candidates globally.

3. **Timeliness of Opportunities:** Recent postings like Data Analyst, Marketing at Pinterest (December 2023) present immediate opportunities, while older postings such as Uclahealthcareers (January 2023) may no longer be active, highlighting the importance of applying promptly.

4. **Skills and Strategy for Success:** Candidates should focus on mastering advanced analytics tools, leadership skills, and domain expertise. Prioritizing applications for recently posted roles and targeting high-demand sectors can maximize job prospects in this competitive field.

### 2. Skills for Top Paying Jobs
``` sql
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

```
**Tools Required for Data Analytics Jobs:**
SQL ,Python ,Tableau , R , Snowflake, Pandas, Excel.
Other notable skills include Azure, Power BI, AWS, and Numpy.

**Insights:**
1. Proficiency in SQL, Python, and Tableau appears crucial for high-paying jobs.
2. Data manipulation tools like Pandas and spreadsheet skills like Excel are also valuable.
3. Cloud computing platforms (AWS, Azure, Snowflake) and data visualization tools (Power BI, Tableau) are highly sought after.

### 3. In-Demand Skills for Data Analysts
```sql
SELECT 
skills,
count(skills_job_dim.job_id) AS skill_demand
FROM job_postings_fact
INNER JOIN skills_job_dim ON skills_job_dim.job_id = job_postings_fact.job_id
INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
WHERE job_title_short ='Data Analyst' AND job_location = 'Anywhere'
GROUP BY
    skills 
ORDER BY 
    skill_demand DESC
LIMIT 5;
```
## Skill Demand Analysis

| Skill     | Demand  |
|-----------|---------|
| SQL       | 7,291   |
| Excel     | 4,611   |
| Python    | 4,330   |
| Tableau   | 3,745   |
| Power BI  | 2,609   |


The top skills for data analytics include SQL, Excel, Python, Tableau, and Power BI, reflecting their high demand in the industry. Mastering these tools enables professionals to efficiently manage, analyze, and visualize data for strategic decision-making.

4. Skills bases on Salary

``` Sql
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
LIMIT 25;
```
## Top Skills by Average Salary

| Skill        | Average Salary (Yearly) |
|--------------|--------------------------|
| SVN          | ₹400,000.0              |
| Solidity     | ₹179,000.0              |
| Couchbase    | ₹160,515.0              |
| DataRobot    | ₹155,485.5              |
| GoLang       | ₹155,000.0              |
| MXNet        | ₹149,000.0              |
| dplyr        | ₹147,633.3              |
| VMware       | ₹147,500.0              |
| Terraform    | ₹146,733.8     


**Insights:** 

1. Niche and Emerging Skills Drive Top Pay: Specialized skills like SVN ($400,000), 
Solidity ($179,000), and Couchbase ($160,515) dominate the high-paying bracket, 
reflecting their importance in legacy systems, blockchain technology, and large-scale database management.

2. AI/ML and Cloud Expertise are Key: Machine learning frameworks like DataRobot ($155,485.5), 
Hugging Face ($123,950), and TensorFlow ($120,646.8), along with cloud/DevOps tools like Terraform ($146,733.8), 
emphasize the demand for advanced analytics, automation, and scalable cloud infrastructure.

3. Demand for Collaborative and Real-Time Tools: High-paying tools like GitLab ($134,126), 
Kafka ($129,999.2), and Twilio ($138,500) highlight the critical role of collaboration, 
real-time data processing, and communication APIs in modern software ecosystems.

### 5. Most Optimal Skills to Learn 

```sql
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
```

## Skills Demand and Average Salary

| Skill ID | Skill       | Demand | Average Salary (Yearly) |
|----------|-------------|--------|--------------------------|
| 0        | SQL         | 398    | ₹96,435                 |
| 181      | Excel       | 256    | ₹86,419                 |
| 1        | Python      | 236    | ₹101,512                |
| 182      | Tableau     | 230    | ₹97,978                 |
| 5        | R           | 148    | ₹98,708                 |
| 183      | Power BI    | 110    | ₹92,324                 |
| 7        | SAS         | 63     | ₹93,707                 |
| 186      | SAS         | 63     | ₹93,707                 |
| 196      | PowerPoint  | 58     | ₹88,316                 |
| 185      | Looker      | 49     | ₹103,855                |


**Insights:**
1. High-Demand Skills: SQL and Excel are the most in-demand skills with 398 and 256 job postings respectively, though they offer moderate average salaries of ₹96,435 and ₹86,419.

2. Top-Paying Skills: Looker (₹103,855) and Python (₹101,512) command the highest salaries, despite Looker having lower demand (49 postings), highlighting the value of niche expertise.

3. Balanced Demand and Pay: Skills like Tableau and R offer a strong balance, with decent demand (230 and 148 postings) and salaries near ₹98,000, making them critical for visualization and statistical analysis roles.

4. Skill Strategy: Focus on high-demand tools like SQL and Excel for broad opportunities while pursuing niche skills like Looker or R for specialized, higher-paying roles.



# What I Learned 

Throughout this adventure, I've turbocharged my SQL toolkit with some serious firepower:

- 🧩 Complex Query Crafting: Mastered the art of advanced SQL, merging tables like a pro and wielding WITH clauses for ninja-level temp table maneuvers.
- 📊 Data Aggregation: Got cozy with GROUP BY and turned aggregate functions like COUNT() and AVG() into my data-summarizing sidekicks.
- 💡 Analytical Wizardry: Leveled up my real-world puzzle-solving skills, turning questions into actionable, insightful SQL queries.


# Conclusions

### Insights
From the analysis, several general insights emerged:

1. **Top-Paying Data Analyst Jobs:** The highest-paying jobs for data analysts that allow remote work offer a wide range of salaries, the highest at $650,000!

2. **Skills for Top-Paying Jobs:** High-paying data analyst jobs require advanced proficiency in SQL, suggesting it’s a critical skill for earning a top salary.

3. **Most In-Demand Skills:** SQL is also the most demanded skill in the data analyst job market, thus making it essential for job seekers.

4. **Skills with Higher Salaries:** Specialized skills, such as SVN and Solidity, are associated with the highest average salaries, indicating a premium on niche expertise.

5. **Optimal Skills for Job Market Value:** SQL leads in demand and offers a high average salary, positioning it as one of the most optimal skills for data analysts to learn to maximize their market value.
