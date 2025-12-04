drop table dolgozo2;

create table dolgozo2
   as
      select 1 sorszam,
             dolgozo.*
        from dolgozo;

select *
  from dolgozo2;

-- set serveroutput on;

declare
   cursor c is
   select *
     from dolgozo2
    order by dnev
   for update;
   db int := 0;
begin
   for rec in c loop
      db := db + 1;
      update dolgozo2
         set
         sorszam = db
       where current of c;
      -- dbms_output.put_line(rec.dnev);
   end loop;
end;
/


select *
  from dolgozo2
 order by dnev;

 -- trigger

create or replace trigger dkoder before
   insert on dolgozo2
   for each row
declare
   running_dkod int;
begin
   select max(dkod)
     into running_dkod
     from dolgozo2;
   :new.dkod := running_dkod + 1;
   dbms_output.put_line('Max dkod: ' || running_dkod);
   dbms_output.put_line('Inserted: ' || :new.dkod);
end;
/

insert into dolgozo2 ( dnev ) values ( 'KAROLY' );

-- asd

create or replace function prim (
   n integer
) return number is
   i number := 0;
begin
   if n < 2 then
      return 0;
   end if;
   for i in 2..n / 2 loop
      if mod(
         n,
         i
      ) = 0 then
         return 0;
      end if;
   end loop;
   return 1;
end;
/

select prim(2)
  from dual;

declare
   cursor c is
   select *
     from dolgozo2
    where prim(sorszam) = 1
   for update;
begin
   for rec in c loop
      update dolgozo2
         set
         fizetes = fizetes * 1.5
       where current of c;
   end loop;
end;
/

create or replace function kat_novel (
   p_kat number
) return number is
   cursor c is
   select *
     from dolgozo2
     join fiz_kategoria
   on fizetes between also and felso
    where kategoria = p_kat
   for update of fizetes;
   db int := 0;
   s  int := 0;
begin
   for rec in c loop
      dbms_output.put_line('Before: ' || rec.fizetes);
      update dolgozo2
         set
         fizetes = fizetes + 1
       where current of c;
      dbms_output.put_line('Before: ' || rec.fizetes);
      db := db + 1;
      s := s + rec.fizetes;
   end loop;
   return s / db;
end;
/

-- error:
-- select kat_novel(1)
--   from dual;

begin
   dbms_output.put_line(kat_novel(1));
end;
/

declare
   cursor c is
   select *
     from dolgozo2
     join fiz_kategoria
   on fizetes between also and felso
    where kategoria = 3
   for update of sorszam;
begin
   for rec in c loop
      delete from dolgozo2
       where current of c;
   end loop;
end;
/

--
