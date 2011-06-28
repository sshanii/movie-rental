create user movierental identified by movierental;
grant create session to movierental;
grant create table to movierental;
grant create view to movierental;
grant create procedure to movierental;
grant create sequence to movierental;
/*CREATE OR REPLACE directory PLSHPROF_DIR as '/tmp/Oraprofiles';
grant READ, WRITE on directory PLSHPROF_DIR to movierental;*/
--grant execute on DBMS_HPROF to movierental;
--grant execute on ACTIONS to movierental;
grant unlimited tablespace to movierental;
/