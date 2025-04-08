-- prodecures and functions

-- 1
create or replace procedure hello as
begin
   dbms_output.put_line('hello');
end;
/

call hello();
execute hello;


begin
   hello;
end;
/

-- 2
create or replace procedure összead (
   a integer,
   b integer
) as
   result integer;
begin
   result := a + b;
   dbms_output.put_line('Result: ' || result);
end;
/


call összead(
   2,
   3
);

-- 3

create or replace procedure összead (
   a      in integer,
   b      in integer,
   result out integer
) as
begin
   result := a + b;
end;
/

declare
   result integer;
begin
   összead(
      2,
      3,
      result
   );
   dbms_output.put_line('Result: ' || result);
end;
/

-- 4

create or replace procedure negyzet (
   x in out integer
) as
begin
   x := x * x;
end;
/

declare
   n integer := 5;
begin
   negyzet(n);
   dbms_output.put_line('Square: ' || n);
end;
/

-- 5

create or replace function összead_fn (
   a integer,
   b integer
) return integer as
   result integer;
begin
   result := a + b;
   return result;
end;
/

select összead_fn(
   2,
   3
)
  from dual;

declare
   n integer;
begin
   n := összead_fn(
      2,
      3
   );
   dbms_output.put_line('Result: ' || n);
end;
/

-- 6. fibonacci
create or replace function fib (
   n integer
) return integer as
begin
   if n <= 0 then
      return 0;
   elsif n = 1 then
      return 1;
   else
      return fib(n - 1) + fib(n - 2);
   end if;
end;
/

declare
   n integer := 10;
begin
   dbms_output.put_line('Fib: ' || fib(n));
end;
/

select *
  from v$session
 where username = 'IO3O4S';
execute kill_session(SID, Serial#);

-- 7. prím fn
create or replace function prim (
   n integer
) return integer as
begin
   for i in 2..sqrt(n) loop
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

select prim(13)
  from dual;

-- cursors

-- 1
create or replace procedure kurzor as
   cursor k is
   select *
     from dolgozo;
   sor dolgozo%rowtype;
begin
   open k;
   loop
      fetch k into sor;
      exit when k%notfound;
      dbms_output.put_line(sor.dnev);
   end loop;
end;
/

call kurzor();

-- 2
create or replace procedure kurzor2 as
   cursor k is
   select *
     from dolgozo;
begin
   for sor in k loop
      dbms_output.put_line(sor.dnev);
   end loop;
end;
/

call kurzor2();
