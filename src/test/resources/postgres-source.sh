# For scratch testing of database creation and destruction 
# assumes postgres superuser and externalized password
# execute from mingw at the top dtm2cloud directory like
# > ./src/test/resources/postgres-source.sh
printf "postgres-source.sh is provisioning a dtm database, dtmwrite and dtmread users, and scratch source data"
# Caution: this one under /test/resources will drop a dtm database and users
psql -h localhost -U postgres -d postgres -f src/test/resources/dropdb-postgres.sql
# this is the standard create database, users, etc
export DTMPASSWORD=PostgisIsMyDataBae!
export DTMROPASSWORD=PostgisIsMyDataBae!
psql -h localhost -U postgres -d postgres -v v1=$DTMPASSWORD -v v2=$DTMROPASSWORD -f src/main/resources/createdb-postgres.sql 
OGPGPASSWORD=$PGPASSWORD
export PGPASSWORD=PostgisIsMyDataBae!
psql -h localhost -U dtmwrite -d dtm -f src/test/resources/schema-postgres.sql
psql -h localhost -U dtmwrite -d dtm -f src/test/resources/data-postgres.sql
# be polite, reset user special password
export PGPASSWORD=$OGPGPASSWORD
printf "exiting from postgres-source.sh"

