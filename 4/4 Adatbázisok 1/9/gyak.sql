-- Procedúrák és függvények
CREATE OR REPLACE PROCEDURE hello AS
BEGIN
    dbms_output.put_line('Hello World!');
END;
/

CALL hello();
EXECUTE hello;

BEGIN
    hello;
END;
/

CREATE OR REPLACE PROCEDURE osszeadas(a INTEGER, b INTEGER) AS
    eredmeny INTEGER;
BEGIN
    eredmeny := a + b;
    dbms_output.put_line('Eredmény: ' || eredmeny);
END;
/

CALL osszeadas(5, 10);

CREATE OR REPLACE PROCEDURE osszeadas2(a IN INTEGER, b IN INTEGER, 
    eredmeny OUT INTEGER) AS
BEGIN
    eredmeny := a + b;
    dbms_output.put_line('Eredmény: ' || eredmeny);
END;
/

DECLARE
    eredmeny INTEGER;
BEGIN
    osszeadas2(5, 10, eredmeny);
    dbms_output.put_line('Eredmény: ' || eredmeny);
END;
/

CREATE OR REPLACE PROCEDURE negyzet(x IN OUT INTEGER)AS
BEGIN
    x := x * x;
END;
/

DECLARE
    szam INTEGER := 5;
BEGIN
    negyzet(szam);
    dbms_output.put_line('Négyzet: ' || szam);
END;
/

CREATE OR REPLACE FUNCTION osszeadas_fn(a INTEGER, b INTEGER) 
    RETURN INTEGER AS
    osszeg INTEGER;
BEGIN
    osszeg := a + b;
    RETURN osszeg;
END;
/

SELECT osszeadas_fn(5, 20) FROM dual;

DECLARE
    szam INTEGER;
BEGIN
    szam := osszeadas_fn(10, 20);
    dbms_output.put_line('Összeg: ' || szam);
END;
/

-- SELECT * FROM v$session WHERE username = '<NEPTUNKOD!!!!>';
-- execute kill_session(SID, Serial#);

-- Írjunk egy fib függvényt, amely megadja 
-- nekünk az n. fibonacci számot.
CREATE OR REPLACE FUNCTION fib(n INTEGER) RETURN INTEGER AS
BEGIN
    IF n = 0 THEN
        RETURN 0;
    ELSIF n = 1 THEN
        RETURN 1;
    ELSE
        RETURN n + fib(n - 1);
    END IF;
END;
/

SELECT fib(10) FROM dual;

-- Írjuk egy  prim függvényt, amely eldönti egy n számról, hogy
-- prím-e. Ha prím -> 1 vagy ha nem prím -> 0
CREATE OR REPLACE FUNCTION prim(n INTEGER) RETURN INTEGER AS
BEGIN
    FOR i IN 2..SQRT(n) LOOP
        IF MOD(n, i) = 0 THEN
            RETURN 0;
        END IF;
    END LOOP;
    RETURN 1;
END;
/

SELECT prim(13) FROM dual;

-- Kurzorok
-- CURSOR <kurzor_neve> IS SELECT * FROM <táblanév>;
-- OPEN <kurzor_neve>;
-- FETCH <kurzor_neve> INTO <változo_neve>;
-- CLOSE <kurzor_neve>;
-- EXIT WHEN <kurzor_neve%notfound> LOOP;

CREATE OR REPLACE PROCEDURE kurzorteszt1 AS
    CURSOR k IS SELECT * FROM dolgozo;
    sor dolgozo%rowtype;
BEGIN
    OPEN k;
    LOOP
        FETCH k INTO sor;
        EXIT WHEN k%notfound;
        dbms_output.put_line(sor.dnev);
    END LOOP;
    CLOSE k;
END;
/

CALL kurzorteszt1();

CREATE OR REPLACE PROCEDURE kurzorteszt2 AS
    CURSOR k IS SELECT * FROM dolgozo;
    sor dolgozo%rowtype;
BEGIN
    FOR sor IN k LOOP
        dbms_output.put_line(sor.dnev);
    END LOOP;
END;
/

CALL kurzorteszt2();
