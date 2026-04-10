--Tabellendaten

select * --steht für alle Spalten der Tabelle

select * from tabelle

select * from customers

select companyname, customerid, country, city from customers

--Alle Spalten mit C beginnend aus der Tabelle Customers


select	  c.City
		, c.CompanyName as Firma
		, c.ContactName
		, c.Country --das Land
		, c.CustomerID 
		, c.ContactTitle  
from customers c

-- left('TXT', Stellen)

select	  
		'Text',3.14,
		c.City
		, Left(c.CompanyName,5) as Firma, CompanyName
		, c.ContactName
		, c.Country --das Land
		, c.CustomerID 
		, c.ContactTitle 
from customers c


select 100 from customers


select * from orders

--Spalte Freight = Lieferkosten netto

--Gib die Lieferkosten in Netto und Brutto aus

--Ausgabe: Orderid , Freight netto und Freight brutto (mwst = DE)

SELECT 
  Orderid,
  Freight as Freightnetto,
  freight *1.19 as FreightBrutto
FROM Orders

----Gib zusätzlich MwSt aus

SELECT 
  Orderid
  ,Freight as [Freight netto]
  ,freight *1.19 as FreightBrutto
  ,(freight *1.19)-Freight as MwSt
  --zusätzlich das Jahr und das Quartal getrennt ausgeben
  ,datepart(yy,orderdate) as Jahr
  ,datepart(qq,orderdate) as Quartal
FROM Orders

--datepart(Intervall, Datum) Funktion -- OrderDate











--Alle Angestellten in Employees
select * from employees

--zeige die AngNr an  
--und den Namen des Angestellte 
--und dessen Wohnort  und Land und Geburtsjahr
-- year(Datum)year(

SELECT 
  e.EmployeeID as AngNr
, (e.LastName + ' ' + e.FirstName) as Name
, e.country, e.City
, year(e.Birthdate) as Geburtsjahr
, datepart(yy, e.birthdate) as Geburtsjahr2
, e.BirthDate
FROM EMPLOYEES as e


