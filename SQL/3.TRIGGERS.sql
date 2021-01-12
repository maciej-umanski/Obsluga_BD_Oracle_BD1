--zapisywanie operacji na tabeli oceny do nowej tabeli --
CREATE OR REPLACE TRIGGER oceny_log_trigger
AFTER INSERT OR UPDATE OR DELETE ON OCENY
FOR EACH ROW
DECLARE
	exist NUMBER(6);
	actions VARCHAR2(20);
BEGIN
	SELECT count(*) INTO exist FROM OCENY_LOG;
	actions := CASE
		WHEN UPDATING THEN 'UPDATE'
		WHEN DELETING THEN 'DELETE'
		WHEN INSERTING THEN 'INSERT'
	END;
	exist := exist + 1;
	IF actions = 'DELETE' THEN INSERT INTO OCENY_LOG VALUES (exist, actions, :OLD.Id_oceny, CURRENT_DATE);
	ELSE INSERT INTO OCENY_LOG VALUES (exist, actions, :NEW.Id_oceny, CURRENT_DATE);
	END IF;
END;

-- wypisanie informacji powitalnej po dodaniu nowego studenta oraz po¿egnalnej po usuniêciu--

CREATE OR REPLACE TRIGGER komunikat_student_trigger
AFTER INSERT OR DELETE ON STUDENCI
FOR EACH ROW
BEGIN
	DBMS_OUTPUT.ENABLE;
	CASE
		WHEN DELETING THEN DBMS_OUTPUT.PUT_LINE('¯egnamy studenta ' || :OLD.imie || ' ' || :OLD.nazwisko);
        WHEN INSERTING THEN DBMS_OUTPUT.PUT_LINE('Witamy studenta ' || :NEW.imie || ' ' || :NEW.nazwisko);
	END CASE;
END;

-- wypisanie informacji powitalnej po dodaniu nowego pracownika oraz po¿egnalnej po usuniêciu --

CREATE OR REPLACE TRIGGER komunikat_pracownik_trigger
AFTER INSERT OR DELETE ON pracownicy
FOR EACH ROW
BEGIN
	DBMS_OUTPUT.ENABLE;
	CASE
		WHEN DELETING THEN DBMS_OUTPUT.PUT_LINE('¯egnamy pracownika ' || :OLD.imie || ' ' || :OLD.nazwisko);
        WHEN INSERTING THEN DBMS_OUTPUT.PUT_LINE('Witamy pracownika ' || :NEW.imie || ' ' || :NEW.nazwisko);
	END CASE;
END;

-- wypisanie informacji o iloœci wolnych pokoi w danym akademiku

CREATE OR REPLACE TRIGGER komunikat_pokoje_trigger
BEFORE INSERT ON akademiki
FOR EACH ROW
DECLARE
	bufor NUMBER(6);
	counter NUMBER(6);
BEGIN
	SELECT count(*) INTO bufor FROM akademiki WHERE akademiki.NAZWA_AKADEMIKA = :NEW.NAZWA_AKADEMIKA;
	BUFOR := BUFOR+1;
	COUNTER := 20-BUFOR;
	IF COUNTER > -1 THEN
		dbms_output.put_line(:NEW.NAZWA_AKADEMIKA || '. Dodano Studenta! Zosta³o wolnych pokoi: ' || COUNTER || ' Zajêtych pokoi: ' || BUFOR);
	ELSE
		raise_application_error(-20000, :NEW.NAZWA_AKADEMIKA ||'. Wszystkie pokoje s¹ zajête!');
	END IF;
END;
