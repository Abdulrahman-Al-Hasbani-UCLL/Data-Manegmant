--
-- PostgreSQL database dump
--

-- Dumped from database version 15.6 (Debian 15.6-1.pgdg120+1)
-- Dumped by pg_dump version 15.4

-- Started on 2024-02-27 08:50:48

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

--
-- TOC entry 9 (class 2615 OID 17977)
-- Name: ruimtereizen; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA ruimtereizen;


SET default_table_access_method = heap;

--
-- TOC entry 233 (class 1259 OID 18069)
-- Name: bezoeken; Type: TABLE; Schema: ruimtereizen; Owner: -
--

CREATE TABLE ruimtereizen.bezoeken (
    reisnr numeric(4,0) NOT NULL,
    objectnaam character varying(10) NOT NULL,
    volgnr numeric(2,0) NOT NULL,
    verblijfsduur numeric(4,0) NOT NULL
);


--
-- TOC entry 234 (class 1259 OID 18072)
-- Name: deelnames; Type: TABLE; Schema: ruimtereizen; Owner: -
--

CREATE TABLE ruimtereizen.deelnames (
    reisnr numeric(4,0) NOT NULL,
    klantnr numeric(4,0) NOT NULL
);


--
-- TOC entry 235 (class 1259 OID 18075)
-- Name: hemelobjecten; Type: TABLE; Schema: ruimtereizen; Owner: -
--

CREATE TABLE ruimtereizen.hemelobjecten (
    objectnaam character varying(10) NOT NULL,
    satellietvan character varying(10),
    afstand numeric(10,3),
    diameter numeric(7,0)
);


--
-- TOC entry 236 (class 1259 OID 18078)
-- Name: klanten; Type: TABLE; Schema: ruimtereizen; Owner: -
--

CREATE TABLE ruimtereizen.klanten (
    klantnr numeric(4,0) NOT NULL,
    naam character varying(20) NOT NULL,
    vnaam character varying(15) NOT NULL,
    geboortedatum date NOT NULL
);


--
-- TOC entry 237 (class 1259 OID 18081)
-- Name: reizen; Type: TABLE; Schema: ruimtereizen; Owner: -
--

CREATE TABLE ruimtereizen.reizen (
    reisnr numeric(4,0) NOT NULL,
    vertrekdatum date NOT NULL,
    reisduur numeric(4,0) NOT NULL,
    prijs numeric(5,2)
);


--
-- TOC entry 3923 (class 0 OID 18069)
-- Dependencies: 233
-- Data for Name: bezoeken; Type: TABLE DATA; Schema: ruimtereizen; Owner: -
--

INSERT INTO ruimtereizen.bezoeken VALUES (31, 'Maan', 1, 7);
INSERT INTO ruimtereizen.bezoeken VALUES (32, 'Maan', 1, 0);
INSERT INTO ruimtereizen.bezoeken VALUES (32, 'Phobos', 2, 1);
INSERT INTO ruimtereizen.bezoeken VALUES (32, 'Deimos', 3, 0);
INSERT INTO ruimtereizen.bezoeken VALUES (32, 'Mars', 4, 3);
INSERT INTO ruimtereizen.bezoeken VALUES (32, 'Maan', 5, 2);
INSERT INTO ruimtereizen.bezoeken VALUES (33, 'Maan', 1, 8);
INSERT INTO ruimtereizen.bezoeken VALUES (34, 'Mars', 1, 14);
INSERT INTO ruimtereizen.bezoeken VALUES (34, 'Jupiter', 2, 0);
INSERT INTO ruimtereizen.bezoeken VALUES (34, 'Io', 3, 5);
INSERT INTO ruimtereizen.bezoeken VALUES (35, 'Maan', 1, 5);
INSERT INTO ruimtereizen.bezoeken VALUES (35, 'Mars', 2, 7);
INSERT INTO ruimtereizen.bezoeken VALUES (35, 'Maan', 3, 0);
INSERT INTO ruimtereizen.bezoeken VALUES (36, 'Mars', 1, 12);
INSERT INTO ruimtereizen.bezoeken VALUES (36, 'Jupiter', 2, 0);
INSERT INTO ruimtereizen.bezoeken VALUES (36, 'Io', 3, 3);


--
-- TOC entry 3924 (class 0 OID 18072)
-- Dependencies: 234
-- Data for Name: deelnames; Type: TABLE DATA; Schema: ruimtereizen; Owner: -
--

INSERT INTO ruimtereizen.deelnames VALUES (31, 121);
INSERT INTO ruimtereizen.deelnames VALUES (31, 122);
INSERT INTO ruimtereizen.deelnames VALUES (31, 123);
INSERT INTO ruimtereizen.deelnames VALUES (31, 124);
INSERT INTO ruimtereizen.deelnames VALUES (32, 121);
INSERT INTO ruimtereizen.deelnames VALUES (32, 123);
INSERT INTO ruimtereizen.deelnames VALUES (32, 124);
INSERT INTO ruimtereizen.deelnames VALUES (33, 121);
INSERT INTO ruimtereizen.deelnames VALUES (33, 125);
INSERT INTO ruimtereizen.deelnames VALUES (33, 126);
INSERT INTO ruimtereizen.deelnames VALUES (34, 122);
INSERT INTO ruimtereizen.deelnames VALUES (34, 125);
INSERT INTO ruimtereizen.deelnames VALUES (34, 126);


--
-- TOC entry 3925 (class 0 OID 18075)
-- Dependencies: 235
-- Data for Name: hemelobjecten; Type: TABLE DATA; Schema: ruimtereizen; Owner: -
--

INSERT INTO ruimtereizen.hemelobjecten VALUES ('Zon', NULL, NULL, 1393000);
INSERT INTO ruimtereizen.hemelobjecten VALUES ('Mercurius', 'Zon', 57900.000, 4878);
INSERT INTO ruimtereizen.hemelobjecten VALUES ('Venus', 'Zon', 108200.000, 12104);
INSERT INTO ruimtereizen.hemelobjecten VALUES ('Aarde', 'Zon', 149600.000, 12756);
INSERT INTO ruimtereizen.hemelobjecten VALUES ('Maan', 'Aarde', 384.400, 3476);
INSERT INTO ruimtereizen.hemelobjecten VALUES ('Mars', 'Zon', 227900.000, 6794);
INSERT INTO ruimtereizen.hemelobjecten VALUES ('Phobos', 'Mars', 9.270, 14);
INSERT INTO ruimtereizen.hemelobjecten VALUES ('Deimos', 'Mars', 23.400, 7);
INSERT INTO ruimtereizen.hemelobjecten VALUES ('Jupiter', 'Zon', 778000.000, 143884);
INSERT INTO ruimtereizen.hemelobjecten VALUES ('Metis', 'Jupiter', 127.960, 40);
INSERT INTO ruimtereizen.hemelobjecten VALUES ('Adrastea', 'Jupiter', 128.980, 21);
INSERT INTO ruimtereizen.hemelobjecten VALUES ('Amalthea', 'Jupiter', 181.300, 180);
INSERT INTO ruimtereizen.hemelobjecten VALUES ('Thebe', 'Jupiter', 221.900, 62);
INSERT INTO ruimtereizen.hemelobjecten VALUES ('Io', 'Jupiter', 421.600, 3645);
INSERT INTO ruimtereizen.hemelobjecten VALUES ('Europa', 'Jupiter', 670.900, 3130);
INSERT INTO ruimtereizen.hemelobjecten VALUES ('Ganymedes', 'Jupiter', 1070.000, 5268);
INSERT INTO ruimtereizen.hemelobjecten VALUES ('Calisto', 'Jupiter', 1880.000, 4806);
INSERT INTO ruimtereizen.hemelobjecten VALUES ('Leda', 'Jupiter', 11094.000, 10);
INSERT INTO ruimtereizen.hemelobjecten VALUES ('Himalia', 'Jupiter', 11480.000, 170);
INSERT INTO ruimtereizen.hemelobjecten VALUES ('Lysithea', 'Jupiter', 11720.000, 24);
INSERT INTO ruimtereizen.hemelobjecten VALUES ('Elara', 'Jupiter', 11737.000, 80);
INSERT INTO ruimtereizen.hemelobjecten VALUES ('Ananke', 'Jupiter', 21200.000, 20);
INSERT INTO ruimtereizen.hemelobjecten VALUES ('Carme', 'Jupiter', 22600.000, 30);
INSERT INTO ruimtereizen.hemelobjecten VALUES ('Pasiphaë', 'Jupiter', 23500.000, 36);
INSERT INTO ruimtereizen.hemelobjecten VALUES ('Sinope', 'Jupiter', 23700.000, 28);
INSERT INTO ruimtereizen.hemelobjecten VALUES ('Saturnus', 'Zon', 1427000.000, 120536);
INSERT INTO ruimtereizen.hemelobjecten VALUES ('Pan', 'Saturnus', 133.600, 12);
INSERT INTO ruimtereizen.hemelobjecten VALUES ('Atlas', 'Saturnus', 137.670, 33);
INSERT INTO ruimtereizen.hemelobjecten VALUES ('Prometheus', 'Saturnus', 139.350, 105);
INSERT INTO ruimtereizen.hemelobjecten VALUES ('Pandora', 'Saturnus', 141.700, 86);
INSERT INTO ruimtereizen.hemelobjecten VALUES ('Epimetheus', 'Saturnus', 151.420, 180);
INSERT INTO ruimtereizen.hemelobjecten VALUES ('Janus', 'Saturnus', 151.470, 120);
INSERT INTO ruimtereizen.hemelobjecten VALUES ('Mimas', 'Saturnus', 185.540, 400);
INSERT INTO ruimtereizen.hemelobjecten VALUES ('Enceladus', 'Saturnus', 238.040, 498);
INSERT INTO ruimtereizen.hemelobjecten VALUES ('Tethys', 'Saturnus', 294.670, 1046);
INSERT INTO ruimtereizen.hemelobjecten VALUES ('Telesto', 'Saturnus', 294.670, 24);
INSERT INTO ruimtereizen.hemelobjecten VALUES ('Calypso', 'Saturnus', 294.670, 24);
INSERT INTO ruimtereizen.hemelobjecten VALUES ('Helene', 'Saturnus', 377.410, 35);
INSERT INTO ruimtereizen.hemelobjecten VALUES ('Dione', 'Saturnus', 377.420, 1120);
INSERT INTO ruimtereizen.hemelobjecten VALUES ('Rhea', 'Saturnus', 527.040, 1528);
INSERT INTO ruimtereizen.hemelobjecten VALUES ('Titan', 'Saturnus', 1221.860, 5150);
INSERT INTO ruimtereizen.hemelobjecten VALUES ('Hyperion', 'Saturnus', 1481.100, 295);
INSERT INTO ruimtereizen.hemelobjecten VALUES ('Iapetus', 'Saturnus', 3651.300, 1436);
INSERT INTO ruimtereizen.hemelobjecten VALUES ('Phoebe', 'Saturnus', 12954.000, 220);
INSERT INTO ruimtereizen.hemelobjecten VALUES ('Uranus', 'Zon', 2870000.000, 51118);
INSERT INTO ruimtereizen.hemelobjecten VALUES ('Cordelia', 'Uranus', 49.471, 26);
INSERT INTO ruimtereizen.hemelobjecten VALUES ('Ophelia', 'Uranus', 53.796, 30);
INSERT INTO ruimtereizen.hemelobjecten VALUES ('Bianca', 'Uranus', 59.173, 42);
INSERT INTO ruimtereizen.hemelobjecten VALUES ('Cressida', 'Uranus', 61.777, 62);
INSERT INTO ruimtereizen.hemelobjecten VALUES ('Desdemona', 'Uranus', 62.676, 54);
INSERT INTO ruimtereizen.hemelobjecten VALUES ('Juliet', 'Uranus', 64.372, 84);
INSERT INTO ruimtereizen.hemelobjecten VALUES ('Portia', 'Uranus', 66.085, 108);
INSERT INTO ruimtereizen.hemelobjecten VALUES ('Rosalind', 'Uranus', 69.941, 54);
INSERT INTO ruimtereizen.hemelobjecten VALUES ('Belinda', 'Uranus', 75.258, 66);
INSERT INTO ruimtereizen.hemelobjecten VALUES ('Puck', 'Uranus', 86.000, 154);
INSERT INTO ruimtereizen.hemelobjecten VALUES ('Miranda', 'Uranus', 129.400, 472);
INSERT INTO ruimtereizen.hemelobjecten VALUES ('Ariel', 'Uranus', 191.000, 1158);
INSERT INTO ruimtereizen.hemelobjecten VALUES ('Umbriel', 'Uranus', 266.300, 1169);
INSERT INTO ruimtereizen.hemelobjecten VALUES ('Titania', 'Uranus', 435.000, 1578);
INSERT INTO ruimtereizen.hemelobjecten VALUES ('Oberon', 'Uranus', 583.500, 1523);
INSERT INTO ruimtereizen.hemelobjecten VALUES ('Neptunus', 'Zon', 4497000.000, 50538);
INSERT INTO ruimtereizen.hemelobjecten VALUES ('Naiad', 'Neptunus', 48.000, 54);
INSERT INTO ruimtereizen.hemelobjecten VALUES ('Thalassa', 'Neptunus', 50.000, 80);
INSERT INTO ruimtereizen.hemelobjecten VALUES ('Despina', 'Neptunus', 52.500, 180);
INSERT INTO ruimtereizen.hemelobjecten VALUES ('Galathea', 'Neptunus', 62.000, 150);
INSERT INTO ruimtereizen.hemelobjecten VALUES ('Larissa', 'Neptunus', 73.600, 192);
INSERT INTO ruimtereizen.hemelobjecten VALUES ('Proteus', 'Neptunus', 117.600, 416);
INSERT INTO ruimtereizen.hemelobjecten VALUES ('Triton', 'Neptunus', 354.800, 2705);
INSERT INTO ruimtereizen.hemelobjecten VALUES ('Nereïde', 'Neptunus', 5517.000, 240);
INSERT INTO ruimtereizen.hemelobjecten VALUES ('Pluto', 'Zon', 5900000.000, 2324);
INSERT INTO ruimtereizen.hemelobjecten VALUES ('Charon', 'Pluto', 19.640, 1212);


--
-- TOC entry 3926 (class 0 OID 18078)
-- Dependencies: 236
-- Data for Name: klanten; Type: TABLE DATA; Schema: ruimtereizen; Owner: -
--

INSERT INTO ruimtereizen.klanten VALUES (121, 'Hassoui', 'Sjeik', '1975-06-12');
INSERT INTO ruimtereizen.klanten VALUES (122, 'Martens', 'Hedwich', '1978-06-30');
INSERT INTO ruimtereizen.klanten VALUES (123, 'Ellison', 'Larry', '1975-10-10');
INSERT INTO ruimtereizen.klanten VALUES (124, 'Van Rossem', 'Jean-Pierre', '1975-01-12');
INSERT INTO ruimtereizen.klanten VALUES (125, 'Frimout', 'Dirk', '1980-11-29');
INSERT INTO ruimtereizen.klanten VALUES (126, 'Gates', 'Bill', '1982-12-25');


--
-- TOC entry 3927 (class 0 OID 18081)
-- Dependencies: 237
-- Data for Name: reizen; Type: TABLE DATA; Schema: ruimtereizen; Owner: -
--

INSERT INTO ruimtereizen.reizen VALUES (31, '2020-06-02', 10, 2.50);
INSERT INTO ruimtereizen.reizen VALUES (32, '2020-06-03', 390, 17.50);
INSERT INTO ruimtereizen.reizen VALUES (33, '2020-10-12', 11, 2.65);
INSERT INTO ruimtereizen.reizen VALUES (34, '2021-01-10', 1380, 75.00);
INSERT INTO ruimtereizen.reizen VALUES (35, '2021-03-12', 380, 16.50);
INSERT INTO ruimtereizen.reizen VALUES (36, '2021-06-27', 1340, NULL);


--
-- TOC entry 3708 (class 2606 OID 18744)
-- Name: bezoeken bezoeken_pkey; Type: CONSTRAINT; Schema: ruimtereizen; Owner: -
--

ALTER TABLE ONLY ruimtereizen.bezoeken
    ADD CONSTRAINT bezoeken_pkey PRIMARY KEY (reisnr, volgnr);


--
-- TOC entry 3710 (class 2606 OID 18746)
-- Name: deelnames deelnames_pkey; Type: CONSTRAINT; Schema: ruimtereizen; Owner: -
--

ALTER TABLE ONLY ruimtereizen.deelnames
    ADD CONSTRAINT deelnames_pkey PRIMARY KEY (reisnr, klantnr);


--
-- TOC entry 3712 (class 2606 OID 18748)
-- Name: hemelobjecten hemelobjecten_pkey; Type: CONSTRAINT; Schema: ruimtereizen; Owner: -
--

ALTER TABLE ONLY ruimtereizen.hemelobjecten
    ADD CONSTRAINT hemelobjecten_pkey PRIMARY KEY (objectnaam);


--
-- TOC entry 3714 (class 2606 OID 18750)
-- Name: klanten klanten_pkey; Type: CONSTRAINT; Schema: ruimtereizen; Owner: -
--

ALTER TABLE ONLY ruimtereizen.klanten
    ADD CONSTRAINT klanten_pkey PRIMARY KEY (klantnr);


--
-- TOC entry 3716 (class 2606 OID 18752)
-- Name: reizen reizen_pkey; Type: CONSTRAINT; Schema: ruimtereizen; Owner: -
--

ALTER TABLE ONLY ruimtereizen.reizen
    ADD CONSTRAINT reizen_pkey PRIMARY KEY (reisnr);


--
-- TOC entry 3717 (class 2606 OID 18812)
-- Name: bezoeken bezoeken_objectnaam_fkey; Type: FK CONSTRAINT; Schema: ruimtereizen; Owner: -
--

ALTER TABLE ONLY ruimtereizen.bezoeken
    ADD CONSTRAINT bezoeken_objectnaam_fkey FOREIGN KEY (objectnaam) REFERENCES ruimtereizen.hemelobjecten(objectnaam);


--
-- TOC entry 3718 (class 2606 OID 18817)
-- Name: bezoeken bezoeken_reisnr_fkey; Type: FK CONSTRAINT; Schema: ruimtereizen; Owner: -
--

ALTER TABLE ONLY ruimtereizen.bezoeken
    ADD CONSTRAINT bezoeken_reisnr_fkey FOREIGN KEY (reisnr) REFERENCES ruimtereizen.reizen(reisnr);


--
-- TOC entry 3719 (class 2606 OID 18822)
-- Name: deelnames deelnames_klantnr_fkey; Type: FK CONSTRAINT; Schema: ruimtereizen; Owner: -
--

ALTER TABLE ONLY ruimtereizen.deelnames
    ADD CONSTRAINT deelnames_klantnr_fkey FOREIGN KEY (klantnr) REFERENCES ruimtereizen.klanten(klantnr);


--
-- TOC entry 3720 (class 2606 OID 18827)
-- Name: deelnames deelnames_reisnr_fkey; Type: FK CONSTRAINT; Schema: ruimtereizen; Owner: -
--

ALTER TABLE ONLY ruimtereizen.deelnames
    ADD CONSTRAINT deelnames_reisnr_fkey FOREIGN KEY (reisnr) REFERENCES ruimtereizen.reizen(reisnr);


--
-- TOC entry 3721 (class 2606 OID 18832)
-- Name: hemelobjecten hemelobjecten_satellietvan_fkey; Type: FK CONSTRAINT; Schema: ruimtereizen; Owner: -
--

ALTER TABLE ONLY ruimtereizen.hemelobjecten
    ADD CONSTRAINT hemelobjecten_satellietvan_fkey FOREIGN KEY (satellietvan) REFERENCES ruimtereizen.hemelobjecten(objectnaam);


-- Completed on 2024-02-27 08:50:49

--
-- PostgreSQL database dump complete
--

