-- 2.
drop table rendelesi_tortenet;
drop table termek;
drop table ugyfel;
drop table felhasznalo;

create table termek (
   t_id  int primary key,
   t_nev varchar2(30),
   ar    int
);

select *
  from termek;

create table felhasznalo (
   f_id  int primary key,
   f_nev varchar2(30),
   cim   varchar2(100)
);

create table vasarol (
   t_id int,
   f_id int,
   db   int,
   constraint termek_fk foreign key ( t_id )
      references termek ( t_id ),
   constraint felhasznalo_fk foreign key ( f_id )
      references felhasznalo ( f_id )
);

create table dolgozo2
   as
      select *
        from dolgozo;

select *
  from dolgozo2;

create view vasarol_v as
   select *
     from termek
   natural join vasarol
   natural join felhasznalo;

select *
  from vasarol_v;

truncate table vasarol;

insert into termek values ( 1,
                            'Szek',
                            500 );

insert into termek (
   ar,
   t_id,
   t_nev
) values ( 1000,
           2,
           'Szek' );

insert into termek values ( (
   select max(t_id) + 1
     from termek
),
                            'Asztal',
                            2000 );

select *
  from termek;


insert into felhasznalo values ( 1,
                                 'Peti',
                                 'x' );
insert into felhasznalo values ( 2,
                                 'Dani',
                                 'y' );
insert into felhasznalo values ( 3,
                                 'Niki',
                                 'z' );

select *
  from felhasznalo;

insert into vasarol values ( 1,
                             1,
                             4 );
insert into vasarol values ( 1,
                             3,
                             1 );
select *
  from vasarol_v;

update felhasznalo
   set
   cim = 'z'
 where f_id = 1;

select *
  from felhasznalo;

update termek
   set
   ar = ar * 1.2;

select *
  from termek;

select f_nev
  from felhasznalo
minus
select f_nev
  from felhasznalo
natural join vasarol;

delete from felhasznalo
 where f_nev in (
   select f_nev
     from felhasznalo
   minus
   select f_nev
     from felhasznalo
   natural join vasarol
);

select *
  from felhasznalo;
