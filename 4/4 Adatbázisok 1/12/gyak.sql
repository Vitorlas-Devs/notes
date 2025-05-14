/*Írjunk meg egy procedúrát, amelyik a paraméterében kapott számra külön sorokba kiírja 
annak reciprokát, négyzetgyökét, és faktoriálisát. Ha bármelyik nem értelmezhetõ vagy
túlcsordulást okoz, akkor erre a részre írja ki a kapott hibakódot. (SQLCODE).*/

CREATE OR REPLACE PROCEDURE szamok(n number) IS
    reciprok NUMBER;
    gyok NUMBER;
    faktorialis NUMBER := 1;
BEGIN
    -- Reciprok
    BEGIN
        reciprok := 1 / n;
        dbms_output.put_line('Reciprok: ' || reciprok);
    
    EXCEPTION
        WHEN OTHERS THEN
            dbms_output.put_line('Reciprok hiba: ' || SQLCODE);
    END;
    
    -- Négyzetgyök
    BEGIN
        gyok := SQRT(n);
        dbms_output.put_line('Négyzetgyök: ' || gyok);
    
    EXCEPTION
        WHEN OTHERS THEN
            dbms_output.put_line('Négyzetgyöj hiba: ' || SQLCODE);
    END;
    
    -- Faktoriális
    BEGIN
        FOR i in 1..n LOOP
            faktorialis := faktorialis * i;
        END LOOP;
        dbms_output.put_line('Faktoriális: ' || faktorialis);
    
    EXCEPTION
        WHEN OTHERS THEN
            dbms_output.put_line('Faktoriális hiba: ' || SQLCODE);
    END;
END;
/

set serveroutput on
execute szamok(0);
execute szamok(-2);
execute szamok(40);

/*Írjunk meg egy procedúrát, amelyik módosítja a paraméterében megadott osztályon a 
fizetéseket, és kiírja a dolgozó nevét és új fizetését.  A módosítás mindenki 
fizetéséhez adjon hozzá n*100, ahol n a dolgozó nevében levõ magánhangzók száma 
(A, E, I, O, U). A procedúra a kiírás után adjon ki egy ROLLBACK utasítást, hogy 
megmaradjanak az eredeti fizetések, így a procedúrát többször is futtatni tudják.*/

CREATE OR REPLACE PROCEDURE fiz_update(p_oazon INTEGER) IS 
    CURSOR d_curs IS
        SELECT dnev, fizetes, REGEXP_COUNT(UPPER(dnev), '[AEIOU]') db
        FROM dolgozo
        WHERE oazon = p_oazon;
    sor d_curs%rowtype;
BEGIN
    FOR sor IN d_curs LOOP
        UPDATE dolgozo2
        SET fizetes = fizetes + (sor.db * 100)
        WHERE dnev = sor.dnev;
        dbms_output.put_line(sor.dnev || ': ' || (sor.fizetes + (sor.db * 100)));
    END LOOP;
    ROLLBACK;
END;
/

set serveroutput on
execute fiz_update(10);


/*Írj egy count_workdays fügvényt, amely kapjon két dátumparamétert 
(p_start_date, p_end_date) és számolja meg a hétköznapokat a két dátum között.*/

CREATE OR REPLACE FUNCTION count_workdays(p_start DATE, p_end DATE) RETURN NUMBER IS
    db NUMBER := 0;
    aktualis DATE := p_start;
BEGIN
    WHILE aktualis <= p_end LOOP
        IF TO_CHAR(aktualis, 'D') NOT IN (6, 7) THEN
            db := db + 1;
        END IF;
        aktualis := aktualis + 1;
    END LOOP;
    RETURN db;
END;
/

SELECT count_workdays(
    TO_DATE('2020-01-01', 'YYYY-MM-DD'), 
    TO_DATE('2020-01-10', 'YYYY-MM-DD')) 
FROM dual;










