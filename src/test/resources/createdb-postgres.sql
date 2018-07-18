-- assumes: Caller is a superuser with createdb priv
-- from current working directory
-- psql -U postgres -d postgres -f createdb-postgres.sql 

drop database if exists dtmtest;
create database dtmtest;  
