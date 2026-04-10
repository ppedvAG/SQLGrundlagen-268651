
--WHERE 

SELECT SPALTEN FROM TABELLE WHERE  SPALTEN = >

/* Operatoren

<  kleiner als
> größer als
<= kleiner gleich als
>= größer gleich als
<>  !=  soll es nicht sein
in  gib mir eine Liste von Werten
between alles zwischen 
like

*/


select * from customers
where country = 'Germany'

--Wieviele DS hat die Customers mit Kunden aus Berlin

select * from customers
where city = 'berlin'

--alle die nicht aus Berlin sind

select * from customers
where city != 'berlin'

--geringsten Lieferkosten waren 0.02 und maximal 1007  
--und der Schnitt 78,2442
--alle DAtensätze, die weniger als 78 Lieferkosten haben
select * from orders
where  
		freight < 78 --587
--größer oder gleich 78
select * from orders
where  
		freight >= 78 --243


select * from tabelle
where 
	spalte > Wert AND spalte < Wert

--alle Orders mit Lieferkosten größer 50 und kleiner 100
select * from orders
where
	freight > 50 and freight < 100

--alle Orders mit Lieferkosten größer oder gleich 50 und
-- kleiner oder gleich  100
select * from orders
where
	freight >= 50 and freight <= 100


--der between ist das gleiche wie <= und >= 
select * from orders
where freight between 50 and 100

--alle bestellungen aus dem Jahr 1997 -- Datum '3.12.2007'
--egal wie.. Spalte orderdate
--Aufpassen  bei datetime wird aus '17.3.2007' = '17.3.20277 00:00:00.000
select * from orders
where
	orderdate between '1.1.1997' and '31.12.1997'

select * from orders
where
	orderdate >= '1.1.1997' and orderdate <='31.12.1997'

	select * from orders
where
	orderdate >= '1.1.1997' and orderdate <='31.12.1997 23:59:59.997'

select * from orders
where 
	year(orderdate) = 1997 --langsamste

select * from customers
where
	country = 'UK' OR COUNTRY = 'USA'

--Alle Kunden aus 
-- DE und Italien und Frankreich

select * from customers
where
	country = 'Germany' OR country = 'France' or country = 'Italy'

--geht auch kürzer
select * from Customers
where
		country in ('Germany', 'France', 'Italy')


select * from customers
where
	(country = 'Italy' or Country = 'USA')
	AND
	contacttitle = 'Owner'
	
