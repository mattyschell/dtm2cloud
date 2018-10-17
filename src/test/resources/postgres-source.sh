# For scratch testing of database creation and destruction 
# assumes postgres superuser and no password.  (ie a trust relationship)
# or if we must, password passed in as the only arg
# execute from mingw at the top dtm2cloud directory like
# > ./src/test/resources/postgres-source.sh
superpw=$1
printf "postgres-source.sh is provisioning a dtm database, dtmwrite and dtmread users, and scratch source data"
# Caution: this one under /test/resources will drop a dtm database and users
PGPASSWORD=$superpw psql -h localhost -U postgres -d postgres -f src/test/resources/dropdb-postgres.sql
# this is the standard create database, users, etc
export DTMPASSWORD=
export DTMROPASSWORD=
PGPASSWORD=$superpw psql -h localhost -U postgres -d postgres -v v1=$DTMPASSWORD -v v2=$DTMROPASSWORD -f src/main/resources/createdb-postgres.sql 
psql -h localhost -U dtmwrite -d dtm -f src/test/resources/schema-postgres.sql
psql -h localhost -U dtmwrite -d dtm -f src/test/resources/data-postgres.sql
printf "exiting from postgres-source.sh"
