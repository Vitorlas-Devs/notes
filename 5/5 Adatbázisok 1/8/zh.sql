-- Készítsünk két táblát az egyikben legyenek sportcsapatok csapat_id, név.
-- A másikban a játékosok, id, név, mezszám, csapat_id. A csapat azonosító legyen idegen kulcs.

drop table jatekosok;
drop table sportcsapatok;

-- Készítsük el az 1. táblát
create table sportcsapatok (
   csapat_id int primary key,
   nev       varchar(30)
);

-- Készítsük el az 2. táblát
create table jatekosok (
   id        int primary key,
   nev       varchar(30),
   mezszam   int,
   csapat_id int,
   constraint jatekosok_fk foreign key ( csapat_id )
      references sportcsapatok ( csapat_id )
);
