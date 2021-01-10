-------------------Usuniecie istniej¹cych danych----------

DELETE FROM PRACE_DYPLOMOWE;
DELETE FROM OCENY;
DELETE FROM AKADEMIKI;
DELETE FROM STUDENCI;
DELETE FROM PRZEDMIOTY;
DELETE FROM PRACOWNICY;
DELETE FROM STANOWISKA;
DELETE FROM KIERUNKI;
DELETE FROM WYDZIALY;
DELETE FROM ADRESY;

-------------------------Dodawanie danych do tabel ----------------

--------------Wydzia³y-----------------

INSERT INTO WYDZIALY VALUES (1, 'Wydzia³ Nauk Przyrodniczych');
INSERT INTO WYDZIALY VALUES (2, 'Wydzia³ Elektrotechniki, automatyki i informatyki');
INSERT INTO WYDZIALY VALUES (3, 'Wydzia³ Budownictwa i Architektury');
INSERT INTO WYDZIALY VALUES (4, 'Wydzia³ Sztuki');
INSERT INTO WYDZIALY VALUES (5, 'Wydzia³ Pedagogiki i Psychologii');
INSERT INTO WYDZIALY VALUES (6, 'Wydzia³ Humanistyczny');
INSERT INTO WYDZIALY VALUES (7, 'Wydzia³ Prawa i Nauk Spo³ecznych');
INSERT INTO WYDZIALY VALUES (8, 'Wydzia³ Nauk Œcis³ych');
INSERT INTO WYDZIALY VALUES (9, 'Wydzia³ Ochrony Œrodowiska');
INSERT INTO WYDZIALY VALUES (10, 'Wydzia³ Górnictwa i Geoin¿ynierii');
INSERT INTO WYDZIALY VALUES (11, 'Wydzia³ In¿ynierii Metali');
INSERT INTO WYDZIALY VALUES (12, 'Wydzia³ Metali Nie¿elaznych');
INSERT INTO WYDZIALY VALUES (13, 'Wydzia³ Odlewnictwa');
INSERT INTO WYDZIALY VALUES (14, 'Wydzia³ Zarz¹dzania');
INSERT INTO WYDZIALY VALUES (15, 'Wydzia³ Energetyki i Paliw');

---------------Stanowiska--------

INSERT INTO STANOWISKA VALUES (1, 'Rektor');
INSERT INTO STANOWISKA VALUES (2, 'Prorektor');
INSERT INTO STANOWISKA VALUES (3, 'Dziekan');
INSERT INTO STANOWISKA VALUES (4, 'Prodziekan');
INSERT INTO STANOWISKA VALUES (5, 'Kanclerz');
INSERT INTO STANOWISKA VALUES (6, 'Profesor zwyczajny');
INSERT INTO STANOWISKA VALUES (7, 'Adiunkt');
INSERT INTO STANOWISKA VALUES (8, 'Asystent');
INSERT INTO STANOWISKA VALUES (9, 'Profesor wyj¹tkowy');
INSERT INTO STANOWISKA VALUES (10, 'Kierownik');
INSERT INTO STANOWISKA VALUES (11, 'Dyrektor');
INSERT INTO STANOWISKA VALUES (12, 'Profesor wizytuj¹cy');
INSERT INTO STANOWISKA VALUES (13, 'Pracownik dziekanatu');
INSERT INTO STANOWISKA VALUES (14, 'Obs³uga techniczna');
INSERT INTO STANOWISKA VALUES (15, 'Bibliotekarz');

---------------Kierunki--------

INSERT INTO KIERUNKI VALUES (1, 'Behawiorystyka zwierz¹t', 1);
INSERT INTO KIERUNKI VALUES (2, 'Chemia kosmetyczna', 1);
INSERT INTO KIERUNKI VALUES (3, 'Informatyka', 2);
INSERT INTO KIERUNKI VALUES (4, 'Automatyka', 2);
INSERT INTO KIERUNKI VALUES (5, 'Budownictwo', 3);
INSERT INTO KIERUNKI VALUES (6, 'Architektura nowoczesna', 3);
INSERT INTO KIERUNKI VALUES (7, 'Malarstwo', 4);
INSERT INTO KIERUNKI VALUES (8, 'Grafika komputerowa', 4);
INSERT INTO KIERUNKI VALUES (9, 'Psychologia', 5);
INSERT INTO KIERUNKI VALUES (10, 'Pedagogika', 5);
INSERT INTO KIERUNKI VALUES (11, 'Dziennikarstwo', 6);
INSERT INTO KIERUNKI VALUES (12, 'Filologia Angielska', 6);
INSERT INTO KIERUNKI VALUES (13, 'Administracja', 7);
INSERT INTO KIERUNKI VALUES (14, 'Prawo', 7);
INSERT INTO KIERUNKI VALUES (15, 'Biofizyka', 8);
INSERT INTO KIERUNKI VALUES (16, 'Matematyka', 8);
INSERT INTO KIERUNKI VALUES (17, 'Leœnictwo', 9);
INSERT INTO KIERUNKI VALUES (18, 'Ochrona mikroorganizmów', 9);
INSERT INTO KIERUNKI VALUES (19, 'Geomechanika', 10);
INSERT INTO KIERUNKI VALUES (20, 'Geologia', 10);
INSERT INTO KIERUNKI VALUES (21, 'Metalurgia', 11);
INSERT INTO KIERUNKI VALUES (22, 'In¿ynieria materia³owa', 11);
INSERT INTO KIERUNKI VALUES (23, 'In¿ynieria metali nie¿elaznych', 12);
INSERT INTO KIERUNKI VALUES (24, 'In¿ynieria produkcji i jakoœci', 12);
INSERT INTO KIERUNKI VALUES (25, 'In¿ynieria procesów odlewniczych', 13);
INSERT INTO KIERUNKI VALUES (26, 'Tworzywa i technologie motoryzacyjne', 13);
INSERT INTO KIERUNKI VALUES (27, 'Zarz¹dzanie', 14);
INSERT INTO KIERUNKI VALUES (28, 'Marketing', 14);
INSERT INTO KIERUNKI VALUES (29, 'Paliwa odnawialne', 15);
INSERT INTO KIERUNKI VALUES (30, 'Energetyka solarna', 15);

--------------------Adresy-------------

INSERT INTO ADRESY VALUES (1, 'Kraków', 'Marsza³kowska', '11');
INSERT INTO ADRESY VALUES (2, 'Kraków', 'Polna', '2');
INSERT INTO ADRESY VALUES (3, 'Kraków', 'Genera³a Kiwerskiego', '25/13');
INSERT INTO ADRESY VALUES (4, 'Kielce', 'Marii Konopnickiej', '10');
INSERT INTO ADRESY VALUES (5, 'Kielce', 'Solna', '22');
INSERT INTO ADRESY VALUES (6, 'Gdañsk', 'Portowa', '39');
INSERT INTO ADRESY VALUES (7, 'Gdañsk', 'Zewnêtrzna', '80');
INSERT INTO ADRESY VALUES (8, 'Piotrków', 'Rajska', '15/5');
INSERT INTO ADRESY VALUES (9, 'Œwinoujœcie', 'Potokowa', '2/20');
INSERT INTO ADRESY VALUES (10, 'Œwinoujœcie', 'Braterska', '1/2');
INSERT INTO ADRESY VALUES (11, 'Warszawa', 'Widmowa', '3/30');
INSERT INTO ADRESY VALUES (12, 'Warszawa', 'Œwiêtokrzyska', '52');
INSERT INTO ADRESY VALUES (13, 'Poznañ', 'Kawalerów', '12');
INSERT INTO ADRESY VALUES (14, 'Wroc³aw', 'Pionierów Polskich', '133');
INSERT INTO ADRESY VALUES (15, 'Augustów', 'Zdrojowa', '92');
INSERT INTO ADRESY VALUES (16, 'Augustów', 'Upustowa', '32');
INSERT INTO ADRESY VALUES (17, 'Kapeluchów', 'Zwodnicza', '13/3');
INSERT INTO ADRESY VALUES (18, 'Bielsko-Bia³a', '3 Maja', '55/16');
INSERT INTO ADRESY VALUES (19, 'Busko-Zdrój', 'Ja³owa', '25');
INSERT INTO ADRESY VALUES (20, 'Andrychów', 'G³ówna', '19');
INSERT INTO ADRESY VALUES (21, 'Lublin', 'Matelska', '12');
INSERT INTO ADRESY VALUES (22, 'Lublin', 'Pochodna', '72/2');
INSERT INTO ADRESY VALUES (23, 'Czêstochowa', 'Modlitewna', '18');
INSERT INTO ADRESY VALUES (24, 'Czêstochowa', 'Piwna', '1');
INSERT INTO ADRESY VALUES (25, 'Gdynia', 'Czysta', '9/5');

-----------------Pracownicy--------------

INSERT INTO PRACOWNICY VALUES (1, 'Rados³aw', 'Pa³ka', '65101569411', 8000, 5, 1);
INSERT INTO PRACOWNICY VALUES (2, 'Dawid', 'Piotrkowski', '77051166515', 6500, 3, 2);
INSERT INTO PRACOWNICY VALUES (3, 'Barbara', 'Polecka', '70070133922', 6000, 1, 3);
INSERT INTO PRACOWNICY VALUES (4, 'Andrzej', 'Polecki', '72020257635', 4500, 1, 6);
INSERT INTO PRACOWNICY VALUES (5, 'Robert', 'W³odzik', '80053068511', 3900, 2, 7);
INSERT INTO PRACOWNICY VALUES (6, 'Danuta', 'Ziêba', '85010155542', 3700, 4, 7);
INSERT INTO PRACOWNICY VALUES (7, 'W³odzimierz', 'Janowicz', '79090959811', 5800, 6, 6);
INSERT INTO PRACOWNICY VALUES (8, 'Dariusz', 'Misiecki', '76081612359', 5500, 7, 5);
INSERT INTO PRACOWNICY VALUES (9, 'Adam', 'Pompowicz', '82112865712', 5600, 8, 4);
INSERT INTO PRACOWNICY VALUES (10, 'Nadia', 'Anio³-Misiecka', '76031368522', 3800, 7, 8);
INSERT INTO PRACOWNICY VALUES (11, 'Bartosz', 'Walaszek', '85032156711', 3500, 9, 9);
INSERT INTO PRACOWNICY VALUES (12, 'Bart³omiej', 'GnieŸdzicki', '59070345313', 6100, 10, 10);
INSERT INTO PRACOWNICY VALUES (13, 'Adrian', 'Paluszek', '87022945677', 3300, 11, 11);
INSERT INTO PRACOWNICY VALUES (14, 'Joanna', 'NiedŸwiedzka-Mleczak', '69122458621', 4650, 12, 13);
INSERT INTO PRACOWNICY VALUES (15, 'Artur', 'Wiœniewski', '79041800132', 4900, 13, 12);
INSERT INTO PRACOWNICY VALUES (16, 'Damian', 'Sienkiewicz', '90080768795', 3600, 15, 14);
INSERT INTO PRACOWNICY VALUES (17, 'Anna', 'Nowotnik', '75051598221', 2900, 14, 15);

-----------------Przedmioty---------------

INSERT INTO PRZEDMIOTY VALUES (1, 'Typowe zachowania psów', 3, 30, 1, 4);
INSERT INTO PRZEDMIOTY VALUES (2, 'Kosmetyki zapachowe', 5, 45, 2, 3);
INSERT INTO PRZEDMIOTY VALUES (3, 'Wstêp do informatyki', 4, 60, 3, 5);
INSERT INTO PRZEDMIOTY VALUES (4, 'Maszyny ruchome', 3, 30, 4, 7);
INSERT INTO PRZEDMIOTY VALUES (5, 'Odpornoœæ materia³owa', 6, 60, 5, 6);
INSERT INTO PRZEDMIOTY VALUES (6, 'Architektura niskopowierzchniowa', 5, 45, 6, 3);
INSERT INTO PRZEDMIOTY VALUES (7, 'Historia sztuki', 2, 15, 7, 2);
INSERT INTO PRZEDMIOTY VALUES (8, 'Projektowanie komercyjne', 5, 60, 8, 5);
INSERT INTO PRZEDMIOTY VALUES (9, 'Choroby genetyczne', 6, 120, 9, 7);
INSERT INTO PRZEDMIOTY VALUES (10, 'Opieka wczesnodzieciêca', 4, 60, 10, 6);
INSERT INTO PRZEDMIOTY VALUES (11, 'Formaty artyku³ów', 3, 30, 11, 2);
INSERT INTO PRZEDMIOTY VALUES (12, 'Etymologia', 4, 60, 12, 1);
INSERT INTO PRZEDMIOTY VALUES (13, 'Struktury administracyjne', 4, 60, 13, 2);
INSERT INTO PRZEDMIOTY VALUES (14, 'Kodeks drogowy', 6, 120, 14, 7);
INSERT INTO PRZEDMIOTY VALUES (15, 'Mikroorganizmy 1', 5, 75, 15, 7);
INSERT INTO PRZEDMIOTY VALUES (16, 'Pochodne i ich zastosowanie', 5, 60, 16, 6);
INSERT INTO PRZEDMIOTY VALUES (17, 'Drzewa liœciaste', 3, 30, 17, 8);
INSERT INTO PRZEDMIOTY VALUES (18, 'Mikroorganizmy wodne', 4, 60, 18, 9);
INSERT INTO PRZEDMIOTY VALUES (19, 'Maszyny wielkopowierzchniowe', 8, 160, 19, 10);
INSERT INTO PRZEDMIOTY VALUES (20, 'Miernictwo zasobów 1', 4, 60, 20, 11);
INSERT INTO PRZEDMIOTY VALUES (21, 'Obróbka termiczna', 3, 60, 21, 12);
INSERT INTO PRZEDMIOTY VALUES (22, 'Obróbka termiczna', 3, 60, 22, 12);
INSERT INTO PRZEDMIOTY VALUES (23, 'Skale jakoœci', 2, 30, 23, 13);
INSERT INTO PRZEDMIOTY VALUES (24, 'Tworzenie procesu produkcji', 4, 60, 24, 13);
INSERT INTO PRZEDMIOTY VALUES (25, 'Odlewnictwo 1', 5, 60, 25, 14);
INSERT INTO PRZEDMIOTY VALUES (26, 'Budowa silników 1', 5, 120, 26, 14);
INSERT INTO PRZEDMIOTY VALUES (27, 'Human Resources', 6, 60, 27, 2);
INSERT INTO PRZEDMIOTY VALUES (28, 'Strategie sprzeda¿owe', 4, 45, 28, 3);
INSERT INTO PRZEDMIOTY VALUES (29, 'Technologie s³oneczne', 5, 60, 29, 7);
INSERT INTO PRZEDMIOTY VALUES (30, 'Tworzenie paneli solarnych', 3, 30, 30, 6);

---------Studenci------------

INSERT INTO STUDENCI VALUES (1, 'Jakub', 'Robak', '99033065412', 2, 3, 1);
INSERT INTO STUDENCI VALUES (2, 'Dawid', 'Piernik', '95061254612', 5, 16, 2);
INSERT INTO STUDENCI VALUES (3, 'Bartosz', 'Artecki', '96012254632', 3, 17, 3);
INSERT INTO STUDENCI VALUES (4, 'Bart³omiej', 'Walaszek', '93120235491', 12, 9, 4);
INSERT INTO STUDENCI VALUES (5, 'Anna', 'Robak', '89062956421', 14, 24, 5);
INSERT INTO STUDENCI VALUES (6, 'Joanna', 'Bartoszak', '99101365421', 8, 23, 6);
INSERT INTO STUDENCI VALUES (7, 'Damian', 'Dobosz', '00251356431', 3, 22, 7);
INSERT INTO STUDENCI VALUES (8, 'Dariusz', 'Krzysztofik', '00312745651', 2, 21, 8);
INSERT INTO STUDENCI VALUES (9, 'Adrian', 'Paszczek', '99121287631', 1, 20, 9);
INSERT INTO STUDENCI VALUES (10, 'Jakub', 'Haszczek', '97090956413', 4, 19, 10);
INSERT INTO STUDENCI VALUES (11, 'Robert', 'Pasut', '94112165463', 6, 18, 11);
INSERT INTO STUDENCI VALUES (12, 'Monika', 'Andrzejewicz', '93121365420', 7, 17, 12);
INSERT INTO STUDENCI VALUES (13, 'Daria', 'B¹czek', '9802265421', 6, 17, 13);
INSERT INTO STUDENCI VALUES (14, 'Wojciech', 'Brzêczyszczykiewicz', '00301964512', 5, 16, 14);
INSERT INTO STUDENCI VALUES (15, 'Maciej', 'Ulotny', '98042531212', 6, 15, 15);
INSERT INTO STUDENCI VALUES (16, 'Dawid', 'Patyczek', '01232349693', 8, 9, 16);
INSERT INTO STUDENCI VALUES (17, 'Amadeusz', 'Mietczyñski', '00271383913', 1,  25, 17);
INSERT INTO STUDENCI VALUES (18, 'Daniel', 'Przyby³', '89101056412', 7, 24, 18);
INSERT INTO STUDENCI VALUES (19, 'Micha³', 'Anio³', '99121201731', 2, 7, 19);
INSERT INTO STUDENCI VALUES (20, 'Aleksander', 'Huk', '96051392612', 3, 20, 20);
INSERT INTO STUDENCI VALUES (21, 'Beata', 'Pe³ka', '99101035420', 5, 19, 21);
INSERT INTO STUDENCI VALUES (22, 'Aleksandra', 'Szczepañska', '97090939741', 4, 17, 22);
INSERT INTO STUDENCI VALUES (23, 'Karolina', 'Pacek', '00241394648', 1, 15, 23);
INSERT INTO STUDENCI VALUES (24, 'Nadia', 'Byczek', '99040410666', 2, 25, 24);
INSERT INTO STUDENCI VALUES (25, 'Mateusz', 'Martyniuk', '95031299912', 3, 22, 25);
INSERT INTO STUDENCI VALUES (26, 'Stefan', 'Bartoszek', '91010110111', 7, 23, 26);
INSERT INTO STUDENCI VALUES (27, 'Maria', 'Chodañ', '94061865881', 4, 2, 27);
INSERT INTO STUDENCI VALUES (28, 'Artur', 'Borek', '94121468533', 9, 20, 28);
INSERT INTO STUDENCI VALUES (29, 'Piotr', 'Borgiasz', '90012969731', 8, 19, 29);
INSERT INTO STUDENCI VALUES (30, 'Sebastian', 'Bryk', '89031710731', 5, 25, 30);

-------------------Akademiki------------------------

INSERT INTO AKADEMIKI VALUES (1, 'Mimoza', 112, 1);
INSERT INTO AKADEMIKI VALUES (2, 'Bartek', 101, 2);
INSERT INTO AKADEMIKI VALUES (3, 'Mimoza', 113, 3);
INSERT INTO AKADEMIKI VALUES (4, 'Bartek', 102, 6);
INSERT INTO AKADEMIKI VALUES (5, 'Mimoza', 114, 7);
INSERT INTO AKADEMIKI VALUES (6, 'Bartek', 103, 8);
INSERT INTO AKADEMIKI VALUES (7, 'Mimoza', 115, 10);
INSERT INTO AKADEMIKI VALUES (8, 'Bartek', 104, 12);
INSERT INTO AKADEMIKI VALUES (9, 'Mimoza', 116, 13);
INSERT INTO AKADEMIKI VALUES (10, 'Bartek', 111, 25);
INSERT INTO AKADEMIKI VALUES (11, 'Mimoza', 201, 19);
INSERT INTO AKADEMIKI VALUES (12, 'Bartek', 112, 29);
INSERT INTO AKADEMIKI VALUES (13, 'Mimoza', 212, 11);
INSERT INTO AKADEMIKI VALUES (14, 'Bartek', 113, 24);
INSERT INTO AKADEMIKI VALUES (15, 'Mimoza', 213, 16);

---------------------Oceny-------------------------

INSERT INTO OCENY VALUES (1, 3, TO_DATE('2003/05/03', 'yyyy/mm/dd'), 1, 1, 1);
INSERT INTO OCENY VALUES (2, 5, TO_DATE('2005/03/13', 'yyyy/mm/dd'), 1, 2, 2);
INSERT INTO OCENY VALUES (3, 4.5, TO_DATE('2007/01/09', 'yyyy/mm/dd'), 3, 3, 3);
INSERT INTO OCENY VALUES (4, 4.5, TO_DATE('2013/05/03', 'yyyy/mm/dd'), 2, 4, 4);
INSERT INTO OCENY VALUES (5, 4, TO_DATE('2019/09/09', 'yyyy/mm/dd'), 2, 5, 5);
INSERT INTO OCENY VALUES (6, 3, TO_DATE('2005/02/23', 'yyyy/mm/dd'), 1, 6, 6);
INSERT INTO OCENY VALUES (7, 3.5, TO_DATE('2020/05/03', 'yyyy/mm/dd'), 3, 7, 7);
INSERT INTO OCENY VALUES (8, 2.5, TO_DATE('2017/12/13', 'yyyy/mm/dd'), 2, 8, 8);
INSERT INTO OCENY VALUES (9, 2, TO_DATE('2012/01/08', 'yyyy/mm/dd'), 2, 9, 9);
INSERT INTO OCENY VALUES (10, 4.5, TO_DATE('2001/04/23', 'yyyy/mm/dd'), 0, 10, 10);
INSERT INTO OCENY VALUES (11, 3, TO_DATE('2002/08/02', 'yyyy/mm/dd'), 0, 11, 11);
INSERT INTO OCENY VALUES (12, 5, TO_DATE('2003/05/03', 'yyyy/mm/dd'), 1, 12, 12);
INSERT INTO OCENY VALUES (13, 5, TO_DATE('2010/02/19', 'yyyy/mm/dd'), 2, 13, 13);
INSERT INTO OCENY VALUES (14, 4, TO_DATE('2011/05/03', 'yyyy/mm/dd'), 3, 14, 14);
INSERT INTO OCENY VALUES (15, 4.5, TO_DATE('2010/05/18', 'yyyy/mm/dd'), 2, 15, 15);
INSERT INTO OCENY VALUES (16, 3, TO_DATE('2011/02/18', 'yyyy/mm/dd'), 2, 16, 16);
INSERT INTO OCENY VALUES (17, 3.5, TO_DATE('2012/01/23', 'yyyy/mm/dd'), 0, 17, 17);
INSERT INTO OCENY VALUES (18, 5, TO_DATE('2015/08/04', 'yyyy/mm/dd'), 3, 18, 18);
INSERT INTO OCENY VALUES (19, 4.5, TO_DATE('2015/10/02', 'yyyy/mm/dd'), 3, 19, 19);
INSERT INTO OCENY VALUES (20, 2, TO_DATE('2016/04/28', 'yyyy/mm/dd'), 2, 20, 20);
INSERT INTO OCENY VALUES (21, 3, TO_DATE('2016/06/13', 'yyyy/mm/dd'), 2, 21, 21);
INSERT INTO OCENY VALUES (22, 5, TO_DATE('2017/01/10', 'yyyy/mm/dd'), 1, 22, 22);
INSERT INTO OCENY VALUES (23, 5, TO_DATE('2003/05/03', 'yyyy/mm/dd'), 1, 23, 23);
INSERT INTO OCENY VALUES (24, 5, TO_DATE('2018/02/26', 'yyyy/mm/dd'), 2, 24, 24);
INSERT INTO OCENY VALUES (25, 3.5, TO_DATE('2002/10/24', 'yyyy/mm/dd'), 1, 25, 25);
INSERT INTO OCENY VALUES (26, 4.5, TO_DATE('2019/10/16', 'yyyy/mm/dd'), 3, 26, 26);
INSERT INTO OCENY VALUES (27, 4, TO_DATE('2002/10/24', 'yyyy/mm/dd'), 0, 27, 27);
INSERT INTO OCENY VALUES (28, 4, TO_DATE('2000/08/11', 'yyyy/mm/dd'), 1, 28, 28);
INSERT INTO OCENY VALUES (29, 4, TO_DATE('2007/03/18', 'yyyy/mm/dd'), 1, 29, 29);
INSERT INTO OCENY VALUES (30, 2, TO_DATE('2008/12/20', 'yyyy/mm/dd'), 2, 30, 30);

---------------Prace Dyplomowe---------------

INSERT INTO PRACE_DYPLOMOWE VALUES (1, 'Algorytm eliminacji zak³óceñ impulsowych', 4.5, TO_DATE('2003/05/03', 'yyyy/mm/dd'), 4, 2);
INSERT INTO PRACE_DYPLOMOWE VALUES (2, 'Projekt i budowa robota sprz¹taj¹cego', 5, TO_DATE('2006/02/20', 'yyyy/mm/dd'), 4, 6);
INSERT INTO PRACE_DYPLOMOWE VALUES (3, 'Projekt budynku u¿ytecznoœci publicznej', 4, TO_DATE('2010/07/25', 'yyyy/mm/dd'), 5, 3);
INSERT INTO PRACE_DYPLOMOWE VALUES (4, 'Projekt domu dla 100 osób z zapleczem socjalnym', 5, TO_DATE('2012/02/15', 'yyyy/mm/dd'), 5, 5);
INSERT INTO PRACE_DYPLOMOWE VALUES (5, 'Projekt dachu kopertowego z wykorzystaniem BIM', 4.5, TO_DATE('2015/09/05', 'yyyy/mm/dd'), 5, 3);
INSERT INTO PRACE_DYPLOMOWE VALUES (6, 'Projekt biura odpornego na wstrz¹sy', 4, TO_DATE('2017/04/03', 'yyyy/mm/dd'), 6, 1);
INSERT INTO PRACE_DYPLOMOWE VALUES (7, 'Wp³yw internetu na dziennikarstwo tradycyjne', 5, TO_DATE('2020/01/30', 'yyyy/mm/dd'), 11, 7);
INSERT INTO PRACE_DYPLOMOWE VALUES (8, 'Wp³yw slangu na rozwój s³ownictwa', 3, TO_DATE('2019/08/15', 'yyyy/mm/dd'), 12, 9);
INSERT INTO PRACE_DYPLOMOWE VALUES (9, 'Ergonomia pracy biurowej', 5, TO_DATE('2018/08/19', 'yyyy/mm/dd'), 15, 10);
INSERT INTO PRACE_DYPLOMOWE VALUES (10, 'Bialgebry i grupy kwantowe', 4, TO_DATE('2017/02/27', 'yyyy/mm/dd'), 16, 4);
INSERT INTO PRACE_DYPLOMOWE VALUES (11, 'Zaawansowane systemy ostrzegania kierowcy', 5, TO_DATE('2016/02/01', 'yyyy/mm/dd'), 25, 11);
INSERT INTO PRACE_DYPLOMOWE VALUES (12, 'Op³acalny marketing na przyk³adzie amerykañskich gigantów', 5, TO_DATE('2017/03/12', 'yyyy/mm/dd'), 28, 8);
INSERT INTO PRACE_DYPLOMOWE VALUES (13, 'Przysz³oœæ elektrowni wiatrowych', 5, TO_DATE('2019/09/19', 'yyyy/mm/dd'), 29, 7);
INSERT INTO PRACE_DYPLOMOWE VALUES (14, 'Intensywny po³ów a zanik morskich gatunków zwierz¹t', 3, TO_DATE('2015/04/16', 'yyyy/mm/dd'), 18, 8);
INSERT INTO PRACE_DYPLOMOWE VALUES (15, 'Internetyzacja administracji', 4, TO_DATE('2018/05/26', 'yyyy/mm/dd'), 13, 5);