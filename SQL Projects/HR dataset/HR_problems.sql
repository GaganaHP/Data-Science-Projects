create database if not exists Human_resource;
use Human_resource;

# 1. Retrieve all employees who are still currently employed.
SELECT * 
FROM employees 
WHERE Termd = 0;


# 2. Count the number of active and terminated employees.
SELECT 
  Termd, 
  COUNT(*) AS total 
FROM employees 
GROUP BY Termd;


# 3. Find the average salary by department.
SELECT 
  Department, 
  AVG(Salary) AS avg_salary 
FROM employees 
GROUP BY Department;


# 4. List top 5 highest paid employees.
SELECT 
  Employee_Name, 
  Salary 
FROM employees 
ORDER BY Salary DESC 
LIMIT 5;

alter table employees rename column ï»¿Employee_Name to Employee_Name;



# 5. Find the number of employees hired each year.
SELECT 
  YEAR(DateofHire) AS hire_year, 
  COUNT(*) AS num_hired 
FROM employees 
GROUP BY hire_year 
ORDER BY hire_year;


# 6. Show the average EngagementSurvey score by performance score.
SELECT 
  PerformanceScore, 
  ROUND(AVG(EngagementSurvey), 2) AS avg_engagement 
FROM employees 
GROUP BY PerformanceScore;



# 7. Get the number of absences for each manager.
SELECT 
  ManagerName, 
  SUM(Absences) AS total_absences 
FROM employees 
GROUP BY ManagerName 
ORDER BY total_absences DESC;


# 8. List employees who were terminated due to performance.
SELECT 
  Employee_Name, 
  TermReason, 
  DateofTermination 
FROM employees 
WHERE TermReason LIKE '%performance%';



# 9. Find the average salary by race and gender.
SELECT 
  RaceDesc, 
  Sex, 
  AVG(Salary) AS avg_salary 
FROM employees 
GROUP BY RaceDesc, Sex;



# 10. Identify employees with more than 10 absences and less than 3 satisfaction score.
SELECT 
  Employee_Name, 
  Absences, 
  EmpSatisfaction 
FROM employees 
WHERE Absences > 10 AND EmpSatisfaction < 3;




