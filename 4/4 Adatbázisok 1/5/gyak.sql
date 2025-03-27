-- 1. dolgozók neve akik 2-es fizetési kategóriába tartoznak
select d.dnev
  from dolgozo d
  join fiz_kategoria cat
on d.fizetes between cat.also and cat.felso
 where cat.kategoria = 2;

-- 2. osztályok ahol az avg fizetés nagyobb mint 2000
select o.onev,
       avg(d.fizetes)
  from dolgozo d,
       osztaly o
 where d.oazon = o.oazon
 group by o.oazon
having avg(fizetes) > 2000;

select oazon,
       avg(fizetes)
  from dolgozo
 group by oazon
having avg(fizetes) > 2000;

-- 3. átlagfizetések osztályokon ahol legalább 4-en dolgoznak
select avg(d.fizetes)
  from dolgozo d
 group by oazon
having count(*) >= 4;

-- 4. átlagfizetések és telephelyek, azokon az osztályokon ahol legalább 4-en dolgoznak
select o.telephely,
       avg(d.fizetes)
  from dolgozo d
  join osztaly o
on d.oazon = o.oazon
 group by o.telephely
having count(*) >= 4;

select o.telephely,
       avg(d.fizetes)
  from dolgozo d
natural join osztaly o
 group by o.telephely
having count(*) >= 4;

-- 5. osztályok neve és telephelye, ahol az átlagfizetés nagyobb mint 2000
select o.onev,
       o.telephely,
       avg(d.fizetes)
  from osztaly o
natural join dolgozo d
 group by o.onev,
          o.telephely
having avg(d.fizetes) > 2000;

-- 6. fizetési kategóriák amelyekben pontosan 3 dolgozó fizetése esik
select cat.kategoria
  from dolgozo d
  join fiz_kategoria cat
on d.fizetes between cat.also and cat.felso
 group by cat.kategoria
having count(d.dnev) = 3;

-- 7. osztályok neve és telephelye, ahol van 1-es kategóriás dolgozó
select o.onev,
       o.telephely
  from osztaly o
natural join dolgozo d
  join fiz_kategoria cat
on d.fizetes between cat.also and cat.felso
 where d.kategoria = 1
 group by o.onev,
          o.telephely;

-- 8. kik szeretnek minden gyümölcsöt
select s.nev
  from szeret s
 group by s.nev
having count(*) = (
   select count(distinct s.gyumolcs)
     from szeret
);
