-- TESTOWANIE WIDOKÓW --

SELECT * FROM studenci_dane;
SELECT * FROM rodzina_na_uczelni;
SELECT * FROM studenci_z_danego_miasta;
SELECT * FROM prace_dyplomowe_widok;
SELECT * FROM najliczniejszy_akademik;
SELECT * FROM prymusi;

-- PRZYK£ADOWE SELECTY --

------------ Studenci, którzy studiuj¹… powy¿ej 7 semestru ------------
SELECT IMIE,NAZWISKO FROM STUDENCI WHERE SEMESTR > 7;
------------ Pracownicy, którzy s¹… Adiunktami ------------
SELECT IMIE,NAZWISKO FROM PRACOWNICY p WHERE ID_STANOWISKA = 7;
------------ Iloœæ zaliczeñ w terminie 0 ------------
SELECT COUNT(OCENA) AS ilosc_zaliczen FROM OCENY  WHERE TERMIN = 0 AND OCENA > 2;

-- WYWO£ANIE KURSORÓW --

CALL studenci_warunek();
CALL dodatek_wiekowy();
CALL absolwenci();
CALL srednia_pensja_brutto();

-- WYWO£YWANIE WYZWALACZY --

-- OCENY_LOG_TRIGGER
--wywo³anie przy dodwaniu--
INSERT INTO OCENY VALUES (100, 4, TO_DATE('2020/12/20', 'yyyy/mm/dd'), 2, 30, 25);
--wywo³anie przy edycji
UPDATE OCENY SET OCENA = 2 WHERE Id_oceny = 100;
--wywo³anie przy usuwaniu
DELETE FROM OCENY WHERE OCENY.Id_oceny = 100;

-- komunikat_student_trigger
--wywo³anie przy dodawaniu--
INSERT INTO STUDENCI VALUES (66, 'Sebastian', 'Bryk', '89031732731', 5, 25, 30);
--wywo³anie przy usuwaniu--
DELETE FROM STUDENCI WHERE STUDENCI.ID_STUDENTA = 66;

--komunikat_pracownik_trigger
--wywo³anie przy dodawaniu--
INSERT INTO PRACOWNICY VALUES (100, 'Anna', 'Nowotnik', '75051398221', 2900, 14, 15);
--wywo³anie przy usuwaniu--
DELETE FROM PRACOWNICY WHERE PRACOWNICY.ID_PRACOWNIKA = 100;

--komunikat_pokoje_trigger

INSERT INTO AKADEMIKI VALUES (20, 'Mimoza', 12, 20);
