# For scratch testing of database creation and destruction 
# we assume a standard out-of-the-box postgres local install
# with postgres superuser and no password.  (ie a trust relationship)
# or if we must, password passed in as an environmental
# execute from mingw at the top dtm2cloud directory like
# > ./src/test/resources/postgres.sh
superpw=$1
PGPASSWORD=$superpw psql -U postgres -d postgres -f src/test/resources/createdb-postgres.sql
PGPASSWORD=$superpw psql -U postgres -d dtmtest -f src/main/resources/schema-postgres.sql
PGPASSWORD=$superpw psql -U postgres -d dtmtest -f src/main/resources/data-postgres.sql
# tests tests
# caller then probably does:
# psql -U postgres -d postgres -f teardowndb-postgres.sql
printf "exiting from postgres.sh"
