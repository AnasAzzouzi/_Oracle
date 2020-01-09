--A Creation des tables

create table piece(
nop number(4),
designation nvarchar2(50),
couleur nvarchar2(50),
poids number(8,2)
) 

create table service(
nos number(4),
intitile nvarchar2(50),
localisation nvarchar2(50)
)
 
create table ordre(
nop number(4),
nos number(4),
quantite number(6)
)
 create table nomenclature (
 nopa number(4),
 nopc number(4),
 quantite number(6)
)
insert into piece values(10,'p1','bleu',15);
insert into piece values(20,'p2','vert',15);
insert into piece values(30,'p3','rouge',15);
insert into piece values(40,'p4','blanc',15);
insert into service values(10,'ser1','loc1');
insert into service values(20,'ser2','loc2');
insert into service values(30,'ser3','loc3');
insert into ordre values(10,10,5);
insert into ordre values(20,20,5);
insert into ordre values(30,30,5);
insert into nomenclature values(10,10,5);
insert into nomenclature values(20,20,5);
insert into nomenclature values(30,30,5);
--B Contraintes d'integrite
--1
insert into piece values(50,'p5','col5',10);
insert into piece values(50,'p6','col6',10);
--2
insert into service values(40,'ser4','loc4');
insert into service values(40,'ser5','loc5');
--3
insert into ordre values(8,70,9);
--4
insert into nomenclature values(80,80,10)
--5
alter table piece add constraint pk1 primary key (nop)
alter table service add constraint pk2 primary key (nos)
alter table ordre add constraint pk3 primary key (nop,nos)
alter tables ordre add constraint fk1 foreign key (nop) references piece(nop)
alter table ordre add constraint fk2 foreign key (nos) references service (nos)
alter table nomenclature add constraint pk4 primary key (nopa,nopc)
alter table nomenclature add constraint fk3 foreign key (nopa) references piece(nop)
alter table nomenclature add constraint fk4 foreign key (nopc) references piece(nop)
--7
alter table piece add constraint ck1 check couleur in ('ROUGE','VERTE','BLEUE','JAUNE')

--C Modification de la structure de la base 
--1
alter table piece modify  designation nvarcha2(60)
alter table service modify  intitule nvarcha2(60)
--2
alter table service modify  localisation nvarcha2(40)
--3
alter table service add  directeur nvarchar2(50)
--4
alter table service drop column localisation 
--5
alter table piece drop constraint pk1
--6
alter table piece drop constraint ck1
--7
drop table nomenclature
--8
drop table piece cascade constraints
