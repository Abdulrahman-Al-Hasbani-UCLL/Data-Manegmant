--
-- PostgreSQL database dump
--

-- Dumped from database version 15.6 (Debian 15.6-1.pgdg120+1)
-- Dumped by pg_dump version 15.4

-- Started on 2024-02-27 09:41:43

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_table_access_method = heap;

--
-- TOC entry 371 (class 1259 OID 18686)
-- Name: bestuursleden; Type: TABLE; Schema: tennis; Owner: -
--
CREATE SCHEMA tennis

CREATE TABLE tennis.bestuursleden (
    spelersnr integer NOT NULL,
    begin_datum date NOT NULL,
    eind_datum date,
    functie character(20),
    CONSTRAINT bestuursleden_begin_datum_check CHECK ((begin_datum >= '1990-01-01'::date)),
    CONSTRAINT bestuursleden_check CHECK ((begin_datum < eind_datum))
);


--
-- TOC entry 372 (class 1259 OID 18691)
-- Name: boetes; Type: TABLE; Schema: tennis; Owner: -
--

CREATE TABLE tennis.boetes (
    betalingsnr integer NOT NULL,
    spelersnr integer NOT NULL,
    datum date NOT NULL,
    bedrag numeric(7,2) NOT NULL,
    CONSTRAINT boetes_bedrag_check CHECK ((bedrag > (0)::numeric)),
    CONSTRAINT boetes_datum_check CHECK ((datum >= '1969-12-31'::date))
);


--
-- TOC entry 373 (class 1259 OID 18696)
-- Name: spelers; Type: TABLE; Schema: tennis; Owner: -
--

CREATE TABLE tennis.spelers (
    spelersnr integer NOT NULL,
    naam character(15) NOT NULL,
    voorletters character(3) NOT NULL,
    geb_datum date,
    geslacht character(1) NOT NULL,
    jaartoe smallint NOT NULL,
    straat character varying(30) NOT NULL,
    huisnr character(4),
    postcode character(6),
    plaats character varying(30) NOT NULL,
    telefoon character(13),
    bondsnr character(4),
    CONSTRAINT spelers_geslacht_check CHECK ((geslacht = ANY (ARRAY['V'::bpchar, 'M'::bpchar]))),
    CONSTRAINT spelers_jaartoe_check CHECK ((jaartoe > 1969)),
    CONSTRAINT spelers_postcode_check CHECK ((postcode ~~ '______'::text))
);


--
-- TOC entry 378 (class 1259 OID 18722)
-- Name: teams; Type: TABLE; Schema: tennis; Owner: -
--

CREATE TABLE tennis.teams (
    teamnr integer NOT NULL,
    spelersnr integer NOT NULL,
    divisie character(6) NOT NULL,
    CONSTRAINT teams_divisie_check CHECK ((divisie = ANY (ARRAY['ere'::bpchar, 'tweede'::bpchar])))
);


--
-- TOC entry 379 (class 1259 OID 18726)
-- Name: wedstrijden; Type: TABLE; Schema: tennis; Owner: -
--

CREATE TABLE tennis.wedstrijden (
    wedstrijdnr integer NOT NULL,
    teamnr integer NOT NULL,
    spelersnr integer NOT NULL,
    gewonnen smallint NOT NULL,
    verloren smallint NOT NULL,
    CONSTRAINT wedstrijden_gewonnen_check CHECK (((gewonnen >= 0) AND (gewonnen <= 3))),
    CONSTRAINT wedstrijden_verloren_check CHECK (((verloren >= 0) AND (verloren <= 3)))
);


--
-- TOC entry 3928 (class 0 OID 18686)
-- Dependencies: 371
-- Data for Name: bestuursleden; Type: TABLE DATA; Schema: tennis; Owner: -
--

INSERT INTO tennis.bestuursleden VALUES (6, '1990-01-01', '1990-12-31', 'Secretaris          ');
INSERT INTO tennis.bestuursleden VALUES (6, '1991-01-01', '1992-12-31', 'Lid                 ');
INSERT INTO tennis.bestuursleden VALUES (6, '1992-01-01', '1993-12-31', 'Penningmeester      ');
INSERT INTO tennis.bestuursleden VALUES (6, '1993-01-01', NULL, 'Voorzitter          ');
INSERT INTO tennis.bestuursleden VALUES (2, '1990-01-01', '1992-12-31', 'Voorzitter          ');
INSERT INTO tennis.bestuursleden VALUES (2, '1994-01-01', NULL, 'Lid                 ');
INSERT INTO tennis.bestuursleden VALUES (112, '1992-01-01', '1992-12-31', 'Lid                 ');
INSERT INTO tennis.bestuursleden VALUES (112, '1994-01-01', NULL, 'Secretaris          ');
INSERT INTO tennis.bestuursleden VALUES (8, '1990-01-01', '1990-12-31', 'Penningmeester      ');
INSERT INTO tennis.bestuursleden VALUES (8, '1991-01-01', '1991-12-31', 'Secretaris          ');
INSERT INTO tennis.bestuursleden VALUES (8, '1993-01-01', '1993-12-31', 'Lid                 ');
INSERT INTO tennis.bestuursleden VALUES (8, '1994-01-01', NULL, 'Lid                 ');
INSERT INTO tennis.bestuursleden VALUES (57, '1992-01-01', '1992-12-31', 'Secretaris          ');
INSERT INTO tennis.bestuursleden VALUES (27, '1990-01-01', '1990-12-31', 'Lid                 ');
INSERT INTO tennis.bestuursleden VALUES (27, '1991-01-01', '1991-12-31', 'Penningmeester      ');
INSERT INTO tennis.bestuursleden VALUES (27, '1993-01-01', '1993-12-31', 'Penningmeester      ');
INSERT INTO tennis.bestuursleden VALUES (95, '1994-01-01', NULL, 'Penningmeester      ');


--
-- TOC entry 3929 (class 0 OID 18691)
-- Dependencies: 372
-- Data for Name: boetes; Type: TABLE DATA; Schema: tennis; Owner: -
--

INSERT INTO tennis.boetes VALUES (1, 6, '1980-12-08', 100.00);
INSERT INTO tennis.boetes VALUES (2, 44, '1981-05-05', 75.00);
INSERT INTO tennis.boetes VALUES (3, 27, '1983-09-10', 100.00);
INSERT INTO tennis.boetes VALUES (4, 104, '1984-12-08', 50.00);
INSERT INTO tennis.boetes VALUES (5, 44, '1980-12-08', 25.00);
INSERT INTO tennis.boetes VALUES (6, 8, '1980-12-08', 25.00);
INSERT INTO tennis.boetes VALUES (7, 44, '1982-12-30', 30.00);
INSERT INTO tennis.boetes VALUES (8, 27, '1984-11-12', 75.00);


--
-- TOC entry 3930 (class 0 OID 18696)
-- Dependencies: 373
-- Data for Name: spelers; Type: TABLE DATA; Schema: tennis; Owner: -
--

INSERT INTO tennis.spelers VALUES (2, 'Elfring        ', 'R  ', '1948-09-01', 'M', 1975, 'Steden', '43  ', '3575NH', 'Den Haag', '070-237893   ', '2411');
INSERT INTO tennis.spelers VALUES (6, 'Permentier     ', 'R  ', '1964-06-25', 'M', 1977, 'Hazensteinln', '80  ', '1234KK', 'Den Haag', '070-476537   ', '8467');
INSERT INTO tennis.spelers VALUES (7, 'Wijers         ', 'GWS', '1963-05-11', 'M', 1981, 'Erasmusweg', '39  ', '9758VB', 'Den Haag', '070-347689   ', NULL);
INSERT INTO tennis.spelers VALUES (8, 'Niewenburg     ', 'B  ', '1962-07-08', 'V', 1980, 'Spoorlaan', '4   ', '6584WO', 'Rijswijk', '070-458458   ', '2983');
INSERT INTO tennis.spelers VALUES (27, 'Cools          ', 'DD ', '1964-12-28', 'V', 1983, 'Liespad', '804 ', '8457DK', 'Zoetermeer', '079-234857   ', '2513');
INSERT INTO tennis.spelers VALUES (28, 'Cools          ', 'C  ', '1963-06-22', 'V', 1983, 'Oudegracht', '10  ', '1294QK', 'Leiden', '010-659599   ', NULL);
INSERT INTO tennis.spelers VALUES (39, 'Bischoff       ', 'D  ', '1956-10-29', 'M', 1980, 'Ericaplein', '78  ', '9629CD', 'Den Haag', '070-393435   ', NULL);
INSERT INTO tennis.spelers VALUES (44, 'Bakker, de     ', 'E  ', '1963-01-09', 'M', 1980, 'Lawaaistraat', '23  ', '4444LJ', 'Rijswijk', '070-368753   ', '1124');
INSERT INTO tennis.spelers VALUES (57, 'Bohemen, van   ', 'M  ', '1971-08-17', 'M', 1985, 'Erasmusweg', '16  ', '4377CB', 'Den Haag', '070-473458   ', '6409');
INSERT INTO tennis.spelers VALUES (83, 'Hofland        ', 'PK ', '1956-11-11', 'M', 1982, 'Mariakade', '16a ', '1812UP', 'Den Haag', '070-353548   ', '1608');
INSERT INTO tennis.spelers VALUES (95, 'Meuleman       ', 'P  ', '1963-05-14', 'M', 1972, 'Hoofdweg', '33a ', '5746OP', 'Voorburg', '070-867564   ', NULL);
INSERT INTO tennis.spelers VALUES (100, 'Permentier     ', 'P  ', '1963-02-28', 'M', 1979, 'Hazensteinln', '80  ', '6494SG', 'Den Haag', '070-494593   ', '6524');
INSERT INTO tennis.spelers VALUES (104, 'Moerman        ', 'D  ', '1970-05-10', 'V', 1984, 'Stoutlaan', '65  ', '9437AO', 'Zoetermeer', '079-987571   ', '7060');
INSERT INTO tennis.spelers VALUES (112, 'Baalen, van    ', 'IP ', '1963-10-01', 'V', 1984, 'Vosseweg', '8   ', '6392LK', 'Rotterdam', '010-548745   ', '1319');


--
-- TOC entry 3931 (class 0 OID 18722)
-- Dependencies: 378
-- Data for Name: teams; Type: TABLE DATA; Schema: tennis; Owner: -
--

INSERT INTO tennis.teams VALUES (1, 6, 'ere   ');
INSERT INTO tennis.teams VALUES (2, 27, 'tweede');


--
-- TOC entry 3932 (class 0 OID 18726)
-- Dependencies: 379
-- Data for Name: wedstrijden; Type: TABLE DATA; Schema: tennis; Owner: -
--

INSERT INTO tennis.wedstrijden VALUES (1, 1, 6, 3, 1);
INSERT INTO tennis.wedstrijden VALUES (2, 1, 6, 2, 3);
INSERT INTO tennis.wedstrijden VALUES (3, 1, 6, 3, 0);
INSERT INTO tennis.wedstrijden VALUES (4, 1, 44, 3, 2);
INSERT INTO tennis.wedstrijden VALUES (5, 1, 83, 0, 3);
INSERT INTO tennis.wedstrijden VALUES (6, 1, 2, 1, 3);
INSERT INTO tennis.wedstrijden VALUES (7, 1, 57, 3, 0);
INSERT INTO tennis.wedstrijden VALUES (8, 1, 8, 0, 3);
INSERT INTO tennis.wedstrijden VALUES (9, 2, 27, 3, 2);
INSERT INTO tennis.wedstrijden VALUES (10, 2, 104, 3, 2);
INSERT INTO tennis.wedstrijden VALUES (11, 2, 112, 2, 3);
INSERT INTO tennis.wedstrijden VALUES (12, 2, 112, 1, 3);
INSERT INTO tennis.wedstrijden VALUES (13, 2, 8, 0, 3);


--
-- TOC entry 3713 (class 2606 OID 18770)
-- Name: bestuursleden bestuursleden_pkey; Type: CONSTRAINT; Schema: tennis; Owner: -
--

ALTER TABLE ONLY tennis.bestuursleden
    ADD CONSTRAINT bestuursleden_pkey PRIMARY KEY (spelersnr, begin_datum);


--
-- TOC entry 3715 (class 2606 OID 18772)
-- Name: boetes boetes_pkey; Type: CONSTRAINT; Schema: tennis; Owner: -
--

ALTER TABLE ONLY tennis.boetes
    ADD CONSTRAINT boetes_pkey PRIMARY KEY (betalingsnr);


--
-- TOC entry 3717 (class 2606 OID 18782)
-- Name: spelers spelers_pkey; Type: CONSTRAINT; Schema: tennis; Owner: -
--

ALTER TABLE ONLY tennis.spelers
    ADD CONSTRAINT spelers_pkey PRIMARY KEY (spelersnr);


--
-- TOC entry 3719 (class 2606 OID 18784)
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: tennis; Owner: -
--

ALTER TABLE ONLY tennis.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (teamnr);


--
-- TOC entry 3721 (class 2606 OID 18786)
-- Name: wedstrijden wedstrijden_pkey; Type: CONSTRAINT; Schema: tennis; Owner: -
--

ALTER TABLE ONLY tennis.wedstrijden
    ADD CONSTRAINT wedstrijden_pkey PRIMARY KEY (wedstrijdnr);


--
-- TOC entry 3722 (class 2606 OID 18862)
-- Name: bestuursleden bestuursleden_spelersnr_fkey; Type: FK CONSTRAINT; Schema: tennis; Owner: -
--

ALTER TABLE ONLY tennis.bestuursleden
    ADD CONSTRAINT bestuursleden_spelersnr_fkey FOREIGN KEY (spelersnr) REFERENCES tennis.spelers(spelersnr);


--
-- TOC entry 3723 (class 2606 OID 18867)
-- Name: boetes boetes_spelersnr_fkey; Type: FK CONSTRAINT; Schema: tennis; Owner: -
--

ALTER TABLE ONLY tennis.boetes
    ADD CONSTRAINT boetes_spelersnr_fkey FOREIGN KEY (spelersnr) REFERENCES tennis.spelers(spelersnr);


--
-- TOC entry 3724 (class 2606 OID 18872)
-- Name: teams teams_spelersnr_fkey; Type: FK CONSTRAINT; Schema: tennis; Owner: -
--

ALTER TABLE ONLY tennis.teams
    ADD CONSTRAINT teams_spelersnr_fkey FOREIGN KEY (spelersnr) REFERENCES tennis.spelers(spelersnr);


--
-- TOC entry 3725 (class 2606 OID 18877)
-- Name: wedstrijden wedstrijden_spelersnr_fkey; Type: FK CONSTRAINT; Schema: tennis; Owner: -
--

ALTER TABLE ONLY tennis.wedstrijden
    ADD CONSTRAINT wedstrijden_spelersnr_fkey FOREIGN KEY (spelersnr) REFERENCES tennis.spelers(spelersnr);


--
-- TOC entry 3726 (class 2606 OID 18882)
-- Name: wedstrijden wedstrijden_teamnr_fkey; Type: FK CONSTRAINT; Schema: tennis; Owner: -
--

ALTER TABLE ONLY tennis.wedstrijden
    ADD CONSTRAINT wedstrijden_teamnr_fkey FOREIGN KEY (teamnr) REFERENCES tennis.teams(teamnr);


-- Completed on 2024-02-27 09:41:48

--
-- PostgreSQL database dump complete
--

