


--MVP

--Q1
--a
SELECT 
  em.first_name,
  em.last_name,
   t.name
FROM employees AS em
INNER JOIN teams AS t 
ON em.team_id = t.id


--b


SELECT
    em.first_name,
    em.last_name,
    t.name
FROM employees AS em
INNER JOIN teams AS t 
ON em.team_id = t.id
WHERE pension_enrol = TRUE

--c

SELECT
    em.first_name,
    em.last_name,
    t.name,
    t.charge_cost 
FROM employees AS em
INNER JOIN teams AS t 
ON em.team_id = t.id
WHERE CAST(charge_cost AS int) > 80;


--Q 2.
--a

SELECT *
FROM employees
INNER JOIN pay_details AS pd 
 ON  employees.pay_detail_id = pd.id;



--b

SELECT *
FROM employees
INNER JOIN pay_details AS pd 
ON  employees.pay_detail_id = pd.id
INNER JOIN teams AS t 
ON employees.team_id = t.id 

 

--Q3
--a

SELECT 
    id,
    team_id
FROM employees 



--b

SELECT 
    count(em.id), 
   t.id
FROM employees AS em
INNER JOIN  teams AS t
ON em.team_id = t.id
GROUP BY t.id


--c.
 
   
SELECT 
    count(em.id), 
   t.id
FROM employees AS em
INNER JOIN  teams AS t
ON em.team_id = t.id
GROUP BY t.id 
ORDER BY t.id
 
 

--Q4
--a

SELECT 
   t.id ,
    t.name,
    count(t.id) AS n_employees_team
FROM employees AS em
INNER JOIN  teams AS t 
ON em.team_id = t.id 
GROUP BY t.id

--b


SELECT     
 t.id,
  t.charge_cost,
  t.name,
 (count (t.id))*CAST (t.charge_cost AS INT) AS total_day_charge
FROM  employees AS em
INNER JOIN teams AS t 
ON em.team_id = t.id 
GROUP BY t.id


--c

SELECT     
 t.id,
  t.charge_cost,
  t.name,
 (count (t.id))*CAST (t.charge_cost AS INT) AS total_day_charge
FROM  employees AS em
INNER JOIN teams AS t 
ON em.team_id = t.id 
GROUP BY t.id 
HAVING  (count (t.id))*CAST (t.charge_cost AS INT)>5000;  --- WITH ....."AS total_day_charge > 5000"did not work



---Extension

--Q5


SELECT count (*) AS DISTINCTemployee_id 
FROM employees_committees 



--Q6

SELECT
    emc.id,
    emc.employee_id,
    com.name,
    com.id
FROM employees_committees  AS emc
INNER JOIN committees AS com 
ON emc.committee_id = com.id
GROUP BY emc.id IS  NULL  





















