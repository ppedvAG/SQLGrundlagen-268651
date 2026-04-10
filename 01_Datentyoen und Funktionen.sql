USE NORTHWIND;
GO

Select 'otto', 3.14, '10.4.2026'


-- + addiert Zahlen und kombiniert Text
select 2+4, 'A' + 'B'

-- Alias

select 'Otto' as Vorname, 3.14 as Pi



select getdate() as aktDAtumZeit -- aktuelle Datum mit Uhrzeit aus ms genau


-- ab 2 Minuszeichen ist der Rest der Zeile ein Kommentar
/*
alles dazwischen ist ein Kommenatar
*/

--Datumsfunktionen

--datepart()

select datepart(qq, getdate()) as Quartal

--An welchem Wochentag war die erste Mondlandung?

select datepart(dw, '21.07.1969') -- 1 bis 7 für Wochentag
select datename(dw, '21.07.1969') -- Name des wochentags

--An welchem Wochentag seid ihr geboren?

select datediff(dd, getdate(), '31.12.2026 23:59:59.999') as TageBisSilvester

--Wieviele Stunden sind seit eurer Geburt vergangen?
select datediff(hh, getdate(),'17.7.1972') as StundenSeitGeburt
select datediff(
				hh, --hh wür Stunden
				'17.7.1972',      --Gebtag
				getdate() --heute
				)    as     StundenSeitGeburt



Select Left('Otto',2) as Vorname, Right('Otto', 2) as Nachname,Right('Otto     ', 2) as Nachname

