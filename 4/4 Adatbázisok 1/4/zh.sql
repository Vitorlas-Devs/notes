-- Add meg azon dolgozók neveik első betűjének az ASCII kódját,
-- akik a CHICAGO telephelyű osztályon dolgoznak és 1981.06.01 után léptek be. (ascii_code)
select ascii(dnev) as ascii_code
  from dolgozo d,
       osztaly o
 where o.oazon = d.oazon
   and o.telephely = 'CHICAGO'
   and d.belepes > to_date('1981.06.01','YYYY.MM.DD');
