use northwind

--Spielwiese
select * into kundentabelle from customers



--bei UPDATE und DELETE können durch Fahrlässigkeit (vergessen eines where) alle Datensätze
--gelöscht oder fälschlich verändert worde sein:

--Tipp
--eine Transaktion wird immer mit begin Tran eingeleitet. 
--Dadruch ist es möglich alle Änderungen, die innerhalb der Transaktion getätigt wurden rückgängig zu machen
--> Rollback oder wenn alles korrekt ist  mit  --> commit in die Tabelle endgültig aufzunehmn

--Der @@trancount zeigt bei > 0 an, dass mind eine Transaktion gerade läuft.
--Transaktionen können mehrfach gestartet werden, wobei diese allerdings auch alle committed werden müssen
-- Der Rollback dagegen reicht aus, um eine oder mehrfach verschachtelte Transaktkionen rückgängig zu machen

-- Vorsicht: Solange eine Transaktion läuft, werden in der Regel die betroffenen Datensätze oder sogar Tabelle 
 --für andere Benutzer gesperrt.



Begin tran
select @@trancount


--KOntrolle durch ABfrage
commit --oder rollback wenn falsch


begin transaction

select * from customers

update customers 
	set City = NULL where City = 'Berlin'

delete customers 
	where CustomerID = 'ALFKI'

select * from customers --alle Änderungen wurden umgesetzt

rollback

select * from customers --nun sind alle Änderungen rückgängig gemacht worden


/*************************************/

--INSERT

/*************************************/

--SELECT INTO NeuerTabellenName "kopiert" die Ergebnisse in eine neue Tabelle auf der DB
SELECT * INTO BackupCustomers FROM Customers
SELECT * FROM BackupCustomers

--INSERT werden neue Datensätze zu einer vorhandenen Tabelle hinzugefügt

--INSERT INTO Tabelle (Spalten die befüllt werden sollen
--VALUES (Wert1, 2, usw...)
INSERT INTO Customers (CustomerID, CompanyName, Country)
VALUES ('PPEDV', 'ppedv AG', 'Germany')

SELECT * FROM Customers
WHERE CustomerID = 'ppedv'

INSERT INTO Customers (CustomerID, CompanyName, Country)
VALUES 
('LIDL ', 'Lidl', 'Germany'),
('ALDI ', 'Aldi', 'Germany')

--Ergebnisse einer Abfrage direkt in eine Tabelle überschreiben:

INSERT INTO BackupCustomers 
SELECT * FROM Customers --Ergebnisse der Abfrage werden, wenn möglich, in eine Tabelle Inserted
WHERE Country = 'Germany'

INSERT INTO BackupCustomers (CustomerID, CompanyName, Country, Phone)
SELECT CustomerID, CompanyName, Country, Phone FROM Customers

INSERT INTO BackupCustomers (CustomerID, CompanyName, Country, City)
SELECT CustomerID, CompanyName, City , Country FROM Customers


/*************************************/

--Transaction Exkurs



/*************************************/

--DELETE

/*************************************/

--löscht komplette Datensätze in einer Tabelle

DELETE FROM BackupCustomers
WHERE CustomerID = 'ALFKI'

--Wichtig: WHERE Bedingung nicht vergessen, sonst werden ALLE Datensätze gelöscht!

TRUNCATE TABLE BackupCustomers --Löscht ebenfalls ALLE Datensätze einer Tabelle



/*************************************/

--UPDATE

/*************************************/

--Werte in einem vorhandenen Datensatz ändern

UPDATE Customers
SET City = 'Burghausen'
WHERE CustomerID = 'PPEDV'

--Werte "löschen" mit SET = NULL:
UPDATE Customers
SET City = NULL
WHERE CustomerID = 'PPEDV'

--Wie bei DELETE, WHERE Bedingung nicht vergessen, sonst ganze Tabelle!

--Funktionieren bspw. auch mit CASE:
UPDATE Customers
SET Fax = 
CASE 
	WHEN Fax IS NULL THEN 'n/a'
	ELSE Fax
END

