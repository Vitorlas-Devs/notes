ACCEPT nev CHAR PROMPT '�rd be a neved: ';
BEGIN
    dbms_output.put_line('N�v: &nev');
END;
/

EXECUTE nikovits.list_my_sessions;

-- �rjunk egy PLSQL nem t�rolt elj�r�st, amely bek�ri egy dolgoz� nev�t
-- a felhaszn�l�t�l, azt�n pedig ki�arja ennek a dolgoz�nak a fizet�s�t.
ACCEPT dnev CHAR PROMPT 'Add meg a dolgoz� nev�t: ';
DECLARE
    fizetes dolgozo.fizetes%type;
BEGIN
    SELECT fizetes
    INTO fizetes
    FROM dolgozo
    WHERE dnev = UPPER('&dnev');
    dbms_output.put_line('N�v: &dnev - Fizetes: ' || fizetes);
EXCEPTION
    WHEN no_data_found THEN
        dbms_output.put_line('Nincs ilyen dolgoz�!');
    WHEN others THEN
        dbms_output.put_line('Egy�b hiba!');
END;
/

-- CURSOR_ALREADY_OPEN
-- INVALID_CURSOR
-- ROWTYPE_MISMATCH
-- TOO_MANY_ROWS
-- ZERO_DIVIDE

ACCEPT kor NUMBER PROMPT 'Add meg az �letkorod: ';
DECLARE
    rossz_ertek EXCEPTION;
BEGIN
    IF '&kor' < 0 OR '&kor' > 100 THEN
        RAISE rossz_ertek;
    END IF;
    dbms_output.put_line('�letkorod: &kor');
EXCEPTION
    WHEN rossz_ertek THEN
        dbms_output.put_line('Hib�s �letkort adt�l meg.');
END;
/

DROP TABLE dolgozo2;
CREATE TABLE dolgozo2 AS SELECT * FROM kotroczo.dolgozo;

SELECT * FROM dolgozo2 WHERE oazon = 10;

UPDATE dolgozo2 SET fizetes = fizetes + 1000 WHERE oazon = 10;

BEGIN
    UPDATE dolgozo2 SET fizetes = fizetes + 1000 WHERE oazon = 10;
END;
/

DECLARE
    CURSOR curs1 IS
        SELECT * 
        FROM dolgozo2 
        WHERE oazon = 10;
    rec curs1%rowtype;
BEGIN
    FOR rec IN curs1 LOOP
        UPDATE dolgozo2 SET fizetes = fizetes + 1000 WHERE dolgozo2.dkod = rec.dkod;
    END LOOP;
    COMMIT;
END;
/

-- �rjunk meg egy proced�r�t, amelyik megn�veli 1-el azoknak a dolgoz�knak a 
-- fizet�s�t, akiknek a fizet�si kateg�ri�ja ugyanaz, mint a proced�ra param�tere. 
-- A proced�ra a m�dost�s ut�n �rja ki a m�dos�tott (�j) fizet�sek �tlag�t k�t 
-- tizedes jegyre kerek�tve.
CREATE OR REPLACE PROCEDURE dolgozo_update(n INTEGER) AS
    CURSOR curs1 IS
        SELECT *
        FROM dolgozo2, fiz_kategoria
        WHERE fizetes BETWEEN also AND felso AND kategoria = n;
    rec curs1%rowtype;
    
    uj_atlag FLOAT;
BEGIN
    FOR rec IN curs1 LOOP
        UPDATE dolgozo2 SET fizetes = fizetes + 1 WHERE dolgozo2.dkod = rec.dkod;
    END LOOP;
    COMMIT;
    SELECT AVG(fizetes)
    INTO uj_atlag
    FROM dolgozo2;
    dbms_output.put_line('A m�dostott fizet�sek �tlaga: ' || ROUND(uj_atlag, 2));
END;
/

CALL dolgozo_update(3);