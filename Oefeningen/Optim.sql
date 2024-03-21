select S.spelersnr, S.naam 
from tennis.spelers S
inner join tennis.boetes B on B.spelersnr = S.spelersnr And B.bedrag = 25 AND Extract(year from B.datum) = 1980
where S.plaats = 'Rijswijk'
order by 1,2;

--Geef een lijst met het spelersnummer en de naam van de speler die in Rijswijk wonen en die in 1980 een boete gekregen hebben van 25 euro.
--Sorteer van voor naar achter.
--Probeer gelijk of beter te doen dan "(cost=2.37..2.37 rows=1 width=68)".

select S.naam, S.spelersnr
from tennis.bestuursleden BS
inner join tennis.spelers S on S.spelersnr = BS.spelersnr
inner join tennis.boetes B on B.spelersnr = BS.spelersnr And B.bedrag >= 75
inner join tennis.wedstrijden W on W.spelersnr = BS.spelersnr And W.gewonnen> W.verloren+2
Where BS.functie = 'Penningmeester'
group by S.naam, S.spelersnr
order by 1,2;

--Geef de naam en het spelersnummer van de spelers die ooit penningmeester geweest zijn van de club, 
--die bovendien ooit een boete betaald hebben van meer dan 75 euro, en die ooit een wedstrijd gewonnen hebben met meer dan 2 sets verschil. 
--Sorteer van voor naar achter.
--Probeer gelijk of beter te doen dan "Unique (cost=100.38..100.54 rows=21 width=68)".

select S.spelersnr, S.naam, S.voorletters, (S.jaartoe - (select avg(jaartoe) from tennis.spelers )) as verschil 
from tennis.spelers S
group by S.spelersnr, S.naam, S.voorletters, S.jaartoe
order by 1,2,3,4;

-- ????
--Geef van elke speler het spelersnr, de naam en het verschil tussen zijn of 
--haar jaar van toetreding en het gemiddeld jaar van toetreding. Sorteer van voor naar achter.
--Probeer gelijk of beter te doen dan "Sort (cost=33.16..33.66 rows=200 width=86)"

SELECT aantal_boetes as "a", COUNT(*) AS "count"
FROM (
    SELECT spelersnr, COUNT(*) AS aantal_boetes
    FROM tennis.boetes
    GROUP BY spelersnr
) AS boetes_per_speler
GROUP BY aantal_boetes
ORDER BY 1,2;

-- ???
--Je kan per speler berekenen hoeveel boetes die speler heeft gehad en wat het totaalbedrag per speler is.
--Pas nu deze querie aan zodat per verschillend aantal boetes wordt getoond hoe vaak dit aantal boetes voorkwam. 
--Sorteer van voor naar achter.
--Probeer gelijk of beter te doen dan "Sort (cost=46.39..46.89 rows=200 width=8)".

select S.spelersnr, S.naam, S.voorletters, T2.toetredingsleeftijd
from tennis.spelers S
inner join (select spelersnr, (jaartoe -extract(year from geb_datum)) as "toetredingsleeftijd" from tennis.spelers) T2 on S.spelersnr = T2.spelersnr And toetredingsleeftijd >20
order by 1,2,3,4;

-- ???
--Geef van alle spelers het verschil tussen het jaar van toetreding en het geboortejaar,
--maar geef alleen die spelers waarvan dat verschil groter is dan 20. Sorteer van voor naar achter.
--Probeer zo goed of beter te doen dan "Sort (cost=17.20..17.37 rows=67 width=90)"

SELECT spelersnr, naam, voorletters, geb_datum
FROM tennis.spelers
WHERE CONCAT(naam, ' ', voorletters) < (
    SELECT CONCAT(naam, ' ', voorletters)
    FROM tennis.spelers
    WHERE spelersnr = 8
)
ORDER BY 1,2,3,4;

-- ???
--Geef alle spelers die alfabetisch (dus naam en voorletters, in deze volgorde) voor speler 8 staan. 
--Sorteer van voor naar achter.
--Probeer zo goed of beter te doen dan "Sort (cost=24.31..24.47 rows=67 width=88)"





