--Aggregatsfunktionen: COUNT, MIN, MAX, SUM, AVG
SELECT COUNT(*) FROM Customers; --Wieviele Kunden gibt es?

SELECT COUNT(*) FROM Customers WHERE Country = 'Austria';

SELECT AVG(Freight) FROM Orders; --Hier muss eine konkrete Spalte ausgewählt werden, weil ein Durchschnitt nicht auf eine ganze Tabelle angewandt werden kann

SELECT COUNT(DISTINCT Country) FROM Customers; --Wieviele verschiedene Länder haben Kunden?



--Werden Spalten mit Aggregaten im SELECT gemischt, muss ein GROUP BY definiert werden,
-- damit die Zeilen gruppiert und die Aggregate auf diese Gruppen angewandt werden können

--Tipp: Überlege imme rzuerst: Was möchte ich als Ergebnis haben? Welche Spalten möchte ich sehen?
-- Das ergibt deinen SELECT. 
-- Alle Spalten des SELECT , die kein Aggregat sind, müssen in den GROUP BY aufgenommen werden.
-- Danach kannst du die GROUP BY Klausel formulieren, um die gewünschten Ergebnisse zu erhalten.

--Wir wollen wissen , wieviele Kunden es pro Land gibt:

SELECT Country, COUNT(*) AS AnzahlKunden
FROM Customers
GROUP BY Country


--Wir wollen wissen, wieviele Kunden es pro Land und Stadt gibt:
SELECT Country, City, COUNT(*) AS AnzahlKunden
FROM Customers
GROUP BY Country, City


--Wir wollen wissen, wieviele Kunden es pro Land und Stadt gibt, sortiert nach Anzahl Kunden absteigend:
SELECT Country, City, COUNT(*) AS AnzahlKunden
FROM Customers
GROUP BY Country, City
ORDER BY AnzahlKunden DESC

--Wir möchten den Umsatz pro Kunden sehen, sortiert nach Umsatz absteigend:

select c.CustomerID, sum(unitprice*quantity) as Umsatz
from customers c inner join orders o on o.customerid = c.customerid
				  inner join [Order Details] od on od.orderid = o.orderid
group by c.CustomerID
order by Umsatz desc



