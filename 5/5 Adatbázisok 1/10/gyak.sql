create or replace function proba (
   par in out int
) return int is
begin
   par := 10;
   return par;
end;
/

select proba(3)
  from dual;
/

declare begin
   null;
end;
/

  --  set serveroutput on;

/

declare
   a int := 3;
begin
   dbms_output.put_line(a);
   dbms_output.put_line(proba(a));
   dbms_output.put_line(a);
end;
/

-- accept

accept valamit char prompt 'Be=';

select *
  from dolgozo
 where dnev = '&valami';

-- cursor

declare
   cursor c1 is
   select *
     from dolgozo;

   rec c1%rowtype;
begin
   open c1;
   while true loop
      fetch c1 into rec;
      exit when c1%notfound;
      dbms_output.put_line(rec.dnev
                           || ' - ' || rec.fizetes);
   end loop;
   close c1;
end;
/

declare
   cursor c1 is
   select *
     from dolgozo
   natural join osztaly
    where oazon = 10
    order by dnev;
begin
   for rec in c1 loop
      dbms_output.put_line(rec.dnev
                           || ' - '
                           || rec.fizetes
                           || ' - ' || rec.onev);
   end loop;
end;
/

-- helpers

select substr(
   'ab cc ab ab de ab fg ab',
   1,
   2
)
  from dual;

select to_number('10')
  from dual;

select substr(
   '1+2+3+40+5+6',
   2,
   1
)
  from dual;
