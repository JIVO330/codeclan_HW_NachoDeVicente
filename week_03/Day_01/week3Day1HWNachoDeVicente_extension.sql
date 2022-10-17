--Q1

SELECT *
FROM employees 
WHERE department = 'Human Resources';


--Q2
--last_name,first_name,country in legal department
SELECT *
FROM employees 
WHERE  department = 'Legal'  
ORDER BY country


/* NO WORK
SELECT 
    first_name,
    Last_name,
    FROM employees ;
    WHERE department ='Legal'
     ORDER BY country
*/


--Q3 number employees in Portugal
SELECT count(employees)
FROM  employees 
WHERE country = 'Portugal'

--Q4 number employees either Portugal AND spain

SELECT count(employees)
FROM employees 
WHERE country IN  ('portugal', 'Spain')



--Q5 pay_details lacking local_account_no

SELECT count(local_account_no)
FROM pay_details  


--Q6 NULL of pay_details both local_account_no and iban

SELECT* 
FROM pay_details 
WHERE local_account_no  IS NULL  AND 
iban IS NULL 

--Answer. NO, only with local_account_no

--Q7table, first_name, last_name Null last
SELECT 
   first_name,
   Last_name
 FROM employees  
 ORDER BY last_name NULLS LAST 
 
 
 --Q8 first_name,last_name and country ordered by country adn last_name
 
 SELECT 
 first_name,
 last_name,
 country
 FROM employees 
 ORDER BY country ASC ,
          last_name ASC NULLS LAST 
 
 
 
 --Q9 hioghest paid top ten
          
   SELECT
       first_name,
       last_name,
        salary   
   FROM employees 
 ORDER BY salary DESC NULLS LAST 
 LIMIT 10;
 
 
 --Q10 lowest paid in Hungary, first_name,second_name
 
 SELECT 
   first_name,
   last_name,
   salary,
   country
 FROM employees 
 WHERE country = 'Hungary'
 
 --Q11
 
 
 SELECT
 first_name 
 FROM employees 
 WHERE first_name LIKE 'F%'
 
 
---Q12  details employees WITH yahoo emails

 
 SELECT*
FROM employees 
WHERE email LIKE  '%yahoo%'



--Q13 count pension_enrolled employees not base France or Germany

SELECT count(pension_enrol)
FROM employees
WHERE country NOT IN ('France', 'Germany');


--Q14  maxsalary, engineering fte_hours >=1.0

select
max(salary)
FROM employees 
WHERE department = 'Engineering' AND 
fte_hours = 1.0;


--Q15 first_name,last_name,fte_hours >= 1, salary, add new column effective_yearly_salary = fte_hours by salary

SELECT 
 first_name,
 last_name,
 fte_hours,
 salary,
 concat(fte_hours * salary) AS effective_yearly_salary
 FROM employees 
 WHERE fte_hours >= 1.0;


--EXTENSION

 --Q16 badge_label (first_name, '', last_name, department), stored data Is not null
 --" Bob Smith -Legal"
 
 SELECT 
 first_name,
 last_name,
 department,
 concat(first_name,' ',last_name,' - ',department)
 FROM employees 
 WHERE (first_name,last_name,department) IS NOT NULL 

 
 --Q17  = q16 ADD  start_dat to badge_label
 --Bob Smith -Legal (joined 1998) = start_date is not null 
 
 
SELECT 
 first_name,
 last_name,
 department,
 start_date,
 concat(first_name,' ',last_name,' - ',department,' ', '( joined     )')
 FROM employees 
 WHERE (first_name,last_name,department, start_date) IS NOT NULL  
 
 
 extrat()
 To_char()
 
 
 
SELECT 
 first_name,
 last_name,
 department,
 start_date,
 extract( YEAR  FROM start_date),
 to_char(YEAR),
 concat(first_name,' ',last_name,' - ',department,' ', '( joined ' , to_char , ')')
 FROM employees 
 WHERE (first_name,last_name,department, start_date) IS NOT NULL
  
 
 
SELECT 
 first_name,
 last_name,
 department,
 start_date,
 to_char(start_date),
 extract( YEAR  FROM start_date),
 concat(first_name,' ',last_name,' - ',department,' ', '( joined ' ,  , ')')
 FROM employees 
 WHERE (first_name,last_name,department, start_date) IS NOT NULL 
 
 
 
 
 --Q18first_name,last_name salary, new column salay_class with value low <salary 40000, value high salary>= 40000
 NULL salaries!!
 
 
SELECT 
  first_name,
  last_name,
  salary,
  concat(salary, ' ' ) AS salary_class
  CASE 
  WHEN  salary < 40000 THEN Low
  WHEN salary >= 40000 THEN High
  END AS salary_class
FROM employees
 
 

 
 
 
 
 
 
 
