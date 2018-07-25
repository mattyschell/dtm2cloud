-- first createdb-postgres.sql then this critter
-- psql -U postgres -d dtmtest -f schema-postgres.sql
-- set up Digital Tax map schema in postgres
-- intended use for now: set up schema (public), populate with test data, 
--                       then tear it all down
--
-- must add the extension to this database
-- this will error in specatucularly confusing ways
-- if the environment is not configured as expected
create extension if not exists postgis;
-- as currently defined in batch Oracle ETL
-- Source SDE TAX_BLOCK_POLYGON --> target Oracle DTM TAX_BLOCK
-- They must have different names because they live in the same Oracle schema
-- Target TAX_BLOCK has a subset of columns from source TAX_BLOCK_POLYGON 
-- Consider breaking free and naming our new target TAX_BLOCK_POLYGON also 
CREATE TABLE TAX_BLOCK (
    id INTEGER PRIMARY KEY, 
    boro_block VARCHAR  (6) NOT NULL, 
    boro VARCHAR(1) NOT NULL, 
    block VARCHAR(10) NOT NULL, 
    label VARCHAR(25) NOT NULL, 
    shape GEOMETRY(polygon, 2263)); --continue to store in state plane?  
-- review
-- select * from public.tax_block

