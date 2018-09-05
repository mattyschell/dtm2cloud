# For scratch testing of database creation and destruction 
# assumes postgres superuser and no password.  (ie a trust relationship)
# or if we must, password passed in as the only arg
# execute from mingw at the top dtm2cloud directory like
# > ./src/test/resources/postgres-source.sh
superpw=$1
printf "postgres-source.sh is provisioning a dtmtest database and scratch source data"
PGPASSWORD=$superpw psql -U postgres -d postgres -f src/test/resources/createdb-postgres.sql
PGPASSWORD=$superpw psql -U postgres -d dtmtest -f src/test/resources/schema-postgres.sql
PGPASSWORD=$superpw psql -U postgres -d dtmtest -f src/test/resources/data-postgres.sql
# tests tests etc yeah
# caller then probably does:
# psql -U postgres -d postgres -f teardowndb-postgres.sql
printf "exiting from postgres-source.sh"
