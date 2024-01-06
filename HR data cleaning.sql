CREATE DATABASE Projects;
USE Projects;

SELECT * FROM hr;

-- Rename id column as emp_id
ALTER TABLE hr
CHANGE COLUMN ï»¿id emp_id VARCHAR(20) NULL;

-- Checking data type
DESCRIBE hr;

SELECT hire_date FROM hr;

-- Changing the birthdate format into a single format i.e. yy-mm-dd

UPDATE hr
SET birthdate = CASE
	WHEN birthdate LIKE '%/%' THEN date_format(str_to_date(birthdate, '%m/%d/%Y'), '%Y-%m-%d')
	WHEN birthdate LIKE '%-%' THEN date_format(str_to_date(birthdate, '%m-%d-%Y'), '%Y-%m-%d')
    ELSE null
END;

-- Now changing data type of birthdate column (text) to Date type
ALTER TABLE hr
MODIFY COLUMN  birthdate DATE;

-- Changing date format of hiredate column into yy-mm-dd format
UPDATE hr
SET hire_date = CASE
	WHEN hire_date LIKE '%/%' THEN date_format(str_to_date(hire_date, '%m/%d/%Y'), '%Y-%m-%d')
	WHEN hire_date LIKE '%-%' THEN date_format(str_to_date(hire_date, '%m-%d-%Y'), '%Y-%m-%d')
    ELSE null
END;

-- Now changing data type of hire_date column (text) to Date type
ALTER TABLE hr
MODIFY COLUMN  hire_date DATE;

SELECT termdate FROM hr;

-- Update termdate column into date (yyyy-mm-dd) format by removing time which is present in column 
-- and also fill the 0000-00-00 where the null value present.

UPDATE hr
SET termdate= IF(termdate IS NOT NULL AND termdate!= '', date(str_to_date(termdate, '%Y-%m-%d %H:%i:%s UTC')), '0000-00-00')
WHERE true;

-- now changing data type into date format
SET sql_mode = 'ALLOW_INVALID_DATES';

ALTER TABLE hr
MODIFY COLUMN termdate DATE;

-- To calculate the current age of each employee we add new column 'age' in the data
ALTER TABLE hr ADD COLUMN age INT;

-- Now calculate age of each employee using timestampdiff() function
UPDATE hr
SET age = timestampdiff(YEAR, birthdate, CURDATE());

-- Checking minimum and maximum age 
SELECT
	min(age) AS Youngest,
    max(age) as Oldest
FROM hr;

-- checking number of employee whose age value less than 18
SELECT COUNT(*) AS Number_of_emp FROM hr
WHERE age < 18;

-- Delete employee data whose age < 18
DELETE FROM hr WHERE age < 18;

SELECT * FROM hr;
