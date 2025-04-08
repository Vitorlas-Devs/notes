-- Írj egy PLSQL függvényt N_PAROS_SZUM néven, amely paraméterül kap egy n INTEGER számot és
-- egy INTEGER-rel tér vissza. A függvény kiszámolja az 1..n intervallumon található páros számok összegét és visszatér vele.
create or replace function n_paros_szum (
   n integer
) return integer as
   szum integer;
begin
   szum := 0;
   for i in 1..n loop
      if mod(
         i,
         2
      ) = 0 then
         szum := szum + i;
      end if;
   end loop;
   return szum;
end;
/

-- declare begin
--    dbms_output.put_line(n_paros_szum(4));
-- end;
-- /
