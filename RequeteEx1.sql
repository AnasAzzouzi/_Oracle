--CREATION
--1
create table dept(
deptno number(3),
dname nvarchar2(50) ,
loc nvarchar2(50),
constraint pk1 primary key(deptno),
constraint ck check (dname in('ACCOUNTING','RESEARCH','SALES','OPERATIONS'))
)
--2
INSERT INTO DEPT VALUES (10,'ACCOUNTING','NEW-YORK')
INSERT INTO DEPT VALUES (20,'RESEARCH','DALLAS')
INSERT INTO DEPT VALUES (30,'SALES','CHICAGO')
INSERT INTO DEPT VALUES (40,'OPERATIONS','BOSTON')
--3
CREATE TABLE EMP AS SELECT * FROM SCOTT.EMP
savepoint sp_q3
--4
INSERT INTO EMP VALUES(7369,'Bidon',NULL,NULL,NULL,NULL,NULL,NULL)
CET LIGNE S 'INSERE MEME S'IL N DOIT PAS PARSQUE L ID DOIT ETRE UNIQUE
--5 
rollback to sp_q3
--6
 alter table emp add constraint ck1 primary key (empno)
 alter table emp add constraint fk1 foreign key (deptno) references dept(deptno)

--7
 insert into emp values (7369, 'WILSON', 'MANAGER', 7839, '17-NOV-91', 3500.00, 600.00, 10) ;
--ne s'ajoute pas parsqu'il existe deja un employe avec cet id
 insert into emp values(7657, 'WILSON','MANAGER', 7839, '17-NOV-91', 3500.00, 600.00, 50);
--ne s'ajoute pas parsqu'il n'existe aucun dept avec cet id 
 insert into emp values (7657, 'WILSON', 'MANAGER', 7000,'17-NOV-91', 3500.00, 600.00, 10) ; 
--s'ajoute
 insert into emp values(7657, 'WILSON', 'MANAGER', 7839, '17-NOV-91', 3500.00,600.00, 10);
--ne s'ajoute pas parsqu'il existe deja un employe avec cet id

--8
savepoint sp_q8
COMMIT

--Mise à jour 
--1
update dept set loc='PITTSBURGH' WHERE DNAME ='SALES'
--2
UPDATE EMP SET SAL=SAL*1.1  where JOB='SALESMAN' AND comm>0.50*SAL
--3
UPDATE EMP SET COMM= (select AVG(COMM) FROM EMP)  WHERE HIREDATE<'01-JAN-82' AND COMM=NULL
--4
rollback to  sp_q8

--5
delete from dept where deptno=20
donne une erreur parsqu'il existe une reference de ce dept dans la table emp

--Interrogation
--1
select ename , sal, comm , sal+comm from emp where job='SALESMAN'
--2
select ename from emp where job ='SALESMAN' ORDER BY COMM/SAL DESC
--3
select ename from emp where job='SALESMAN' AND COMM<0.25*SAL
--4
select COUNT(*) from emp where DEPTNO=10
--5
select COUNT(*) from emp where not(comm=null) 
--6
select count(distinct job) from emp
--7
select job, avg(sal) from emp group by job 
--8
select sum(sal) from emp e, dept d where d.deptno=e.deptno and dname='SALES'
--9
select ename, dname from emp e, dept d where d.deptno=e.deptno 
--10
select ename, dname ,sal from emp e, dept d where d.deptno=e.deptno and rownum<=2 order by sal desc
--11
select ename from emp where sal >(select sal from emp where ename='JONES')
--12
select ename from emp where job =(select job from emp where ename='JONES')
--13
select ename from emp where mgr =(select mgr from emp where ename='CLARK')
--14
select ename ,job from emp where mgr =(select mgr from emp where ename='TURNER') and  job =(select job from emp where ename='TURNER')
--15
select ename from emp where hiredate > all (select hiredate from emp where deptno=10) 
--16
select e.ename ,m.ename from emp e,emp m where e.mgr=m.empno
--17
select e.ename from emp e where e.mgr not in( select empno from emp where deptno=e.deptno)






