--Exercice1
--Q1
select * from airplane where capacity >350
--Q2
select numap ,nameap from airplane where localisation ='Nice'
--Q3
select p.nump ,f.dep_t from pilot p , flight f where p.nump=f.nump
--Q4
select * from plito
--Q5
select namep from pilote where adress like '%Paris%' and salary >15000
--Q6
select numap , nameap from airplane where localisation='Nice' or capacity<350
--Q7
select * from flight where dep_t='Paris' and arr_t='Nice' and dep_h>18
--Q8
select numf ,dep_t from airplane where nump in (100,204)
--Exercice2
--Q1
select personne from emprunt where  livre='Recueil Examens BD'
--Q2
select personne from Emprunt where personne not in (select personne from retard)
--Q3
??
--Q4
??
--Q5
select personne from emprunt where personne in (select personne from retard)
