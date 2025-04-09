-- kill session
select *
  from v$session
 where username = 'IO3O4S';
execute kill_session(SID, Serial#);
