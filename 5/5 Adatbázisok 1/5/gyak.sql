-- 1. Adjuk meg mennyi a dolgozók között előforduló maximális fizetés.
select max(fizetes)
  from dolgozo;

-- 2. Adjuk meg mennyi a dolgozók között előforduló minimális fizetés.
select min(fizetes)
  from dolgozo;

-- max fiz dolgozo 
select *
  from dolgozo
natural join (
   select max(fizetes) fizetes
     from dolgozo
);

-- 3. Adjuk meg mennyi a dolgozók között előforduló átlagfizetés.
select oazon,
       avg(fizetes) atlag
  from dolgozo
 group by oazon;

select *
  from dolgozo
 where fizetes = (
   select max(fizetes)
     from dolgozo
);

-- 4. Adjuk meg hány dolgozó van a dolgozó táblában.
select count(*),
       count(jutalek),
       count(distinct jutalek)
  from dolgozo;

-- 5. Adjuk meg hányan dolgoznak az egyes osztályokon.
select oazon,
       count(*)
  from dolgozo
 group by oazon;

-- 6. Adjuk meg azokra az osztályokra az átlagfizetést, ahol ez nagyobb mint 2000.
select oazon,
       avg(fizetes) atlag
  from dolgozo
 where fizetes > 1500
 group by oazon
having avg(fizetes) > 2000
 order by oazon asc;

-- 7. Adjuk meg az átlagfizetést azokon az osztályokon, ahol legalább 4-en dolgoznak (oazon, avg_fiz)
select oazon,
       avg(fizetes) avg_fiz
  from dolgozo
 group by oazon
having count(*) >= 4;

-- 8. Adjuk meg az átlagfizetést és telephelyet azokon az osztályokon, ahol legalább 4-en dolgoznak.
select telephely,
       avg(fizetes)
  from dolgozo
natural join osztaly
having count(*) >= 4
 group by telephely;

-- 9. Adjuk meg azon osztályok nevét és telephelyét, ahol az átlagfizetés nagyobb mint 2000. (onev, telephely)
select onev,
       telephely,
       avg(fizetes)
  from dolgozo
natural join osztaly
 group by onev,
          telephely
having avg(fizetes) > 2000;

-- 10. Adjuk meg azokat a fizetési kategóriákat, amelybe pontosan 3 dolgozó fizetése esik.
select kategoria,
       count(dkod)
  from fiz_kategoria
  join dolgozo
on fizetes between also and felso
 group by kategoria
having count(dkod) > 3;

-- 12. Adjuk meg azokat a fizetési kategóriákat, amelyekbe eső dolgozók mindannyian ugyanazon az osztályon dolgoznak.
select kategoria
  from fiz_kategoria
  join dolgozo
on fizetes between also and felso
 group by kategoria
having count(distinct oazon) = 1;

-- 13. Adjuk meg azon osztályok nevét és telephelyét, amelyeknek van 1-es fizetési kategóriájú dolgozója.
select onev,
       telephely
  from fiz_kategoria
  join dolgozo
on fizetes between also and felso
natural join osztaly
 group by onev,
          telephely; -- todo

-- 14. Adjuk meg azon osztályok nevét és telephelyét, amelyeknek legalább 2 fő 1-es fiz. kategóriájú dolgozója van.


-- 15. Adjuk meg, hogy az egyes emberek fizetése mennyiben tér el az osztályuk átlagfizetésétől.
