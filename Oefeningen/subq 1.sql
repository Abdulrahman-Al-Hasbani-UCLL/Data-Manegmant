select S.spelersnr, 
	case
	when count(B.betalingsnr) <1 then ' '
	else cast (count(B.betalingsnr) as varchar(10))
	END "aantalboetes"
from tennis.spelers S inner join tennis.wedstrijden W on W.spelersnr = S.spelersnr
left join tennis.boetes B on B.spelersnr = S.spelersnr
group by S.spelersnr
order by 2, 1;
--Geef voor elke speler die een wedstrijd heeft gespeeld het spelersnr en het totaal aantal boetes.
--Spelers die een wedstrijd gespeeld hebben, maar geen boetes hebben, moeten ook getoond worden.
--Sorteer op het aantal boetes en op spelersnr;