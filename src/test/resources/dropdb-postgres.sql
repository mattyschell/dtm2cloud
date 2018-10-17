-- assumes: Caller is a superuser with createdb priv
-- from current working directory a call would look like
-- psql -U postgres -d postgres -f createdb-postgres.sql 
drop database if exists dtm;
drop user if exists dtmread;
drop user if exists dtmwrite;
--create database dtm;  
