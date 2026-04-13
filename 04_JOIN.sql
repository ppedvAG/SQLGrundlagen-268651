--Ein Join wird verwendet, um Daten aus mehreren Tabellen basierend 
-- auf einer verwandten Spalte zwischen ihnen zu kombinieren. Es gibt verschiedene Arten von Joins, 
-- darunter INNER JOIN, LEFT JOIN, RIGHT JOIN und FULL OUTER JOIN.

--Ein INNER JOIN gibt nur die Zeilen zurück
-- , bei denen es eine Übereinstimmung in beiden Tabellen gibt.

--Ein RIGHT JOIN gibt alle Zeilen aus der rechten Tabelle zurück 
-- und die übereinstimmenden Zeilen aus der linken Tabelle.

--Ein LEFT JOIN gibt alle Zeilen aus der linken Tabelle zurück

--Ein Full OUTER JOIN gibt alle Zeilen zurück,
-- unabhängig davon, ob es eine Übereinstimmung in beiden Tabellen gibt oder nicht.	

-- RIGHT oder LEFT bezieht auf die Reihenfolge der Tabellen im FROM-Teil der Abfrage.
-- Was steht LEFT (links) vom JOIN, was steht RIGHT (rechts) vom JOIN.



-- Die Syntax des Join ist wie folgt:

-- SELECT Spalten FROM Tabelle1 JOIN Tabelle2 ON Tabelle1.Spalte = Tabelle2.Spalte;

-- es können auch mehrere Tabellen gejoined werden. 
-- Die Snytax dazu lautet:
/*
SELECT Tabelle1.Spalte, Tabelle2.Spalte, Tabelle3.Spalte , ...
FROM TABELLE1 JOIN TABELLE2 ON Tabelle1.Spalte=Tabelle2.Spalte
			  JOIN TABELLE3 ON Tabelle3.Spalte=Tabelle2.Spalte	
			  JOIN Tabelle4 ON Tabelle4.Spalte=Tabelle3.Spalte
			  ...
where Tabelle1.Spalte=Wert or Tabelle3.Spalte = Wert

Es empfiehlt sich, bei JOINS über mehrere Tabellen einen Tabellen Alias zu verwenden:

SELECT T1.Spalte , T2.Spalte, T3.Spalte , ...
FROM TABELLE1 T1 JOIN TABELLE2 T2 ON T1.Spalte=T2.Spalte
			     JOIN TABELLE3 T3 ON T3.Spalte=T2.Spalte	
			     JOIN Tabelle4 T4 ON T4.Spalte=T3.Spalte
				 ...
WHERE T1.SPalte = Wert OR  T3.SPalte = Wert

Die Vorteile sind:
 -der Code wird übersichtlicher
 -man kann die Autovervollständigung im SELECT und WHERE nutzen


*/

--INNER JOIN
SELECT * FROM Orders;
SELECT * FROM Customers;

--Aufgabe: Zu jeder Bestellung den Kunden ausgeben
SELECT *
FROM Orders 
	INNER JOIN Customers 
	ON Orders.CustomerID = Customers.CustomerID;

--Statt * nur benötigte Spalten auswählen
SELECT
	Orders.CustomerID,
	Orders.OrderDate,
	Orders.Freight,
	Customers.CompanyName,
	Customers.ContactName
FROM Orders 
	INNER JOIN Customers 
	ON Orders.CustomerID = Customers.CustomerID;

--Mit Alias
SELECT
	o.CustomerID,
	o.OrderDate,
	o.Freight,
	c.CompanyName,
	c.ContactName
	
FROM Orders AS o
	INNER JOIN Customers AS c
	ON o.CustomerID = c.CustomerID;

--Beziehungstypen
--1:1 -> existiert effektiv nicht
--1:n -> Jeder Kunde hat n Bestellungen; jede Bestellung hat genau einen Kunden
--m:n -> Jede Bestellung hat m Produkte; jedes Produkt befindet sich in n Bestellungen (benötigt eine extra Tabelle)

--Um Produkte und Bestellungen zu joinen, wird hier ein dreifach JOIN benötigt
SELECT * FROM 
		   [Order Details]  AS od
INNER JOIN Orders			AS o ON od.OrderID = o.OrderID
INNER JOIN Products         AS p ON od.ProductID = p.ProductID; --Hier nur sinnvolle Spalten auswählen

SELECT
	od.OrderID,
	p.ProductName,
	p.QuantityPerUnit,
	od.UnitPrice AS Stückpreis,
	od.Quantity,
	od.UnitPrice * Quantity * (1 - Discount) AS Positionspreis,
	o.OrderDate,
	o.Freight AS Frachtkosten
FROM	   [Order Details]  AS od
INNER JOIN Orders			AS o ON od.OrderID = o.OrderID
INNER JOIN Products			AS p ON od.ProductID = p.ProductID;

--OUTER JOIN
--Wenn in einer der beiden Tabellen kein Match für ein Datensatz gefunden wurde, fällt dieser beim INNER JOIN heraus
--Beim OUTER JOIN wird dieser Datensatz mit NULL-Werten ergänzt
--Hier gibt es LEFT, RIGHT und FULL OUTER JOIN, um verschiedene Schnittmengen abzubilden (siehe Venn Diagramme)
SELECT *
FROM Orders 
	LEFT JOIN Customers 
	ON Orders.CustomerID = Customers.CustomerID; --Ergänze alle Kunden, die keine Bestellungen haben (selbe Ergebnismenge)

SELECT *
FROM Orders 
	RIGHT JOIN Customers 
	ON Orders.CustomerID = Customers.CustomerID; --Am Ende der Tabelle befinden sich alle Kunden, die keine Bestellungen haben

SELECT *
FROM Orders 
	FULL JOIN Customers 
	ON Orders.CustomerID = Customers.CustomerID; --FULL JOIN: Kombination aus LEFT + RIGHT JOIN

SELECT * FROM Orders CROSS JOIN Customers; --Matcht jeden Kunden mit jeder Bestellung (76000 Rows)



