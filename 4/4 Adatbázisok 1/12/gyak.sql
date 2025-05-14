/*�rjunk meg egy proced�r�t, amelyik a param�ter�ben kapott sz�mra k�l�n sorokba ki�rja 
annak reciprok�t, n�gyzetgy�k�t, �s faktori�lis�t. Ha b�rmelyik nem �rtelmezhet� vagy
t�lcsordul�st okoz, akkor erre a r�szre �rja ki a kapott hibak�dot. (SQLCODE).*/

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
    
    -- N�gyzetgy�k
    BEGIN
        gyok := SQRT(n);
        dbms_output.put_line('N�gyzetgy�k: ' || gyok);
    
    EXCEPTION
        WHEN OTHERS THEN
            dbms_output.put_line('N�gyzetgy�j hiba: ' || SQLCODE);
    END;
    
    -- Faktori�lis
    BEGIN
        FOR i in 1..n LOOP
            faktorialis := faktorialis * i;
        END LOOP;
        dbms_output.put_line('Faktori�lis: ' || faktorialis);
    
    EXCEPTION
        WHEN OTHERS THEN
            dbms_output.put_line('Faktori�lis hiba: ' || SQLCODE);
    END;
END;
/

set serveroutput on
execute szamok(0);
execute szamok(-2);
execute szamok(40);

/*�rjunk meg egy proced�r�t, amelyik m�dos�tja a param�ter�ben megadott oszt�lyon a 
fizet�seket, �s ki�rja a dolgoz� nev�t �s �j fizet�s�t.  A m�dos�t�s mindenki 
fizet�s�hez adjon hozz� n*100, ahol n a dolgoz� nev�ben lev� mag�nhangz�k sz�ma 
(A, E, I, O, U). A proced�ra a ki�r�s ut�n adjon ki egy ROLLBACK utas�t�st, hogy 
megmaradjanak az eredeti fizet�sek, �gy a proced�r�t t�bbsz�r is futtatni tudj�k.*/

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


/*�rj egy count_workdays f�gv�nyt, amely kapjon k�t d�tumparam�tert 
(p_start_date, p_end_date) �s sz�molja meg a h�tk�znapokat a k�t d�tum k�z�tt.*/

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










