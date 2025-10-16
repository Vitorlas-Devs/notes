-- 1. Kik azok a dolgozók, akik 1982.01.01 után léptek be a céghez? Az eredményeket rendezzük a belépési idő alapján növekvő sorrendbe.
select dnev
  from dolgozo
 where belepes > to_date('01-JAN-1982')
--  where belepes > to_date('1982.01.01','YYYY.MM.DD')
 order by belepes asc;

-- 2. Adjuk meg azon dolgozókat, akik nevének második betűje A.
select dnev
  from dolgozo
 where substr(
   dnev,
   2,
   1
) = 'A';

-- 3. Adjuk meg azon dolgozókat, akik nevében van legalább két L betű.
select dnev
  from dolgozo
 where dnev like '%L%L%'; 

-- 4. Adjuk meg a dolgozók nevének utolsó három betűjét.
select dnev,
       substr(
          dnev,
          -3,
          3
       )
  from dolgozo; 

-- 5. Adjuk meg a dolgozók fizetéseinek négyzetgyökét két tizedesre kerekítve.
select round(
   sqrt(fizetes),
   2
)
  from dolgozo;

-- 6. Adjuk meg, hogy hány napja dolgozik a cégnél ADAMS és milyen hónapban lépett be.
select belepes,
       trunc(sysdate - belepes),
       to_char(
          belepes,
          'Month'
       )
  from dolgozo
 where dnev = 'ADAMS';

-- 7. Adjuk meg azokat a (név, főnök) párokat, ahol a két ember neve ugyanannyi betűből áll.
select e.dnev,
       b.dnev
  from dolgozo e,
       dolgozo b
 where e.fonoke = b.dkod
   and length(e.dnev) = length(b.dnev);

-- 8. Listázzuk ki a dolgozók nevét és fizetését, valamint jelenítsük meg a fizetést grafikusan úgy, hogy a fizetést 1000 Ft-ra kerekítve, minden 1000 Ft-ot egy # jel jelöl.
select dnev,
       fizetes,
       rpad(
          ' ',
          round(fizetes / 1000) + 1,
          '#'
       )
  from dolgozo;

-- 9. Listázzuk ki azoknak a dolgozóknak a nevét, fizetését, jutalékát, és a jutalék/fizetés arányát, akiknek a foglalkozása eladó (SALESMAN). Az arányt két tizedesen jelenítsük meg.
select dnev,
       fizetes,
       jutalek,
       round(
          jutalek / fizetes,
          2
       )
  from dolgozo
 where foglalkozas = 'SALESMAN';

-- 10. Adjuk meg az egyes dolgozók fizetésének és jutalékának összegét (akinél a jutalék nincs kitöltve számoljunk 0-val).
select fizetes + nvl(
   jutalek,
   0
)
  from dolgozo;

-- 11. Adjuk meg minden dolgozóra, hogy mennyi fizetés + jutalékot kapott mióta itt dolgozik.
-- A fizetés és jutalék 30 naponta értendő. Kerekítsük az eredményt egész számra.
-- Rendezzük csökkenően az eredményeket az összeg alapján.
select floor((sysdate - belepes) / 30) as napok,
       ( fizetes + nvl(
          jutalek,
          0
       ) * floor((sysdate - belepes) / 30) ) as osszeg
  from dolgozo
 order by osszeg;

-- bad
