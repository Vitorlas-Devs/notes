create table dept (
   name string,
   id   int
);

describe dolgozo;

create table employees (
   employee_id number(6)
      constraint emp_emp_id_pk primary key,
   name        varchar(20) unique,
   dep_id      number(6)
      constraint emp_dep_id_fk
         references dept ( id )
);

create table bosses (
   name varchar(20)
)
   as
      select dnev
        from dolgozo
       where dkod in (
         select dkod
           from dolgozo
          where dkod is not null
      );

create or replace view boss_ids as
   select dkod
     from dolgozo
    where dkod in (
      select dkod
        from dolgozo
       where dkod is not null
   );

drop view boss_ids;

create or replace view oszt10 as
   select dnev,
          fizetes
     from dolgozo
    where oazon = 10;

select *
  from oszt10;

DESCRIBE oszt10;

declare begin
   null;
end;
/

declare
   message varchar(20) := 'Hello';
begin
   dbms_output.put_line(message);
   dbms_output.put_line('Hello 6world');
end;
/


declare
   n1    integer;
   n2    real;
   n3    double precision;
   n4    numeric;
   char1 char(10); -- length=10
   char2 varchar(20); -- length < 20
   char3 long;
   bool  boolean;
   datum date;
begin
   null;
end;
/

declare
   a constant integer := 10;
   b constant integer := 20;
   c integer;
begin
   c := a + b;
   dbms_output.put_line('c = ' || c);
end;
/

declare
   kod dolgozo.dkod%type := 7839;
   nev dolgozo.dnev%type;
   fiz dolgozo.fizetes%type;
begin
   select dnev,
          fizetes
     into
      nev,
      fiz
     from dolgozo
    where dkod = kod;
end;
/

declare
   kod dolgozo.dkod%type := 7839;
   d   dolgozo%rowtype;
begin
   select *
     into d
     from dolgozo
    where dkod = kod;
end;
/

declare begin
   for i in 0..10 loop
      if i < 5 then
         dbms_output.put_line(i || ' kisebb mint 5');
      elsif i = 5 then
         dbms_output.put_line(i || ' az 5');
      else
         dbms_output.put_line(i || ' nagyobb mint 5');
      end if;
   end loop;
end;
/

declare
   i number := 0;
begin
   while i <= 10 loop
      if i < 5 then
         dbms_output.put_line(i || ' kisebb mint 5');
      elsif i = 5 then
         dbms_output.put_line(i || ' az 5');
      else
         dbms_output.put_line(i || ' nagyobb mint 5');
      end if;
      i := i + 1;
   end loop;
end;
/
