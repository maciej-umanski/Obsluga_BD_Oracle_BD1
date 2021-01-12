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
		WHEN DELETING THEN DBMS_OUTPUT.PUT_LINE('¯egnamy ' || :OLD.imie || ' ' || :OLD.nazwisko);
        WHEN INSERTING THEN DBMS_OUTPUT.PUT_LINE('Witamy ' || :NEW.imie || ' ' || :NEW.nazwisko);
	END CASE;
END;

-- wypisanie informacji powitalnej po dodaniu nowego pracownika oraz po¿egnalnej po usuniêciu --

CREATE OR REPLACE TRIGGER komunikat_pracownik_trigger
AFTER INSERT OR DELETE ON pracownicy
FOR EACH ROW
BEGIN
	DBMS_OUTPUT.ENABLE;
	CASE
		WHEN DELETING THEN DBMS_OUTPUT.PUT_LINE('¯egnamy ' || :OLD.imie || ' ' || :OLD.nazwisko);
        WHEN INSERTING THEN DBMS_OUTPUT.PUT_LINE('Witamy ' || :NEW.imie || ' ' || :NEW.nazwisko);
	END CASE;
END;




