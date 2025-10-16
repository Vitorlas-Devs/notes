select dnev
  from dolgozo
 where belepes > to_date('1982.01.01','YYYY.MM.DD')
 order by belepes asc;
