-- Add meg, hogy hány alkalmazottja van annak a dolgozónak, akinek a legtöbb beosztottja van.
select max(count(*))
  from dolgozo d,
       dolgozo b
 where d.fonoke = b.dkod
 group by b.dnev;
