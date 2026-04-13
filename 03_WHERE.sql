
--WHERE 

SELECT SPALTEN FROM TABELLE WHERE  SPALTEN = >

/* Operatoren

<  kleiner als
> größer als
<= kleiner gleich als
>= größer gleich als
<>  !=  soll es nicht sein
in  gib mir eine Liste von Werten spalte = wert or Spalte = wert
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
	


	select * from orders

	--Alle Bestellungen , die vom Angestellten nr 1 erledigt wurden,
	-- aus dem Jahr 1997 und Lieferkosten unter 50 waren
	--Employeeid  Orderdate Freight für das WHERE
	--Wir wollen sehen: Orderdate, freight, employeeid und orderid  30

select orderid, orderdate, freight, employeeid
from orders
where 
		year(orderdate) = 1997
		AND
		Freight < 50
		AND
		EmployeeID = 1

select * from orders o
where
	o.EmployeeID = 1
	and
	o.Freight < 50
	and
	year(o.OrderDate) = 1997


select * from orders


--NULL ist nicht 0 und ist auch nicht ''
--NULL ist nicht definiert

select 100 +0
select 100 + NULL
select 'ABC' + NULL
select * from orders where ShipRegion > NULL

select * from orders where ShipRegion = NULL


select * from orders where ShipRegion is not NULL


--Wie suche ich nach Dingen wie: es soll mit A beginnen

--LIKE

--is der einzige Operator , der Wildcards kennt
-- % steht für 0 oder mehr Zeichen

where spalte like 'A%'

--Alle Kunden, deren Kundennumemr mit A beginnt
select * from customers
where customerid like 'A%'

--Suche alle Kunden , deren Customerid mit A endet

select * from customers
where customerid like '%A'

--Suche alle Kunden , deren Customerid mit A endet
--und mit M beginnen

select * from customers
where customerid like 'M%A'

--suche alle Kunden , die ein h irgendwo im customerid haben

select * from customers
where customerid like '%h%'

--weitere Wildcard:  _ steht für genau ein Zeichen

select * from customers
where customerid like '_H%'

--Suche alle Angestellten, die als 2ten Buchstaben im Familenname ein A besitzen

select * from employees
where 
	Lastname like '_a%'


--alle Kunden, deren Customerid mit A oder B oder C oder D beginnt

select * from customers
where customerid like 'A%' or customerid like 'B%' or customerid like 'C%' or customerid like 'D%'

select * from customers 
where customerid in ('A%', 'B%', 'C%', 'D%') --geht nicht weil kein like sondern = 


select * from customers
where customerid < 'E' 


--für like kann man auch Wertebereiche vorgeben
-- [] steht für genau ein Zeichen 
-- Wertebereich kann sein: [a-c], [abc],[aefhi], [1-3]

select * from customers
where customerid like '[A-D]%'

--suche alle Kunden , deren Customerid 
-- als vorletzten buchstaben ein d oder g oder h besitzten

select * from customers
where customerid like '%[dgh]_'

--1234
--char4  xa34

--wie kann ich alle DS rausfinden der Spalte PIN nicht konform ist

select * from girokonten 
where pin like '%[a-z]%'--  was ist mit !$§"

select * from girokonten 
where pin > 1000 and pin < 10000 --tolle Idee, aber was ist mit 0123

select * from girokonten 
where pin not like  '[0-9][0-9][0-9][0-9]'


select * from customers
where customerid like '[^a-c|s-z]%'



---JOIN


























	select Spalte1 , Spalte2, Spalte3, ...
	from tabelle
	where
		spalte1 > Wert
		and
		Spalte2 = Wert
		or
		Spalte3 >= Wert
		and
		Spalte4 between 1 and 10
		or
		Spalte5 in ('wert1', 'wert2', 'wert3')

