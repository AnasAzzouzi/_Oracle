--Q4
--a
select * from employees
--b
select first_name , last_name , salary from employees
--c
select first_name , last_name , salary from employees where salary>20000
--d
select first_name , last_name , salary from employees where salary between 6000 and 20000
--e
select first_name , last_name , salary from employees where salary  between 6000 and 20000 and department_id in (200,201,203,121)
--f
select first_name , last_name , salary from employees e , departments d where e.department_id=d.department_id and department_name like 'E%'
--g
select first_name,last_name,salary  from employees where job_id not in ('IT_PROG','AD_VP')
--h
select distinct department_id from employees
--i
select department_id , salary from employees order by department_id
Q5
--a
select department_id , salary ,salary*1.15 as augmented_salary from employees order by department_id
--b
select department_id , salary ,salary*1.15 as augmented_salary  , salary*1.15 - salary as diff from employees order by department_id
--c
select department_id , salary from employees order by department_id asc ,salary desc
Q6
--a
select substr(job_title,0,6) from jobs
--b
select first_name, last_name ,length(last_name) from employees
--c
select first_name||' '||last_name as fullName ,salary from employees
--d
select 'Nom : '||last_name||' Prenom : '||first_name||' Salaire: '||salary as Info from employees
--e
select upper(last_name), lower(first_name) from employees
--f
select first_name,last_name from employees where lower(first_name)='david'
--g
select first_name,last_name,to_char(salary,'99,999') from employees 
--h
select first_name,last_name,to_char(salary,'99,999L') from employees 
--i
select first_name,last_name,to_char(hire_date,'dd-mm-yyyy') from employees 
--j
select first_name,last_name,to_char(hire_date,'dd-mm-yyyy') from employees where to_char(hire_date,'MON')='JAN'
--K
select first_name,last_name,round(months_between(sysdate,hire_date),2) as anciennete from employees
order by anciennete desc
--l
select first_name,last_name,round(months_between(sysdate,hire_date)/12,2) as anciennete from employees
order by anciennete desc
Q7
--a
select e.first_name , e.last_name ,d.department_name from employees e , departments d where e.department_id= d.department_id 
--b
select d.department_name, e.first_name , e.last_name  from employees e , departments d where e.department_id= d.department_id order by department_name 











