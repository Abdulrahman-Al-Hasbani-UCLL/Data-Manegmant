select count(*) as "aantal_boetes", 
round(sum(boetes.bedrag),0) as "totaal_bedrag", 
round(min(boetes.bedrag),0) as "minimum", 
round(max(boetes.bedrag),0) as "maximum"

from tennis.boetes
order by 1,2,3,4;

--Geef het totaal aantal boetes, het totale boetebedrag, het minimum en het maximum boetebedrag 
--dat door onze club betaald werd. Let er hierbij op dat er gehele getallen worden getoond (rond af indien nodig). 
--Sorteer van voor naar achter, oplopend. Deze opgave behoeft geen subquery.

SELECT
    S.spelersnr,
    S.naam,
    S.voorletters,
    COUNT(B.spelersnr) AS "aantalboetes",
    COUNT(teams.teamnr) AS aantalteams
FROM tennis.spelers S
INNER JOIN tennis.boetes B ON B.spelersnr = S.spelersnr
LEFT JOIN tennis.teams ON teams.spelersnr = S.spelersnr
GROUP BY S.spelersnr, S.naam, S.voorletters
HAVING (select count(*)
	   from tennis.teams T2
	   where T2.spelersnr = S.spelersnr
	   group by T2.spelersnr) > 0
ORDER BY S.spelersnr;

--???
--Geef voor elke aanvoerder het spelersnr, de naam en het aantal boetes dat voor hem of haar betaald is
--en het aantal teams dat hij of zij aanvoert. 
--Toon enkel aanvoerders die boetes gekregen hebben. Sorteer van voor naar achter, oplopend.

select S.spelersnr, S.naam 
from tennis.spelers S 
inner join (select spelersnr
		   from tennis.boetes B2
		   where extract(year from datum) = '1980' and bedrag = 25
			) T2 on S.spelersnr = T2.spelersnr
where plaats = 'Rijswijk'
order by 1,2;

--Geef een lijst met het spelersnummer en de naam van de spelers die in Rijswijk wonen en die in 1980 een boete gekregen hebben van 25 euro 
--(meerdere voorwaarden dus). Gebruik hiervoor geen exists operator maar wel zijn tegenhanger die meestal bij niet-gecorreleerde subquery's wordt gebruikt. 
--Sorteer van voor naar achter, oplopend.

select S.naam, S.voorletters, S.geb_datum 
from tennis.spelers S
group by S.spelersnr, S.naam, S.voorletters, S.geb_datum
having (select count(*)
	   from tennis.wedstrijden W
	   where S.spelersnr = W.spelersnr
	   group by W.spelersnr) < (select count(*)
										  from tennis.boetes B
										  where B.spelersnr = S.spelersnr
										  group by B.spelersnr)
order by 1,2,3;

--Geef alle spelers voor wie meer boetes zijn betaald dan dat ze wedstrijden hebben gespeeld.
--Zorg dat spelers zonder wedstrijd ook getoond worden.
--Sorteer van voor naar achter, oplopend.

select S.spelersnr, S.naam
from tennis.spelers S
where S.spelersnr not in (select W.spelersnr
						 from tennis.wedstrijden W
						 where W.teamnr = 1
						 group by W.spelersnr)
order by S.naam, S.spelersnr;

--Geef alle spelers die geen wedstrijd voor team 1 hebben gespeeld. 
--Sorteer op naam, daarna op nr.

select B.spelersnr, B.bedrag, --age van B.datum
from tennis.boetes B
where B.betalingsnr in (select betalingsnr
					   from tennis.boetes B2
					   where /*toon betalingsnr met het hoogste bedrag in veld B.bedrag*/)
group by B.spelersnr
order by 1,2,3;
--Geef voor elke speler die ooit een boete heeft betaald, 
--de hoogste boete weer en hoelang het geleden is dat deze boete werd betaald. 
--Sorteer van groot naar klein op bedrag en daarna omgekeerd op “leeftijd..” van de boete.