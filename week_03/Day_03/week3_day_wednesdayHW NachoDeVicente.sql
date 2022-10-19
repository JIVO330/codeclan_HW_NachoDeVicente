
--MVP

--Q1
SELECT count(*)
FROM employees 
WHERE grade  IS  NULL AND 
salary IS  NULL; 


--Q2


SELECT
department,
concat (first_name, ' ',last_name) AS full_name
FROM employees
ORDER BY department, last_name; 

--Q3


SELECT *
FROM employees
WHERE last_name LIKE 'A%'
ORDER BY salary DESC NULLS LAST 
LIMIT 10;

--Q4

SELECT 
department, 
count(id)
FROM employees 
WHERE start_date BETWEEN '2003-01-01' AND '2003-12-31'
GROUP BY department; 



--Q5

SELECT 
department,
fte_hours,
count(id)
FROM employees 
GROUP BY department, fte_hours
ORDER  BY  department,fte_hours;


--Q6.



SELECT 
    pension_enrol ,
    count(id)
FROM employees
GROUP BY pension_enrol; 



--Q7.



SELECT *
FROM employees 
WHERE department  ='Accounting'
ORDER BY salary DESC  NULLS LAST 
LIMIT 1 ;


--Q8.



SELECT 
   country,
    count(id) AS n_employees,
   round(avg (salary),2 ) AS avg_salary
FROM  employees 
GROUP BY country
HAVING count(id) >30
ORDER BY avg_salary DESC; 


--Q9


SELECT 
    first_name,
    last_name,
    fte_hours,
    salary,
  (fte_hours * salary) AS effective_yearly_salary
FROM employees 
WHERE (fte_hours * salary) >30000;


--Q10


SELECT  *
FROM employees  AS em
LEFT JOIN teams AS t 
ON em.team_id = t.id
WHERE t.name = 'Data Team 1' OR 
      t.name =  'Data Team 2';
      
                
      
--Q11



SELECT 
     em.first_name,
     em.last_name,
     pd.local_tax_code
FROM employees  AS em
LEFT  JOIN  pay_details   AS pd
ON em.pay_detail_id  = pd.id
WHERE pd.local_tax_code  IS NULL; 
      
      
--Q12.
    
      
      
SELECT 
    em.first_name,
    em.last_name,
    em.fte_hours,
    em.salary,
    t.charge_cost,
((48 * 35 * CAST (t.charge_cost AS int) - em.salary) * fte_hours) AS ex_profit    
FROM  employees  AS em
LEFT JOIN teams AS t
ON  em.team_id = t.id;

--Q13.



SELECT 
    first_name,
    last_name,
    salary 
FROM employees
WHERE country = 'Japan' AND
fte_hours = ( 
    SELECT 
    fte_hours 
    FROM employees 
    GROUP BY fte_hours ORDER BY count(*)
    LIMIT 1
)
ORDER BY salary ASC NULLS LAST 
LIMIT 1;


 --Q14.



SELECT 
    department,
    count(id) AS n_employees
FROM employees
WHERE first_name IS NULL 
GROUP BY department
HAVING count(id)  >1
ORDER BY n_employees DESC;  

--Q15

SELECT
    first_name,
    count(first_name)
FROM employees
WHERE first_name IS NOT NULL 
GROUP BY first_name 
HAVING count(first_name) >1  
ORDER BY count(first_name) DESC , first_name; 

--Q16   Failure


     
SELECT 
    department ,
    --count(id)
    count(grade)AS total_grade
    CAST sum(total_grade,department as INT)
FROM employees   
GROUP BY department



 --  WHERE department  
   
   
   
   
   /*
   HAVING BY  
   ORDER  BY 
   LIMIT 
      sum(grade =1) CASTsum(total_grade + department as INT)
      
      ---total grades/ grades * 100   (SELECT SUM(total_grade, department)  cast(sum)
      
      
      
      
      
      
      
      
    




      