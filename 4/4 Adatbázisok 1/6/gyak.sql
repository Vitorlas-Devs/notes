-- 1. dolgozók törlése akik jutaléka NULL
delete from dolgozo2 d
 where d.jutalek is null;

rollback;

-- 2. dolgozók törlése akiknek a belépési dátuma 1982 előtti
delete from dolgozo2 d
 where d.belepes < to_date('1982.01.01','YYYY.MM.DD');

rollback;

-- 3. dolgozók törlése akik telephelye DALLAS
delete from dolgozo2 d
 where d.oazon in (
   select o.oazon
     from osztaly2 o
    where o.telephely = 'DALLAS'
);

rollback;

-- 4. dolgozók törlése akik fizetése kisebb mint az átlag fizetés
delete from dolgozo2 d
 where d.fizetes < (
   select avg(d.fizetes)
     from dolgozo2 d
);

rollback;

-- 5. töröljünk osztályokat, ahol 2 dolgozó van 2-es fizetése kategóriában
select *
  from osztaly2 o
 where o.oazon in (
   select o.oazon
     from dolgozo2 d
     join fiz_kategoria cat
   on fizetes between also and felso
    where cat.kategoria = 2
    group by o.oazon
   having count(*) >= 2
);

select *
  from osztaly2 o
 where o.oazon in (
   select o.oazon
     from dolgozo2 d,
          fiz_kategoria cat
    where d.fizetes between also and felso
      and cat.kategoria = 2
    group by o.oazon
   having count(*) = 2
);

-- 6. insert Kovacs dolgozó, 10. osztályba, dkod 1, belepes sysdate, fizetés 10-es osztály átlaga
insert into dolgozo2 d (
   d.dnev,
   d.dkod,
   d.oazon,
   d.belepes,
   d.fizetes
) values ( 'Kovacs',
           1,
           10,
           sysdate,
           (
              select avg(d.fizetes)
                from dolgozo2 d
               where d.oazon = 10
           ) );

commit;

-- 7. növeljük meg a 10-as osztályon dolgozók fizetését 20%-al
update dolgozo2 d
   set
   d.fizetes = d.fizetes * 1.2
 where d.oazon = 20;

commit;

-- 8. növeljük meg dolgozók fizetését 500-al akik jutaléke NULL vagy kisebb a fizetése az átlagnál
update dolgozo2 d
   set
   d.fizetes = d.fizetes + 500
 where d.jutalek is null
    or d.fizetes < (
   select avg(d.fizetes)
     from dolgozo2 d
);

commit;

rollback;

select *
  from dolgozo2;
