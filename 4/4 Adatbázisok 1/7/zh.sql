-- Hozz létre egy nézetet O20 néven, amelyen azon dolgozók nevét, fizetését, belépés dátumát tárolja,
-- akik a 20-as osztályon dolgoznak és a 4-es fizetési kategóriába tartoznak. O20(dnev, fizetes, belepes)

create view o20 as
   select dnev,
          fizetes,
          belepes
     from dolgozo
     join fiz_kategoria
   on fizetes between also and felso
    where oazon = 20
      and kategoria = 4;
