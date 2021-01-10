------------------ Kursory -----------------------------

---------------Kursor nr1 - studenci na poœcigu---------

CREATE OR REPLACE PROCEDURE studenci_warunek
IS CURSOR studenci_warunek_cursor IS
	SELECT s.IMIE, s.NAZWISKO, s.PESEL, p.NAZWA, o.OCENA
	FROM STUDENCI s, OCENY o, PRZEDMIOTY p
	WHERE o.ID_STUDENTA = s.ID_STUDENTA
	AND o.OCENA < 3
	AND p.ID_PRZEDMIOTU = o.ID_PRZEDMIOTU;
imie VARCHAR2(15);
nazwisko VARCHAR2(25);
pesel VARCHAR2(11);
nazwa VARCHAR2(32);
ocena NUMBER(3);
BEGIN
	DBMS_OUTPUT.ENABLE;
OPEN studenci_warunek_cursor;
	DBMS_OUTPUT.PUT_LINE('Imiê | Nazwisko | Pesel | Przedmiot | Ocena');
	LOOP
	FETCH studenci_warunek_cursor INTO imie, nazwisko, pesel, nazwa, ocena;
	EXIT WHEN studenci_warunek_cursor%NOTFOUND;
	DBMS_OUTPUT.PUT_LINE(imie || ' | ' || nazwisko || ' | ' || pesel || ' | ' || nazwa || ' | ' || ocena);
	END LOOP;
CLOSE studenci_warunek_cursor;
END;


---------------Kursor nr2 - podwy¿ka 5% dla pracowników +50 ---------

CREATE OR REPLACE PROCEDURE dodatek_wiekowy IS
CURSOR dodatek_pensja_cursor IS
SELECT ID_PRACOWNIKA, IMIE, NAZWISKO, PENSJA_BRUTTO, SUBSTR(pesel, 1, 2),  SUBSTR(pesel, 3, 2)
FROM PRACOWNICY
FOR UPDATE OF PENSJA_BRUTTO;
id NUMBER;
imie VARCHAR2(15);
nazwisko VARCHAR2(25);
pensja NUMBER;
rok NUMBER;
miesiac NUMBER;
BEGIN
	OPEN dodatek_pensja_cursor;
	LOOP
	FETCH dodatek_pensja_cursor INTO id, imie, nazwisko, pensja, rok, miesiac;
	EXIT WHEN dodatek_pensja_cursor%NOTFOUND;
	IF (miesiac > 12) THEN rok := rok + 2000;
	END IF;
	IF (miesiac <= 12) THEN rok := rok + 1900;
	END IF;
	IF (EXTRACT(YEAR FROM CURRENT_DATE) - rok > 50) THEN
	pensja := pensja * 1.05;
	UPDATE PRACOWNICY
	SET PENSJA_BRUTTO = pensja
	WHERE CURRENT OF dodatek_pensja_cursor;
	DBMS_OUTPUT.PUT_LINE ('Pracownik ' || imie || ' ' || nazwisko || ' otrzyma³ podwy¿kê w wysokoœci 5% pensji.');
	END IF;
	END LOOP;
	CLOSE DODATEK_PENSJA_CURSOR;
END;

---------------Kursor nr3 - absolwenci danych etapów studiów ---------

CREATE OR REPLACE PROCEDURE absolwenci IS
CURSOR absolwenci_etap IS
SELECT s.IMIE, s.NAZWISKO, s.PESEL, k.NAZWA AS Kierunek, count(s.PESEL)
FROM PRACE_DYPLOMOWE pd, STUDENCI s, KIERUNKI k
WHERE
	pd.ID_STUDENTA = s.ID_STUDENTA AND
	k.ID_KIERUNKU = s.ID_KIERUNKU
GROUP BY
s.NAZWISKO, s.PESEL, k.NAZWA, s.IMIE
ORDER BY count(s.PESEL) ASC;
imie VARCHAR2(15);
nazwisko VARCHAR2(25);
pesel VARCHAR2(11);
kierunek VARCHAR2(40);
typ_pracy NUMBER;
BEGIN
	DBMS_OUTPUT.ENABLE;
	OPEN absolwenci_etap;
		DBMS_OUTPUT.PUT_LINE('Licencjat/in¿ynier:' || chr(10));
		DBMS_OUTPUT.PUT_LINE ('Imiê | Nazwisko | pesel | nazwa kierunku' || chr(10));
	LOOP
	FETCH absolwenci_etap INTO imie, nazwisko, pesel, kierunek, typ_pracy;
	EXIT WHEN absolwenci_etap%NOTFOUND;
	IF (typ_pracy = 2) THEN DBMS_OUTPUT.PUT_LINE(chr(10) ||'Magister:' || chr(10));
	DBMS_OUTPUT.PUT_LINE ('Imiê | Nazwisko | pesel | nazwa kierunku' || chr(10));
	END IF;
	IF (typ_pracy = 3) THEN DBMS_OUTPUT.PUT_LINE(chr(10) || 'Doktor:' || chr(10));
	DBMS_OUTPUT.PUT_LINE ('Imiê | Nazwisko | pesel | nazwa kierunku' || chr(10));
	END IF;
	DBMS_OUTPUT.PUT_LINE(imie || ' | ' || nazwisko || ' | ' || pesel || ' | ' || kierunek);
	END LOOP;
END;

---------------Kursor nr4 - œrednia pensja pracowników ---------

CREATE OR REPLACE PROCEDURE srednia_pensja_brutto IS
CURSOR srednia_pensja_cursor IS
SELECT p.PENSJA_BRUTTO
FROM PRACOWNICY p;
pensja NUMBER;
suma NUMBER(12, 2) := 0;
ilosc NUMBER := 0;
BEGIN
	DBMS_OUTPUT.ENABLE;
	OPEN srednia_pensja_cursor;
	LOOP
	FETCH srednia_pensja_cursor INTO pensja;
	EXIT WHEN SREDNIA_PENSJA_CURSOR%NOTFOUND;
	suma := suma + pensja;
	ilosc:= ilosc + 1;
	END LOOP;
	suma := suma / ilosc;
	DBMS_OUTPUT.PUT_LINE ('Œrednia zarobków wynosi: ' || suma || ' ilosc : ' || ilosc);
CLOSE srednia_pensja_cursor;
END;
