select *
  from dolgozo;

select *
  from osztaly;

select *
  from fiz_kategoria;

-- 1. Kik azok a dolgozók, akiknek a fizetése nagyobb, mint 2800?
select d.dnev
  from dolgozo d
 where fizetes > 2800; 

-- 2. Kik azok a dolgozók, akik a 10-es vagy a 20-as osztályon dolgoznak?
select d.dnev
  from dolgozo d
 where oazon = 10
    or oazon = 20;

-- 3. Kik azok, akiknek a jutaléka nagyobb, mint 600?
select d.dnev
  from dolgozo d
 where jutalek > 600;

-- 4. Kik azok, akiknek a jutaléka nem nagyobb, mint 600?
select d.dnev
  from dolgozo d
 where jutalek <= 600
    or jutalek is null;

-- 5. Kik azok a dolgozók, akiknek a jutaléka ismeretlen (nincs kitöltve, vagyis NULL)? - ehhez még nem vettünk mindent
select d.dnev
  from dolgozo d
 where jutalek is null;

-- 6. Adjuk meg a dolgozók között előforduló foglalkozások neveit.
select distinct foglalkozas
  from dolgozo
 where foglalkozas is not null;

-- 7. Adjuk meg azoknak a nevét és kétszeres fizetését, akik a 10-es osztályon dolgoznak.
select d.dnev,
       ( fizetes * 2 ) dupla_fiz
  from dolgozo d
 where oazon = 10;

-- 8. Kik azok a dolgozók, akik 1982.01.01 után léptek be a céghez?
select d.dnev
  from dolgozo d
 where belepes > to_date('1982.01.01','YYYY.MM.DD');

-- 9. Kik azok, akiknek nincs főnöke? - ehhez még nem vettünk mindent
select d.dnev
  from dolgozo d
 where fonoke is null; 

-- 10. Kik azok a dolgozók, akiknek a főnöke KING? (egyelőre KING azonosítóját leolvasva a képernyőről)
select d.dnev
  from dolgozo d,
       dolgozo b
 where b.dnev = 'KING'
   and d.fonoke = b.dkod;

select d.dnev
  from dolgozo d
 where d.fonoke = (
   select b.dkod
     from dolgozo b
    where b.dnev = 'KING'
);
