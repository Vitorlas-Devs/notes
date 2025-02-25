create table dolgozo
   as
      select *
        from kotroczo.dolgozo;
create table osztaly
   as
      select *
        from kotroczo.osztaly;

select *
  from dolgozo;

-- 1. kik dolgoznak a 10-es vagy 20-as osztályon
select dnev
  from dolgozo
 where oazon = 10
    or oazon = 20;

-- 2. dolgozo jutalék > 600
select dnev
  from dolgozo
 where jutalek < 600
    or jutalek is null;

-- 3. dolgozo neve és fizetés kétszerese ahol 10-es osztály
select dnev,
       fizetes * 2 fiz2
  from dolgozo
 where oazon = 10;


select *
  from szeret s1,
       szeret s2;

-- 4. állatok akik legalább 2 féle gyümölcsöt szeretnek
select s1.nev
  from szeret s1,
       szeret s2
 where s1.nev = s2.nev
   and s1.gyumolcs != s2.gyumolcs;

-- 5. legalább 3 féle gyümölcsöt szeretnek
select distinct s1.nev
  from szeret s1,
       szeret s2,
       szeret s3
 where s1.nev = s2.nev
   and s2.nev = s3.nev
   and s1.gyumolcs != s2.gyumolcs
   and s2.gyumolcs != s3.gyumolcs
   and s3.gyumolcs != s1.gyumolcs;

-- 6. akik legfeljebb 2 féle gyümölcsöt szeretnek
select distinct nev
  from szeret
minus
select distinct s1.nev
  from szeret s1,
       szeret s2,
       szeret s3
 where s1.nev = s2.nev
   and s2.nev = s3.nev
   and s1.gyumolcs != s2.gyumolcs
   and s2.gyumolcs != s3.gyumolcs
   and s3.gyumolcs != s1.gyumolcs;

-- 7. dolgozók aik főnöke KING
-- a)
select d2.dnev
  from dolgozo d1,
       dolgozo d2
 where d1.dkod = d2.fonoke
   and d1.dnev = 'KING';

-- b)
select dnev
  from dolgozo
 where fonoke in (
   select dkod
     from dolgozo
    where dnev = 'KING'
);

-- 8. dolgozók akik többet keresnek a főnöküknél
select e.dnev
  from dolgozo e,
       dolgozo b
 where e.fizetes > b.fizetes
   and e.fonoke = b.dkod;

-- 9. főnökök főnökeinek neve KING
select distinct b3.dnev
  from dolgozo b1,
       dolgozo b2,
       dolgozo b3
 where b1.dkod = b2.fonoke
   and b2.dkod = b3.fonoke
   and b1.dnev = 'KING';

-- + natural join
select *
  from dolgozo;
select *
  from osztaly;

select *
  from dolgozo
natural join osztaly;

-- 10. dolgozók akik telephelye DALLAS vagy CHICAGO
select dnev
  from dolgozo
natural join osztaly o
 where o.telephely = 'DALLAS'
    or o.telephely = 'CHICAGO';
