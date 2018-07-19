# this is some low quality work
# from mingw right here in this directory like
# >./postgres.sh
psql -U postgres -d postgres -f resources/createdb-postgres.sql
psql -U postgres -d dtmtest -f resources/schema-postgres.sql
psql -U postgres -d dtmtest -f resources/data-postgres.sql
# tests tests
# caller then probably does:
# psql -U postgres -d postgres -f teardowndb-postgres.sql
