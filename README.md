# HR-Dashboard(SQL-PowerBI)
![Dashboard img](https://github.com/kiransuryaa/HR-Dashboard-SQL-PowerBI-/assets/141052509/d71d68ad-c9e0-4ac7-9c16-ed093d6b57eb)

## Data Used

**Data** - Human Resources data having records more than 22000 from the year 2000-2020.

**Data Cleaning & Analysis** - MySQL Workbench

**Data Visualization** - PowerBI

## Data Analysis(Questions)

1. What is the gender breakdown of employees in the company?
2. What is the race/ethnicity breakdown of employees in the company?
3. What is the age distribution of employees in the company?
4. How many employees work at headquarters versus remote locations?
5. What is the average length of employment for employees who have been terminated?
6. How does the gender distribution vary across departments and job titles?
7. What is the distribution of job titles across the company?
8. Which department has the highest turnover rate?
9. What is the distribution of employees across locations by state?
10. How has the company's employee count changed over time based on hire and term dates?
11. What is the tenure distribution for each department?

## Summary 

1. There are more Male employees than Female.
2. The youngest employee is 20 years old and the oldest is 57 years old.
3. 5 age groups were created (18-24, 25-34, 35-44, 45-54, 55-64). A large number of employees were between 25-34 followed by 35-44 while the smallest group was 55-64.
4. White race is the most dominant while Native Hawaiian and American Indian are the least dominant.
5. A large number of employees work at the headquarters versus remotely.
6. The average length of employment for terminated employees is around 8 years.
7. The gender distribution across departments is fairly balanced but there are generally more male than female employees.
8. The Auditing department has the highest turnover rate followed by Legal. The least turn over rate are in the Business Developement, Marketing departments.
9. A large number of employees come from the state of Ohio.
10. The net change in employees has increased over the years.

## Note

- Some records had negative ages and these were excluded during querying(967 records). Ages used were 18 years and above.
- Some termdates were far into the future and were not included in the analysis(1599 records). The only term dates used were those less than or equal to the current date.
