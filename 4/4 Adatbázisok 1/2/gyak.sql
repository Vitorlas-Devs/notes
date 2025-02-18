-- 1. Melyek azok a gyümölcsök, amelyeket Micimackó szeret?
select gyumolcs
  from szeret
 where nev = 'Micimackó';

-- 2. Melyek azok a gyümölcsök, amelyeket Micimackó nem szeret? (de valaki más igen)
select gyumolcs
  from szeret
minus
select gyumolcs
  from szeret
 where nev = 'Micimackó';

-- 3. Kik szeretik az almát?
select nev
  from szeret
 where gyumolcs = 'alma';

-- 6. Kik szeretik az almát is és a körtét is?
select nev
  from szeret
 where gyumolcs = 'alma'
intersect
select nev
  from szeret
 where gyumolcs = 'körte';

-- 7. Kik azok, akik szeretik az almát, de nem szeretik a körtét?
select nev
  from szeret
 where gyumolcs = 'alma'
minus
select nev
  from szeret
 where gyumolcs = 'körte';
