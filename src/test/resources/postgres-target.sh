# "unedited" PostgreSQL target schema and data
printf "postgres-target.sh is provisioning the target schema and data"
# /src/main not src/test - this is the real schema for the new DTM
psql -h localhost -U dtmwrite -d dtm -f src/main/resources/schema-postgres.sql
psql -h localhost -U dtmwrite -d dtm -f src/main/resources/data-postgres.sql
printf "exiting from postgres-target.sh"
