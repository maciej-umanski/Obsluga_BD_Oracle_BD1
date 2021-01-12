----------------------------
--DANE STUDENTOW--
CREATE OR REPLACE VIEW studenci_dane AS
SELECT s.IMIE, s.NAZWISKO, a.MIASTO, a.ULICA || ' ' || a.NR AS Adres, w.NAZWA AS Wydzial, k.NAZWA AS Kierunek, s.SEMESTR
FROM STUDENCI s, ADRESY a, WYDZIALY w, KIERUNKI k
WHERE
	s.ID_ADRESU = a.ID_ADRESU AND
	s.ID_KIERUNKU = k.ID_KIERUNKU AND
	k.ID_WYDZIALU = w.ID_WYDZIALU;
----------------------------
--STUDENCI Z RODZINA NA UCZELNI--
CREATE OR REPLACE VIEW rodzina_na_uczelni AS
SELECT DISTINCT s.IMIE, s.NAZWISKO, s.ID_ADRESU FROM STUDENCI s, PRACOWNICY p
WHERE
s.ID_ADRESU = p.ID_ADRESU;
----------------------------
--ILOSC STUDENTOW Z DANEGO MIASTA--
CREATE OR REPLACE VIEW studenci_z_danego_miasta AS
SELECT DISTINCT a.MIASTO, count(s.ID_ADRESU) AS ILOSC FROM STUDENCI s, ADRESY a
WHERE s.ID_ADRESU = a.ID_ADRESU
GROUP BY a.MIASTO;
----------------------------
--PRACE U DANEGO PROMOTORA--
CREATE VIEW prace_dyplomowe_widok AS
SELECT s.IMIE || ' ' || s.NAZWISKO AS Student, p.IMIE || ' ' || p.NAZWISKO AS Promotor, pd.TEMAT, pd.OCENA
FROM STUDENCI s, PRACE_DYPLOMOWE pd, PRACOWNICY p
WHERE
  pd.ID_PROMOTORA = p.ID_PRACOWNIKA AND
  pd.ID_STUDENTA = s.ID_STUDENTA;

----------------------------
--NAJLICZNIEJSZY AKADEMIK--
CREATE OR REPLACE VIEW najliczniejszy_akademik AS
SELECT MAX(a.nazwa_akademika) AS NAJLICZNIEJSZY_AKADEMIK
FROM studenci s, akademiki a
WHERE s.id_studenta = a.id_studenta;
----------------------------
--STUDENCI Z OCENAMI 5--
CREATE OR REPLACE VIEW prymusi AS
SELECT s.imie, s.nazwisko, o.ocena, p.nazwa AS NAZWA_PRZEDMIOTU FROM STUDENCI s, OCENY o, PRZEDMIOTY p
WHERE s.ID_STUDENTA = o.ID_STUDENTA AND
o.ID_STUDENTA = p.ID_PRZEDMIOTU AND
o.OCENA = 5;
----------------------------
