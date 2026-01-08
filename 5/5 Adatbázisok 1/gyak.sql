-- Írjon PL/SQL eljárást, amely előállítja, és egymást követő sorokba kiírja a felhasználó által megadott két egész szám összes közös osztóját. Például 18 és 24 esetén: 1, 2, 3, 6.

create or replace procedure kosztok (
   a in integer,
   b in integer
) is
   min integer;
begin
   min := least(
      abs(a),
      abs(b)
   );
   for i in 1..min loop
      if
         mod(
            i,
            a
         ) = 0
         and mod(
            i,
            b
         ) = 0
      then
         dbms_output.put_line(i);
      end if;
   end loop;
end;
/

begin
   kosztok(
      18,
      24
   );
end;
/

-- Írjon PL/SQL eljárást, amely megnöveli a felhasználó által megadott százalékértékkel minden, az átlagfizetésnél alacsonyabb fizetéssel rendelkező dolgozó fizetését.

create or replace procedure emel (
   p in integer
) is
begin
   update dolgozo
      set
      fizetes = fizetes * ( 1 + p / 100 )
    where fizetes < (
      select avg(fizetes)
        from dolgozo
   );

   commit;
end;
/

-- Készítsen két táblát az egyikben legyenek sportcsapatok csapat_id, név. A másikban a játékosok, id, név, mezszám, csapat_id. Rendeljen a táblákhoz megfelelő elsődleges és idegen kulcs megszorításokat. A táblákba szúrjon be 1 sportcsapatot, 2 játékost a sportcsapathoz, valamint egy olyan játékost akinek nincs csapata. Törölje az összes olyan játékost akinek nincs csapata.

create table sportcsapatok (
   csapat_id int primary key,
   nev       varchar2(20)
);

create table jatekosok (
   id        int primary key,
   nev       varchar2(20),
   mezszam   int,
   csapat_id int,
   constraint jatekos_fk foreign key ( csapat_id )
      references sportcsapatok ( csapat_id )
);

insert into sportcsapatok values ( 1,
                                   'A' );

insert into jatekosok values ( 1,
                               'A',
                               11,
                               1 );
insert into jatekosok values ( 2,
                               'B',
                               12,
                               1 );
insert into jatekosok values ( 3,
                               'C',
                               13,
                               null );

delete from jatekosok
 where csapat_id is null;




-- view

create or replace view v_jatekos_info as
   select nev,
          mezszam,
          s.nev as csapat
     from jatetosok
   natural join sportcsapatok s;

-- function

create or replace function get_player_count (
   p_id in integer
) return integer as
   c integer;
begin
   select count(id)
     into c
     from sportcsapatok
    where csapat_id = p_id;

   return c;
end;
/

-- Írjon PL/SQL függvényt, mi megnöveli azoknak a dolgozóknak a fizetését, akiknek az azonosítója páros és fizetésük kisebb, mint e csoport átlagfizetése. A növelés e fizetéskülönbség 20%-a. A függvény térjen vissza a fizetésemelések összértékével.

create or replace function novel return integer as
   total   integer := 0;
   average integer;
   emeles  integer;
begin
   select avg(fizetes)
     into average
     from dolgozo
    where mod(
      dkod,
      2
   ) = 0;

   for d in (
      select id,
             fizetes
        from dolgozo
       where mod(
            dkod,
            2
         ) = 0
         and fizetes < average
   ) loop
      emeles := ( average - d.fizetes ) * 0.2;
      update dolgozo
         set
         fizetes = d.fizetes + emeles
       where dkod = d.dkod;

      total := total + emeles;
   end loop;

   return total;
end;
/
