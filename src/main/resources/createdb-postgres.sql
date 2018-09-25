-- assumes: Caller is a superuser with create database and user privileges
-- I am unsure how adult professionals organize this sort of thing
-- I am accustomed to following patterns, submitting tickets, and biding time 
--    https://12factor.net/config
-- from current working directory a call might look like
-- export PGPASSWORD="IAmSuperUser!"
-- export DTMPASSWORD="IAmProbablyFME!" 
-- export DTMROPASSWORD="IAmProbablyGeoserver!"
-- psql -h jeffbezos.taxes.us-east-1.rds.amazonaws.com -p 5432 -U bseuser -d bsedb -v v1=$DTMPASSWORD -v v2=$DTMROPASSWORD -f createdb-postgres.sql 
create database dtm; 
create user dtmwrite with password :'v1'; --nutty awk
create user dtmread with password :'v2';
grant all privileges on database dtm to dtmwrite; 
\connect dtm
SELECT
   CASE WHEN count(*) = 1 
   THEN 'creating extension postgis ' || (select default_version from pg_available_extensions where name = 'postgis') 
                                      || ' if not already created'
   ELSE 'MAYDAY: No postgis extension available in pg_available extensions'
   END AS postgis_clue
FROM pg_available_extensions
where name = 'postgis';
create extension if not exists postgis;
-- this is unncessary?
-- will warn about postgis dictionary vies since rdsadmin has pre-faffed them
--grant select on all tables in schema public to dtmread; 
-- schema-postgres.sql will need to grant individual table selects (as necessary)

