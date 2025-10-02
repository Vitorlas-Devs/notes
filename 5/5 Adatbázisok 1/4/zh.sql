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
