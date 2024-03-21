-- Maak de tabel voor muziekgroepen
CREATE TABLE Muziekgroepen (
    id SERIAL,
    afkorting VARCHAR(100) UNIQUE,
    naam VARCHAR(100) UNIQUE default 'TC Matic',
	PRIMARY KEY(id)
);

-- Maak de tabel voor albums
CREATE TABLE Albums (
    id SERIAL PRIMARY KEY,
    naam VARCHAR(100),
    muziekgroep_id INTEGER,
    FOREIGN KEY (muziekgroep_id) REFERENCES Muziekgroepen(id) ON DELETE SET NULL
);

-- Voeg TC Matic toe als standaard muziekgroep
INSERT INTO Muziekgroepen (afkorting, naam) VALUES ('TCM', 'TC Matic');

/* Onnodig
-- Maak een trigger om TC Matic als standaard muziekgroep in te stellen wanneer er niets wordt ingevuld bij het album
CREATE OR REPLACE FUNCTION set_default_muziekgroep() RETURNS TRIGGER AS $$
BEGIN
    IF NEW.muziekgroep_id IS NULL THEN
        NEW.muziekgroep_id := (SELECT id FROM Muziekgroepen WHERE naam = 'TC Matic');
    END IF;
    RETURN NEW;
END; 

CREATE TRIGGER default_muziekgroep
BEFORE INSERT ON Albums
FOR EACH ROW
EXECUTE FUNCTION set_default_muziekgroep();
*/

-- Voeg wat muziekgroepen toe
INSERT INTO Muziekgroepen (afkorting, naam) VALUES ('QOTSA', 'Queens of the Stone Age');
INSERT INTO Muziekgroepen (afkorting, naam) VALUES ('RHCP', 'Red Hot Chili Peppers');
INSERT INTO Muziekgroepen (afkorting, naam) VALUES ('NIR', 'Nirvana');

-- Voeg wat albums toe
INSERT INTO Albums (naam, muziekgroep_id) VALUES ('Songs for the Deaf', (SELECT id FROM Muziekgroepen WHERE afkorting = 'QOTSA'));
INSERT INTO Albums (naam, muziekgroep_id) VALUES ('Californication', (SELECT id FROM Muziekgroepen WHERE afkorting = 'RHCP'));
INSERT INTO Albums (naam, muziekgroep_id) VALUES ('Nevermind', (SELECT id FROM Muziekgroepen WHERE afkorting = 'NIR'));
INSERT INTO Albums (naam) VALUES ('Onbekend Album');

--select data
select * from albums inner join muziekgroepen ON muziekgroepen.id = albums.muziekgroep_id

--Vraag:
/* 
Laat ons veronderstellen dat muziekgroepen meerdere albums kunnen uitbrengen. Zorg dat in je ontwerp minstens aan de volgende voorwaarden voldaan is:
Zorg ervoor dat de standaard muziekgroep TC Matic is wanneer er niets wordt ingevuld bij het album.
Zorg ervoor dat naast een unieke afkorting om als verwijzing te gebruiken, ook de naam van de groep steeds uniek is. Er mag hoogstens 1 groep zonder naam zijn.
Zorg ervoor dat wanneer een muziekgroep verwijderd wordt, hun albums niet verwijdert worden, maar in de plaats hiervan verwijzen naar niets.
Maak de benodigde tabellen en eventuele data aan.
*/ 
--END vraag 1
SELECT table_name
FROM information_schema.tables
WHERE table_type='BASE TABLE'
      AND table_schema = 'public'

--Vraag:Toon alle aanwezige tabellen op de databank met een query.
--END vraag 2

-- connect met de pooling:
SELECT *
FROM information_schema.tables

SELECT datname, pg_encoding_to_char(encoding) AS codering
FROM pg_database
WHERE datname IN ('probeer', 'probeer_locale');

--Wat zijn de coderingen van de probeer en de probeer_locale databank?
--Kan je voor 1 specifieke kolom in een tabel een andere sorteer volgorde afdwingen in het ontwerp?