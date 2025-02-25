-- Kik azok a dolgozók, akik nem ugyanazon az osztályon dolgoznak, mint a főnökük?
-- Az eredményben csak a beosztott DNEV-et add meg csökkenő sorrendben! (dnev)

select distinct e.dnev
  from dolgozo e,
       dolgozo b
 where e.fonoke = b.dkod
   and e.oazon != b.oazon
 order by e.dnev desc;

