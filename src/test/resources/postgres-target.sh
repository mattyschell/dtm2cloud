# "unedited" PostgreSQL target schema and data
superpw=$1
printf "postgres-target.sh is provisioning the target schema and data"
# /src/main not src/test - this is the real schema for the new DTM
PGPASSWORD=$superpw psql -U postgres -d dtmtest -f src/main/resources/schema-postgres.sql
PGPASSWORD=$superpw psql -U postgres -d dtmtest -f src/main/resources/data-postgres.sql
# tests tests etc yeah
# caller then probably does:
# psql -U postgres -d postgres -f teardowndb-postgres.sql
printf "exiting from postgres-target.sh"
