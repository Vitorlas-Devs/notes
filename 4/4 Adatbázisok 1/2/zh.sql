-- Melyek azok a gyümölcsök, amelyeket vagy Micimackó szeret, vagy Malacka? (gyumolcs)
select gyumolcs
  from szeret
 where nev = 'Micimackó'
union
select gyumolcs
  from szeret
 where nev = 'Malacka';
