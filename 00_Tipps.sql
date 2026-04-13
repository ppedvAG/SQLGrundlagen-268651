--Verwende Kommentare, um
--SQL Anweisungen zu erklären

USE Northwind; --Datenbank auswählen --ab 2 -- ist der Rest der Zeile ein Kommentar

/*
	Mehrzeiliger
	Kommentar
*/

-- Formatiere den Code, um ihn lesbar zu machen
-- nicht nur für dich, sondern auch für andere, die den Code lesen müssen

-- setzt du bei mehreren Spalten im SELECT das Komma an den Zeilenanfang, 
-- kannst du die Spalten besser lesen und leichter Fehler finden, 
-- wenn du z.B. eine Spalte vergisst oder ein Komma zu viel setzt
-- Ausserdem läßt sich eine Zeile problemlos auskommentieren, 
-- ohne dass die Syntax des restlichen Codes zerstört wird.

--Formatiere so, dass der Code gut lesbar beliebt:
-- Zeilenumbruch ja, aber nicht zu viele

-- Beispiel:
select 
	CustomerID, 
	CompanyName, 
	ContactName, 
	ContactTitle, 
	Address, 
	City, 
	Region, 
	PostalCode, 
	Country, 
	Phone, 
	Fax
	from dbo.Customers

--oder
select 
	CustomerID, 
	CompanyName, 
	ContactName, 
	ContactTitle, 
	Address, 
	City, 
	Region, 
	PostalCode, 
	Country, 
	Phone, 
	-- Fax --Fehler wg Komma am Ende der vorhergehenden Zeile
	from dbo.Customers

--oder mit KOmma zu Beginn der Zeile

select 
	CustomerID
	,CompanyName
	,ContactName
	,ContactTitle
	,Address
	,City
	,Region
	,PostalCode
	,Country
	,Phone
--	,Fax  --> kein Fehler
	from dbo.Customers