ACCEPT nev CHAR PROMPT 'Írd be a neved: ';
BEGIN
    dbms_output.put_line('Név: &nev');
END;
/

EXECUTE nikovits.list_my_sessions;

-- Írjunk egy PLSQL nem tárolt eljárást, amely bekéri egy dolgozó nevét
-- a felhasználótól, aztán pedig kiíarja ennek a dolgozónak a fizetését.
ACCEPT dnev CHAR PROMPT 'Add meg a dolgozó nevét: ';
DECLARE
    fizetes dolgozo.fizetes%type;
BEGIN
    SELECT fizetes
    INTO fizetes
    FROM dolgozo
    WHERE dnev = UPPER('&dnev');
    dbms_output.put_line('Név: &dnev - Fizetes: ' || fizetes);
EXCEPTION
    WHEN no_data_found THEN
        dbms_output.put_line('Nincs ilyen dolgozó!');
    WHEN others THEN
        dbms_output.put_line('Egyéb hiba!');
END;
/

-- CURSOR_ALREADY_OPEN
-- INVALID_CURSOR
-- ROWTYPE_MISMATCH
-- TOO_MANY_ROWS
-- ZERO_DIVIDE

ACCEPT kor NUMBER PROMPT 'Add meg az életkorod: ';
DECLARE
    rossz_ertek EXCEPTION;
BEGIN
    IF '&kor' < 0 OR '&kor' > 100 THEN
        RAISE rossz_ertek;
    END IF;
    dbms_output.put_line('Életkorod: &kor');
EXCEPTION
    WHEN rossz_ertek THEN
        dbms_output.put_line('Hibás életkort adtál meg.');
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

-- Írjunk meg egy procedúrát, amelyik megnöveli 1-el azoknak a dolgozóknak a 
-- fizetését, akiknek a fizetési kategóriája ugyanaz, mint a procedúra paramétere. 
-- A procedúra a módostás után írja ki a módosított (új) fizetések átlagát két 
-- tizedes jegyre kerekítve.
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
    dbms_output.put_line('A módostott fizetések átlaga: ' || ROUND(uj_atlag, 2));
END;
/

CALL dolgozo_update(3);