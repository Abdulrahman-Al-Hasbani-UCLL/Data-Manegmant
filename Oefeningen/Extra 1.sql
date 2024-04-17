Select sum(gewonnen) as totaal_gewonnen, sum(verloren) as totaal_verloren, (sum(gewonnen)-sum(verloren)) as saldo
from tennis.wedstrijden;

--Hoeveel sets zijn er in totaal gewonnen, hoeveel sets werden in totaal verloren en welk is het uiteindelijke saldo?


--Geef een totaal overzicht van alle spelers, hun boetes en de functies die ooit vervuld hebben. 
--Elke speler moet getoond worden, als ie een eventuele boete heeft gekregen en/of een eventuele functie als bestuurslid heeft gehad dan moet dit ook getoond worden. 
--Toon de volledige naam, het bedrag en datum van de eventuele boete en de eventuele bestuursfuncties. 
--Sorteer van voor naar achter.

SELECT S.naam, S.voorletters,B.functie, BO.bedrag, BO.datum
FROM tennis.spelers S
LEFT JOIN tennis.bestuursleden B ON B.spelersnr = S.spelersnr
LEFT JOIN tennis.boetes BO ON BO.spelersnr = S.spelersnr
ORDER BY 1,2,3,4;
