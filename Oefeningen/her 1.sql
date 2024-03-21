Select wedstrijdnr, naam,  voorletters
from tennis.wedstrijden W 
inner join tennis.teams T ON T.teamnr = W.teamnr
inner join tennis.spelers S ON S.spelersnr = T.spelersnr
order by W.wedstrijdnr ASC;

-- Geef voor elke wedstrijd het wedstrijdnummer en de volledige naam van de aanvoerder van het team waarvoor de wedstrijd werd gespeeld. 
-- Sorteer je resultaat volgens het wedstrijdnummer in oplopende volgorde.\

Select S.spelersnr, S.naam, plaats
from spelers S 
left join boetes B on B.spelersnr = S.spelersnr
where betalingsnr is NULL
AND plaats != 'Den Haag'
Order by jaartoe, 1, 2, 3;
-- Geef alle spelers die geen boete gekregen hebben en niet in Den Haag wonen.
-- Sorteer op jaar van toetreden nr en verder op de volgende kolommen.

SELECT T.teamnr, T.divisie, W.wedstrijdnr, W.spelersnr,
CASE
    WHEN B.spelersnr IS NOT NULL AND B.eind_datum IS NULL THEN 'actief'
    ELSE '-'
END AS bestuurslid
FROM teams T
LEFT JOIN wedstrijden W ON W.teamnr = T.teamnr
LEFT JOIN bestuursleden B ON W.spelersnr = B.spelersnr AND B.eind_datum IS NULL
WHERE W.gewonnen < W.verloren OR W.gewonnen IS NULL
ORDER BY T.divisie, W.wedstrijdnr;
--Geef per team de verloren wedstrijden. 
--Zorg dat teams zonder verloren wedstrijden ook in de output verschijnen.
--Duid per wedstrijd aan of het om een actief bestuurslid gaat.
--Sorteer op divisie en wedstrijdnummer.

select S.spelersnr, naam, datum, bedrag
from boetes B
inner join spelers S on S.spelersnr = B.spelersnr
where bedrag > 45.50 AND plaats = 'Rijswijk';
--Geef een lijst met het spelersnummer, de naam van de speler, de datum van de boete en het bedrag van de boete 
--van al de spelers die een boete gekregen hebben met een bedrag 
--groter dan 45,50 euro en in Rijswijk wonen. 
--Geef expliciet aan welke join je gebruikt.

select S.spelersnr, naam, voorletters, divisie, wedstrijdnr
from spelers S 
inner join teams T ON T.spelersnr = S.spelersnr
inner join wedstrijden W on W.spelersnr = T.spelersnr
where geslacht = 'M'
order by wedstrijdnr DESC;
--Maak een lijst van alle mannelijke aanvoerders van een team en hun gespeelde wedstrijden.
--Hierbij toon je voor deze spelers het spelersnummer en de volledige naam, voor het team de divisie en voor de wedstrijd het wedstrijdnummer.
--Sorteer ook aflopend op het wedstrijdnummer.

select S.spelersnr, plaats, T.teamnr
from spelers S
left join wedstrijden W ON W.spelersnr = S.spelersnr
left join teams T on T.teamnr = W.teamnr
Where geslacht = 'V' AND (plaats = 'Den Haag' or plaats = 'Zoetermeer' or plaats = 'Leiden')
order by 1,2,3;
--Geef voor alle vrouwelijke spelers die in Den Haag, Zoetermeer of Leiden wonen
--het spelersnummer, hun woonplaats en een lijst van de teams waarvoor ze ooit gespeeld hebben, 
--als ze ooit een wedstrijd gespeeld hebben. sorteer volgens 1,2,3

select S.naam,
case
		when avg(bedrag) is null then 'geen boetes'
		Else cast(ROUND(avg(bedrag), 2) AS varchar(8))
	END AS gemiddeld 
from spelers S
left join boetes B on B.spelersnr = S.spelersnr
group by S.spelersnr, S.naam
select S.naam,
case
		when avg(bedrag) is null then 'geen boetes'
		Else cast(ROUND(avg(bedrag), 2) AS varchar(8))
	END AS gemiddeld 
from spelers S
left join boetes B on B.spelersnr = S.spelersnr
group by S.spelersnr, S.naam
ORDER BY 
CASE 
    WHEN AVG(bedrag) IS NULL THEN 0
    ELSE 1
END, 
S.naam, 
AVG(bedrag);
--Geef het gemiddeld boetebedrag per speler, afgerond op twee cijfers na de komma. spelers zonder boete moeten bovenaan staan met 'geen boetes'
--Sorteer daarna op spelersnaam en vervolgens op gemiddeld boetebedrag.
--Gebruik als datatype van de 2de kolom varchar(8) voor spelers die wel boetes hebben.

SELECT BS.spelersnr, MAX(W.wedstrijdnr) AS laatstewedstrijd
FROM bestuursleden BS
INNER JOIN wedstrijden W ON W.spelersnr = BS.spelersnr
WHERE BS.eind_datum IS NULL
AND BS.spelersnr NOT IN (
    SELECT B.spelersnr
    FROM boetes B
    WHERE B.bedrag IS NOT NULL
)
GROUP BY BS.spelersnr
ORDER BY BS.spelersnr DESC;
--Geef voor de actieve bestuursleden zonder boete hun laatste gespeelde wedstrijd (die met het hoogste wedstrijdnummer).
--Sorteer aflopend op spelersnr.


SELECT S.spelersnr
FROM spelers S
LEFT JOIN bestuursleden BS ON BS.spelersnr = S.spelersnr AND BS.functie = 'Voorzitter' AND BS.eind_datum IS NULL
INNER JOIN wedstrijden W ON W.spelersnr = S.spelersnr
LEFT JOIN wedstrijden WL ON WL.spelersnr = BS.spelersnr AND BS.functie = 'Voorzitter' AND WL.gewonnen < WL.verloren
WHERE BS.functie IS NULL
GROUP BY S.spelersnr
HAVING COUNT(W.wedstrijdnr) > (COUNT(WL.wedstrijdnr) +1)
ORDER BY S.spelersnr;
--Geef alle spelers die meer wedstrijden gespeeld hebben dan het aantal wedstrijden dat de huidige voorzitter heeft verloren.
--De huidige voorzitter komt zelf niet in de lijst voor. 
--Gebruik geen subqueries. Sorteer op spelersnr.

--fout
SELECT T.teamnr, MAX(W.wedstrijdnr) AS laatstewedstrijd
FROM teams T
INNER JOIN wedstrijden W ON W.teamnr = T.teamnr
LEFT JOIN bestuursleden B ON W.spelersnr = B.spelersnr
WHERE NOT EXISTS (
    SELECT 1 FROM boetes BO WHERE B.spelersnr = BO.spelersnr
)
GROUP BY T.teamnr
ORDER BY T.teamnr;

--juist
select w.teamnr, max(wedstrijdnr) as "laatstewedstrijd"
from wedstrijden w left outer join boetes bo 
on w.spelersnr = bo.spelersnr
inner join bestuursleden be 
on w.spelersnr = be.spelersnr
where bo.bedrag is null
group by teamnr
order by w.teamnr

--Geef per team het hoogste wedstrijdnummer van een wedstrijd, gespeeld door een bestuurslid 
--(actief en niet meer actief) die geen boete heeft gekregen.
--Sorteer op teamnr.