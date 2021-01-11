-- TESTOWANIE WIDOKÓW --

SELECT * FROM studenci_dane;
SELECT * FROM rodzina_na_uczelni;
SELECT * FROM studenci_z_danego_miasta;
SELECT * FROM prace_dyplomowe_widok;
SELECT * FROM najliczniejszy_akademik;
SELECT * FROM prymusi;

-- PRZYKŁADOWE SELECTY --

------------ Studenci, którzy studiują powyżej 7 semestru ------------
SELECT IMIE,NAZWISKO FROM STUDENCI WHERE SEMESTR > 7;
------------ Pracownicy, którzy są Adiunktami ------------
SELECT IMIE,NAZWISKO FROM PRACOWNICY p WHERE ID_STANOWISKA = 7;
------------ Ilość zaliczeń w terminie 0 ------------
SELECT COUNT(OCENA) AS ilosc_zaliczen FROM OCENY  WHERE TERMIN = 0 AND OCENA > 2;

-- WYWOŁANIE KURSORÓW --

CALL studenci_warunek();
CALL dodatek_wiekowy();
CALL absolwenci();
CALL srednia_pensja_brutto();

-- WYWOŁYWANIE WYZWALACZY --

-- OCENY_LOG_TRIGGER
--wywołanie przy dodwaniu--
INSERT INTO OCENY VALUES (100, 4, TO_DATE('2020/12/20', 'yyyy/mm/dd'), 2, 30, 25);
--wywołanie przy edycji
UPDATE OCENY SET OCENA = 2 WHERE Id_oceny = 100;
--wywołanie przy usuwaniu
DELETE FROM OCENY WHERE OCENY.Id_oceny = 100;
