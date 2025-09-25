select e.dnev
  from dolgozo e,
       dolgozo b
 where e.fonoke = b.dkod
   and b.dnev = 'KING';
