select *
  from szeret sz1,
       szeret sz2;

-- 1. Kik szeretnek legalább kétféle gyümölcsöt?
select distinct sz1.nev
  from szeret sz1,
       szeret sz2
 where sz1.nev = sz2.nev
   and sz1.gyumolcs != sz2.gyumolcs;

-- 2. Kik szeretnek legalább háromféle gyümölcsöt?
select distinct sz1.nev
  from szeret sz1,
       szeret sz2,
       szeret sz3
 where sz1.nev = sz2.nev
   and sz1.nev = sz3.nev
   and sz1.gyumolcs != sz2.gyumolcs
   and sz1.gyumolcs != sz3.gyumolcs
   and sz2.gyumolcs != sz3.gyumolcs; 

-- 3. Kik szeretnek legfeljebb kétféle gyümölcsöt?
select sz1.nev
  from szeret sz1,
       szeret sz2
minus
select sz1.nev
  from szeret sz1,
       szeret sz2
 where sz1.nev = sz2.nev
   and sz1.gyumolcs != sz2.gyumolcs;

-- 4. Kik szeretnek pontosan kétféle gyümölcsöt? (idk)
select sz1.nev
  from szeret sz1,
       szeret sz2
intersect
(
   select sz1.nev
     from szeret sz1,
          szeret sz2
   minus
   select sz1.nev
     from szeret sz1,
          szeret sz2,
          szeret sz3
    where sz1.nev = sz2.nev
      and sz1.nev = sz3.nev
      and sz1.gyumolcs != sz2.gyumolcs
      and sz1.gyumolcs != sz3.gyumolcs
      and sz2.gyumolcs != sz3.gyumolcs
);

-- 1. Kik azok a dolgozók, akiknek a főnöke KING? (nem leolvasva)
select e.dnev
  from dolgozo e,
       dolgozo b
 where e.fonoke = b.dkod
   and b.dnev = 'KING';

-- 2. Adjuk meg azoknak a főnököknek a nevét, akiknek a foglalkozása nem 'MANAGER' (dnev)
select distinct b.dnev
  from dolgozo e,
       dolgozo b
 where e.fonoke = b.dkod
   and b.foglalkozas != 'MANAGER';

-- 3. Adjuk meg azokat a dolgozókat, akik többet keresnek a főnöküknél.
select e.dnev
  from dolgozo e,
       dolgozo b
 where e.fonoke = b.dkod;

-- 4. Kik azok a dolgozók, akik főnökének a főnöke KING?
select e.dnev
  from dolgozo e,
       dolgozo b1,
       dolgozo b2
 where e.fonoke = b1.dkod
   and b1.fonoke = b2.dkod
   and b2.dnev = 'KING';

-- 5. Kik azok a dolgozók, akik osztályának telephelye DALLAS vagy CHICAGO?
select distinct d.dnev
  from dolgozo d,
       osztaly o
 where d.oazon = o.oazon
   and ( o.telephely = 'DALLAS'
    or o.telephely = 'CHICAGO' );

select dnev
  from dolgozo
natural join osztaly
 where telephely = 'DALLAS'
    or telephely = 'CHICAGO'; 

-- 6. Kik azok a dolgozók, akik osztályának telephelye nem DALLAS és nem CHICAGO?
select distinct d.dnev
  from dolgozo d,
       osztaly o
 where d.oazon = o.oazon
   and ( o.telephely != 'DALLAS'
    or o.telephely != 'CHICAGO' );

select dnev
  from dolgozo
natural join osztaly
 where telephely != 'DALLAS'
    or telephely != 'CHICAGO'; 

-- 7. Adjuk meg azoknak a nevét, akiknek a fizetése > 2000 vagy a CHICAGO-i osztályon dolgoznak.
select dnev
  from dolgozo
natural join osztaly
 where fizetes > 2000
    or telephely = 'CHICAGO';

-- 8. Melyik osztálynak nincs dolgozója?
select o.telephely
  from osztaly o;

-- 9. Adjuk meg azokat a dolgozókat, akiknek van 2000-nél nagyobb fizetésű beosztottja.


-- 10. Adjuk meg azokat a dolgozókat, akiknek nincs 2000-nél nagyobb fizetésű beosztottja.


-- 11. Adjuk meg azokat a telephelyeket, ahol van elemző (ANALYST) foglalkozású dolgozó.


-- 12. Adjuk meg azokat a telephelyeket, ahol nincs elemző (ANALYST) foglalkozású dolgozó.


-- 13. Adjuk meg a maximális fizetésű dolgozó(k) nevét.
select d1.dnev
  from dolgozo d1,
       dolgozo d2
minus
select d1.dnev
  from dolgozo d1,
       dolgozo d2
 where d1.fizetes < d2.fizetes;
