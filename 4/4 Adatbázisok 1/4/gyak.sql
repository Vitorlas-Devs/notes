-- 1. kik azok a dolgozók akik jan 1 után léptek be a céghez
select dnev
  from dolgozo
 where belepes > '01-JAN-82';

select dnev
  from dolgozo
 where belepes > to_date('1982.01.01','YYYY.MM.DD');

-- 2. dolgozók akik nevének 2. betűje 'A'
select dnev
  from dolgozo
 where substr(
   dnev,
   2,
   1
) = 'A';

select dnev
  from dolgozo
 where dnev like '_A%';

-- 3. dolgozók akik nevében van legalább 2 'L'
select dnev
  from dolgozo
 where dnev like '%L%L%';

select dnev
  from dolgozo
 where instr(
   dnev,
   'L',
   1,
   2
) > 0;

-- 4. listázzuk ki a dolgozók nevét és fizetését
-- a fizetés formatáljuk úgy is hogy minden 1000-t '#'-el jelöl 
select dnev,
       fizetes,
       rpad(
          ' ',
          trunc(fizetes / 1000) + 1,
          '#'
       ) as grafikon
  from dolgozo
 order by fizetes desc;

-- 5. milyen napra esett KING belépési dátumának hónapjának utolsó napja
select belepes,
       to_char(
          last_day(belepes),
          'Day'
       )
  from dolgozo
 where dnev = 'KING';

-- 6. azok a (név, főnök) párok, akik neven ugyanannyi karakterből áll
select e.dnev,
       b.dnev
  from dolgozo e,
       dolgozo b
 where e.fonoke = b.dkod
   and length(e.dnev) = length(b.fonoke);

-- 
select *
  from dolgozo,
       fiz_kategoria
 where fizetes between also and felso;

select *
  from dolgozo
  join fiz_kategoria
on fizetes between also and felso;
