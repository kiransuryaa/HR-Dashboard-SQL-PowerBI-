-- 1. What is the gender breakdown of employee in the company?
SELECT gender, COUNT(*) AS Count FROM hr
WHERE termdate = '0000-00-00'
GROUP BY gender;

-- 2. What is the race/ethnicity breakdown of employees in the company?
SELECT race, COUNT(*) AS Count FROM hr
WHERE termdate = '0000-00-00'
GROUP BY race
ORDER BY Count DESC;

-- 3. What is the age distribution of employees in the company?
SELECT 
	CASE
		WHEN age >= 18 AND age <=24 THEN '18-24'
        WHEN age >= 25 AND age <=34 THEN '25-34'
        WHEN age >= 35 AND age <=44 THEN '35-44'
        WHEN age >= 45 AND age <=54 THEN '45-54'
        WHEN age >= 55 AND age <=64 THEN '55-64'
        ELSE '65+'
	END AS age_group,
    COUNT(*) AS Count
FROM hr
WHERE termdate = '0000-00-00'
GROUP BY age_group
ORDER BY age_group;


SELECT 
	CASE
		WHEN age >= 18 AND age <=24 THEN '18-24'
        WHEN age >= 25 AND age <=34 THEN '25-34'
        WHEN age >= 35 AND age <=44 THEN '35-44'
        WHEN age >= 45 AND age <=54 THEN '45-54'
        WHEN age >= 55 AND age <=64 THEN '55-64'
        ELSE '65+'
	END AS age_group,
    gender,
    COUNT(*) AS Count
FROM hr
WHERE termdate = '0000-00-00'
GROUP BY age_group, gender
ORDER BY age_group, gender;

-- 4. How many employees work at headquarters verses remote locations?
SELECT location, COUNT(*) AS Count FROM hr
WHERE termdate = '0000-00-00'
GROUP BY location;

-- 5. What is the average length of employment for employees who have been terminated?
SELECT
	round(AVG(datediff(termdate, hire_date)/365), 0) AS avg_length_employement
FROM hr
WHERE termdate <= curdate() AND termdate != '0000-00-00';

-- 6. How does the gender distribution vary across departments?
SELECT department, gender, COUNT(*) AS Count
FROM hr
WHERE termdate = '0000-00-00'
GROUP BY department, gender
ORDER BY department;
 
-- 7. What is the distribution of job titles across the company?
SELECT jobtitle, COUNT(*) AS Count
FROM hr
WHERE termdate = '0000-00-00'
GROUP BY jobtitle
ORDER BY jobtitle DESC; 

-- 8. Which department has the highest turnover rate?
SELECT
	department,
    total_count,
    terminated_count,
    terminated_count/total_count AS termination_rate
FROM(
	SELECT department, COUNT(*) AS total_count,
	SUM(CASE WHEN termdate <> '0000-00-00' AND termdate <= curdate() THEN 1 ELSE 0 END) AS terminated_count
	FROM hr
	GROUP BY department
    ) AS subquery
    ORDER BY termination_rate DESC;

-- 9. What is the distribution of employees across locations by state?
SELECT location_state, COUNT(*) AS Count
FROM hr
WHERE termdate = '0000-00-00'
GROUP BY location_state
ORDER BY Count DESC;

-- 10. How has the company's employee count changed over time based on hire and term dates?
SELECT
	 year,
     hires,
     termination,
     hires-termination AS net_change,
     round((hires-termination)/hires * 100, 2) AS net_change_percent
FROM(
	SELECT
		YEAR(hire_date) AS year,
		COUNT(*) AS hires,
		SUM(CASE WHEN termdate != '0000-00-00' AND termdate<=curdate() THEN 1 ELSE 0 END) AS termination
	FROM hr
	GROUP BY YEAR(hire_date)
    ) AS subquery
ORDER BY year;

-- 11. What is the tenure distribution for each department?
SELECT department, ROUND(AVG(datediff(termdate, hire_date)/365),0) AS avg_tenure
FROM hr
WHERE termdate <> '0000-00-00' AND termdate<= curdate()
GROUP BY department;
