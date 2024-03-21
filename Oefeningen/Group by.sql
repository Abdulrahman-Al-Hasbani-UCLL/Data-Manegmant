SELECT *
FROM
(
    SELECT
        CAST(extract(year from K.geboortedatum) AS VARCHAR) as "date_part",
        count(*) as "aantal_klanten",
        min(K.klantnr) as "min_klantnr",
        max(K.klantnr) as "max_klantnr"
    FROM
        ruimtereizen.klanten K
    GROUP BY
        extract(year from K.geboortedatum)

    UNION ALL

    SELECT
        CAST('' AS VARCHAR) as "date_part",
        count(*) as "aantal_klanten",
        min(klantnr) as "min_klantnr",
        max(klantnr) as "max_klantnr"
    FROM
        ruimtereizen.klanten
) AS combined_results
ORDER BY
    CASE WHEN "date_part" = '' THEN 2 ELSE 1 END,
    "date_part", "aantal_klanten", "min_klantnr", "max_klantnr";

-- ???
--Geef voor elke geboortejaar van de klanten, het aantal klanten, het kleinste klantennummer en het grootste klantennummer. 
--Geef ook het totaal aantal klanten en het kleinste en grootste klantennummer.
--Sorteer van voor naar achter.