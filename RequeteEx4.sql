--Exercice 1
declare 
v_a number :=1;
v_b number :=2;
v_c number;
begin 
dbms_output.put_line('a = '||v_a||' b = '||v_b);
v_c:=v_a;
v_a:=v_b;
v_b:=v_c;
dbms_output.put_line('a = '||v_a||' b = '||v_b);
end;

--Exercice 2
declare 
v_a number :=10;
v_res number:=1;
begin
while v_a>0 loop
v_res:=v_res*v_a;
v_a:=v_a-1;
end loop;
dbms_output.put_line(v_res);
end;

--Exercice 3 
declare 
v_depid number;
v_dep_name nvarchar2(20):='new dep';
v_mgr_id number :=200;
v_loc_id number:=1800;
begin
select max(department_id)+10 into v_depid from departments ;
insert into departments values(v_depid,v_dep_name,v_mgr_id,v_loc_id);
end;

--Exercice4
declare 
v_depid number;
begin
select max(department_id) into v_depid from departments ;
dbms_output.put_line(v_depid);
end;

--Exercice5
declare 
depid number;
depname nvarchar2(20);
mgid number;
locid number;
begin
select * into depid , depname, mgid ,locid from departments where department_id=(select max(department_id) from departments);
dbms_output.put_line(depid||'-'||depname||'-'||mgid||'-'||locid);
end;

--Exercice6
declare
v_depid number ;
begin 
select max(department_id) into v_depid  from departments;

update departments set location_id=2500 where department_id=v_depid;
end;

--Exercice7
declare 
v_lastname nvarchar2(20):='Kochhar';
v_mg number;
begin 
select manager_id into v_mg from employees where last_name=v_lastname;
dbms_output.put_line(v_mg);
end;

--Exercice8
declare 
v_emp nvarchar2(50);
begin
for emp in (select * from employees where rownum<=10 order by hire_date asc) loop
v_emp := emp.employee_id||' '||emp.last_name;
dbms_output.put_line(v_emp);
end loop ;
end;

--Exercice 9

declare 
v_emp number;
begin
select count(*)into v_emp from employees where department_id=30
dbms_output.put_line(v_emp);

end;

--Exercice 10 

declare
v_salary employees.salary%type;
v_name employees.last_name%type;

begin 
for emp in (select * from employees)loop
v_name:=emp.last_name;
v_salary:=emp.salary;
if emp.salary<3000 then
update employees set salary = salary+500 where employee_id=emp.employee_id;
dbms_output.put_line(v_name||' s salary augmented');
else
dbms_output.put_line(v_name||' earns '||v_salary);
end if;
end loop;
end;

--Exercice 11



