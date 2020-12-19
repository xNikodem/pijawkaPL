-- DROP SCHEMA IF EXISTS pijawka_pl
CREATE SCHEMA IF NOT EXISTS pijawka_pl;

SET SQL_MODE='ALLOW_INVALID_DATES';

-- DROP TABLE IF EXISTS pijawka_pl.konto
CREATE TABLE IF NOT EXISTS pijawka_pl.konto
(
    id   SERIAL PRIMARY KEY,
    id_grupy BIGINT UNSIGNED UNIQUE, 
    login text(32) NOT NULL, 
    haslo text NOT NULL, 
    data_utworzenia timestamp NOT NULL,


FOREIGN KEY (id_grupy) REFERENCES pijawka_pl.grupa (id), 
);

-- DROP TABLE IF EXISTS pijawka_pl.grupa
CREATE TABLE IF NOT EXISTS pijawka_pl. grupa
(
    id   SERIAL PRIMARY KEY,
    nazwa_grupy text(64) UNIQUE
);

-- DROP TABLE IF EXISTS pijawka_pl.permisja
CREATE TABLE IF NOT EXISTS pijawka_pl.permisja
(
    id   SERIAL PRIMARY KEY,
    nazwa_grupy text(64) UNIQUE
);

-- DROP TABLE IF EXISTS pijawka_pl.permisja_grupy
CREATE TABLE IF NOT EXISTS pijawka_pl.permisja_grupy
(
    id_grupy      BIGINT UNSIGNED NOT NULL,
    id_permisji BIGINT UNSIGNED NOT NULL,


    FOREIGN KEY (id_grupy) REFERENCES pijawka_pl.grupa (id),
    FOREIGN KEY (id_permisji) REFERENCES pijawka_pl.permisja (id),
    PRIMARY KEY (id_grupy, id_permisji)
);


-- DROP TABLE IF EXISTS pijawka_pl.Dane_uzytkownika
CREATE TABLE IF NOT EXISTS pijawka_pl.Dane_uzytkownika
(
    id         SERIAL PRIMARY KEY,
    id_grupy  BIGINT UNSIGNED NOT NULL,
    Imie  text     NOT NULL UNIQUE,
Nazwisko text       NOT NULL UNIQUE,
    email   text            NOT NULL,
     nr_telefonu    int          NOT NULL,
    id_konta BIGINT UNSIGNED     NOT NULL,
    id_adresu BIGINT UNSIGNED       NOT NULL,

    FOREIGN KEY (id_grupy) REFERENCES pijawka_pl.grupa(id)
);

-- DROP TABLE IF EXISTS pijawka_pl.Adres_uzytkownika
CREATE TABLE IF NOT EXISTS pijawka_pl.Adres_uzytkownika
(
    id_adresu      SERIAL PRIMARY KEY,
    miasto text NOT NULL,
    ulica text  NOT NULL,
    nr_mieszkania int    NOT NULL,
    nr_klatki int       NOT NULL,
    kod_pocztowy int       NOT NULL,
    
);

-- DROP TABLE IF EXISTS 
pijawka_pl.Towar
CREATE TABLE IF NOT EXISTS pijawka_pl.Towar
(
    id_towaru     SERIAL PRIMARY KEY,
    Cena_towaru float NOT NULL,
    Nazwa_towaru text      NOT NULL,
    Kategoria_towaru   TEXT            NOT NULL,
Pojemnosc   float           NOT NULL,
Woltaz   float          NOT NULL,

);

-- DROP TABLE IF EXISTS pijawka_pl.Ogloszenie
CREATE TABLE IF NOT EXISTS pijawka_pl.Ogloszenie
(
    id_ogloszenia        SERIAL PRIMARY KEY,
    id_konta   BIGINT UNSIGNED NOT NULL,
    id_towaru BIGINT UNSIGNED    NOT NULL,
Nazwa_ogloszenia text   NOT NULL,


FOREIGN KEY (id_konta) REFERENCES pijawka_pl.Dane_uzytkownika(id)
FOREIGN KEY (id_towaru) REFERENCES pijawka_pl.Towar(id)
);

-- DROP TABLE IF EXISTS pijawka_pl.koszyk
CREATE TABLE IF NOT EXISTS pijawka_pl.koszyk
(
   id_koszyka     SERIAL PRIMARY KEY,
    id_konta   BIGINT UNSIGNED NOT NULL,
    id_towaru BIGINT UNSIGNED    NOT NULL,
    ilosc_towaru int   NOT NULL,

FOREIGN KEY (id_konta) REFERENCES pijawka_pl.Dane_uzytkownika(id)
FOREIGN KEY (id_towaru) REFERENCES pijawka_pl.Towar(id)
);

-- DROP TABLE IF EXISTS pijawka_pl.Zamowienie
CREATE TABLE IF NOT EXISTS pijawka_pl.Zamowienie
(
    id_zamowienia      SERIAL PRIMARY KEY,
    id_konta   BIGINT UNSIGNED NOT NULL,
    id_koszyka BIGINT UNSIGNED    NOT NULL,
    ilosc_towaru int   NOT NULL,

FOREIGN KEY (id_konta) REFERENCES pijawka_pl.Dane_uzytkownika(id)
FOREIGN KEY (id_koszyka) REFERENCES pijawka_pl.Koszyk(id)
);

-- DROP TABLE IF EXISTS pijawka_pl.Ocena
CREATE TABLE IF NOT EXISTS pijawka_pl.Ocena
(
    id_oceny      SERIAL PRIMARY KEY,
    id_zamowienia  BIGINT UNSIGNED NOT NULL,
    id_ogloszenia BIGINT UNSIGNED    NOT NULL,
    id_konta BIGINT UNSIGNED   NOT NULL,
ocena int   NOT NULL,
komentarz text NOT NULL, 

    FOREIGN KEY (id_ogloszenia) REFERENCES pijawka_pl.Ogloszenie(id)
FOREIGN KEY (id_konta) REFERENCES pijawka_pl.Dane_uzytkownika(id)
FOREIGN KEY (id_zamowienia) REFERENCES pijawka_pl.Zamowienie(id)
);