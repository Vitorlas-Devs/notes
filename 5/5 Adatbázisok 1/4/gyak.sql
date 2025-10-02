select *
  from (
   select nev
     from szeret
),
       (
          select gyumolcs
            from szeret
       )
minus
select *
  from szeret;

select nev
  from (
   select *
     from (
      select nev
        from szeret
   ),
          (
             select gyumolcs
               from szeret
          )
   minus
   select *
     from szeret
);

-- 1. kik szeretnek minden gy-t?
select nev
  from szeret
minus
(
   select nev
     from (
      select *
        from (
         select nev
           from szeret
      ),
             (
                select gyumolcs
                  from szeret
             )
      minus
      select *
        from szeret
   )
);

-- 2. Kik azok, akik legalább azokat a gyümölcsöket szeretik, mint Micimackó?
select nev
  from szeret
minus
select nev
  from (
   select *
     from (
      select nev
        from szeret
   ),
          (
             select gyumolcs
               from szeret
              where nev = 'Micimackó'
          )
   minus
   select *
     from szeret
); 

-- 3. Kik azok, akik legfeljebb azokat a gyümölcsöket szeretik, mint Micimackó?
select nev
  from szeret
minus
select nev
  from (
   select *
     from szeret
   minus
   select *
     from (
      select nev
        from szeret
   ),
          (
             select gyumolcs
               from szeret
              where nev = 'Micimackó'
          )
); 

-- 4. Kik azok, akik pontosan azokat a gyümölcsöket szeretik, mint Micimackó?
select nev
  from szeret
minus
select nev
  from (
   select *
     from szeret
   minus
   select *
     from (
      select nev
        from szeret
   ),
          (
             select gyumolcs
               from szeret
              where nev = 'Micimackó'
          )
)
intersect
select nev
  from szeret
minus
select nev
  from (
   select *
     from (
      select nev
        from szeret
   ),
          (
             select gyumolcs
               from szeret
              where nev = 'Micimackó'
          )
   minus
   select *
     from szeret
);

-- JOINS
select *
  from dolgozo d
  join osztaly o
on d.oazon = o.oazon;

select *
  from dolgozo
natural join osztaly;

-- 
select *
  from dolgozo
natural join osztaly
 where telephely = 'NEW YORK';

-- kik keresnek több pénzt a főnöküknél
select *
  from dolgozo d
  join dolgozo b
on d.fonoke = b.dkod
 where d.fizetes > b.fizetes;

-- legnagyobb fizetésű dolgozó
select *
  from dolgozo a,
       dolgozo b
 where b.fizetes < a.fizetes;
