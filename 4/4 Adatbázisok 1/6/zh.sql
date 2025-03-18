-- Növeljük meg a DOLGOZO2 táblában 20%-al, azon dolgozók fizetését, akik főnökének a főnöke a KING.
update dolgozo2 d
   set
   d.fizetes = d.fizetes * 1.2
 where d.fonoke in (
   select d.dkod
     from dolgozo2 d,
          dolgozo2 b
    where d.fonoke = b.dkod
      and b.dnev = 'KING'
);
