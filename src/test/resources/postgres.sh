# this is some low quality work
# assumes a standard out-of-the-box postgres local install
# with postgres superuser and no password
# execute from mingw at the top dtm2cloud directory like
# > ./src/test/resources/postgres.sh
psql -U postgres -d postgres -f src/test/resources/createdb-postgres.sql
psql -U postgres -d dtmtest -f src/main/resources/schema-postgres.sql
psql -U postgres -d dtmtest -f src/main/resources/data-postgres.sql
# tests tests
# caller then probably does:
# psql -U postgres -d postgres -f teardowndb-postgres.sql
echo "exiting from postgres.sh"
