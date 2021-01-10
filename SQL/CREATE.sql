-------------------------Dodanie tabel-----------------------

-----------Wydzia�y-----------

CREATE TABLE Wydzialy (
Id_wydzialu NUMBER CONSTRAINT wydzial_pk PRIMARY KEY,
Nazwa VARCHAR2(50) NOT NULL
);

-----------Kierunki-----------

CREATE TABLE Kierunki (
Id_kierunku NUMBER CONSTRAINT kierunek_pk PRIMARY KEY,
Nazwa VARCHAR2(40) NOT NULL,
Id_wydzialu NUMBER NOT NULL,
CONSTRAINT kier_wydzial_fk FOREIGN KEY (Id_wydzialu) REFERENCES Wydzialy(Id_wydzialu)
);

-----------Stanowiska-----------

CREATE TABLE Stanowiska (
Id_stanowiska NUMBER CONSTRAINT stanowisko_pk PRIMARY KEY,
Nazwa VARCHAR2(20) NOT NULL
);

-----------Adresy-----------

CREATE TABLE Adresy (
Id_adresu NUMBER CONSTRAINT adres_pk PRIMARY KEY,
Miasto VARCHAR2(20) NOT NULL,
Ulica VARCHAR2(30) NOT NULL,
Nr VARCHAR2(10) NOT NULL
);

-----------Pracownicy-----------

CREATE TABLE Pracownicy (
Id_pracownika NUMBER CONSTRAINT pracownik_pk PRIMARY KEY,
Imie VARCHAR2(15) NOT NULL,
Nazwisko VARCHAR2(25) NOT NULL,
Pesel CHAR(11) NOT NULL CONSTRAINT pracownik_pesel UNIQUE,
Pensja_brutto NUMBER NOT NULL CONSTRAINT pensja_pracownik CHECK(Pensja_brutto >=2800),
Id_adresu NUMBER NOT NULL,
Id_stanowiska NUMBER NOT NULL,
CONSTRAINT prac_adres_fk FOREIGN KEY (Id_adresu) REFERENCES Adresy(Id_adresu),
CONSTRAINT prac_stan_fk FOREIGN KEY (Id_stanowiska) REFERENCES Stanowiska(Id_stanowiska)
);

-----------Przedmioty-----------

CREATE TABLE Przedmioty (
Id_przedmiotu NUMBER CONSTRAINT przedmiot_pk PRIMARY KEY,
Nazwa VARCHAR2(32) NOT NULL,
Ects NUMBER NOT NULL CONSTRAINT ch_ects CHECK((Ects>=0)AND(Ects<=15)),
Ilosc_godzin NUMBER,
Id_kierunku NUMBER NOT NULL,
id_pracownika NUMBER NOT NULL,
CONSTRAINT przed_kier_fk FOREIGN KEY (Id_kierunku) REFERENCES Kierunki(Id_kierunku),
CONSTRAINT przed_prac_fk FOREIGN KEY (Id_pracownika) REFERENCES Pracownicy(Id_pracownika)
);

-----------Studenci-----------

CREATE TABLE Studenci (
Id_studenta NUMBER CONSTRAINT student_pk PRIMARY KEY,
Imie VARCHAR2(15) NOT NULL,
Nazwisko VARCHAR2(25) NOT NULL,
Pesel CHAR(11) NOT NULL CONSTRAINT student_pesel UNIQUE,
Semestr NUMBER CONSTRAINT semestr CHECK(Semestr>=1),
Id_adresu NUMBER NOT NULL,
Id_kierunku NUMBER NOT NULL,
CONSTRAINT stud_adres_fk FOREIGN KEY (Id_adresu) REFERENCES Adresy(Id_adresu),
CONSTRAINT stud_kier_fk FOREIGN KEY (Id_kierunku) REFERENCES Kierunki(Id_kierunku)
);

-----------Prace dyplomowe-----------

CREATE TABLE Prace_dyplomowe (
Id_pracy NUMBER CONSTRAINT praca_dyp_pk PRIMARY KEY,
Temat VARCHAR2(70) NOT NULL,
Ocena NUMBER NOT NULL CONSTRAINT praca_ocena CHECK((Ocena>=0) AND (Ocena <=5)),
Data_oddania DATE NOT NULL,
Id_studenta NUMBER NOT NULL,
Id_promotora NUMBER NOT NULL,
CONSTRAINT pd_student_fk FOREIGN KEY (Id_studenta) REFERENCES Studenci(Id_studenta),
CONSTRAINT pd_promotor_fk FOREIGN KEY (Id_promotora) REFERENCES Pracownicy(Id_pracownika)
);

-----------Oceny-----------

CREATE TABLE Oceny (
Id_oceny NUMBER CONSTRAINT ocena_pk PRIMARY KEY,
Ocena NUMBER NOT NULL CONSTRAINT ocena_check CHECK((Ocena>=2) AND (Ocena <=5)),
Data_uzyskania DATE NOT NULL,
Termin NUMBER NOT NULL CONSTRAINT termin_oceny_check CHECK ((Termin>=0) AND (Termin <4)),
Id_przedmiotu NUMBER NOT NULL,
Id_studenta NUMBER NOT NULL,
CONSTRAINT ocena_przedmiot_fk FOREIGN KEY (Id_przedmiotu) REFERENCES Przedmioty(Id_przedmiotu),
CONSTRAINT ocena_student_fk FOREIGN KEY (Id_studenta) REFERENCES Studenci(Id_studenta)
);

-----------Akademiki-----------

CREATE TABLE Akademiki (
Id_pokoju NUMBER CONSTRAINT akademik_pk PRIMARY KEY,
Nazwa_akademika VARCHAR2(20) NOT NULL,
Nr_pokoju NUMBER NOT NULL CONSTRAINT nr_pokoju_check CHECK(Nr_pokoju >0),
Id_studenta NUMBER NOT NULL CONSTRAINT student_pokoj UNIQUE,
CONSTRAINT akad_stud_fk FOREIGN KEY (Id_studenta) REFERENCES Studenci(Id_studenta)
);

---------Logi-----------

CREATE TABLE OCENY_LOG (
  id_operacji NUMBER CONSTRAINT oc_log_pk PRIMARY KEY,
  operacja VARCHAR2(20),
  id_oceny NUMBER,
  data_operacji DATE);
