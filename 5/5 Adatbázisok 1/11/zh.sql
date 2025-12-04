-- 1. Hányszor fordul elő egy szövegben egy másik string
-- SELECT hanyszor ('ab c ab ab de ab fg ab', 'ab') FROM dual; --> 5

declare
   count int := 0;
begin
   null;
end;
/

create or replace function hanyszor (
   text varchar2,
   find varchar2
) return int is
   s int := 0;
   c int := 1;
begin
   while c <= length(text) loop
      if substr(
         text,
         c,
         2
      ) = find then
         s := s + 1;
      end if;
      c := c + 3;
   end loop;
   return s;
end;
/

select hanyszor(
   'ab cc ab ab de ab fg ab',
   'ab'
)
  from dual;

-- 2. Szövegből összeg select osszeg('1+2+3+40+5+6') from dual; --> 57

create or replace function osszeg (
   text varchar2
) return int is
   s int := 0;
   c int := 1;
   t int := 1;
begin
   while c <= length(text) loop
      t := 1;
      while substr(
         text,
         t + 1,
         1
      ) != '+' loop
         t := t + 1;
      end loop;
      s := s + to_number ( substr(
         text,
         c,
         t
      ) );
      c := c + t + 1;
   end loop;
   return s;
end;
/

select osszeg('1+2+3+4+5+6')
  from dual;
