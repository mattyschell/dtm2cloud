-- set up Digital Tax Map (target of ETL) database in PostgreSQL
-- first ./test/resources/createdb-postgres.sql then this fella
-- psql -U postgres -d dtmtest -f schema-postgres.sql
-- intended use for now: set up schema (public), populate with test data, 
--                       then tear it all down
-- must add the extension to this database if not already completed
SELECT
   CASE WHEN count(*) = 1 
   THEN 'creating extension postgis ' || (select default_version from pg_available_extensions where name = 'postgis') 
                                      || ' if not installed'
   ELSE 'MAYDAY: No postgis extension available in pg_available extensions'
   END AS postgis_clue
FROM pg_available_extensions
where name = 'postgis';
create extension if not exists postgis;
-- from legacy ETL
-- Source SDE TAX_BLOCK_POLYGON --> target Oracle DTM TAX_BLOCK_POINT, tiled
CREATE TABLE tax_block_point (
    boro VARCHAR(1) NOT NULL, 
	block NUMERIC(10,0) NOT NULL, 
    shape GEOMETRY(point, 2263)); 
CREATE INDEX tax_block_pointshape on tax_block_point using GIST(shape);
-- Source SDE TAX_LOT_POLYGON --> target Oracle SDO TAX_LOT_POINT, tiled
CREATE TABLE tax_lot_point (
    bbl VARCHAR(10) NOT NULL, 
	lot NUMERIC(5,0) NOT NULL, 
	air_rights_flag VARCHAR(1), 
	condo_flag VARCHAR(1), 
	reuc_flag VARCHAR(1), 
	subterranean_flag VARCHAR(1), 
	lot_area NUMERIC(19,1),  --switched column order to put shape at end
    shape GEOMETRY (point, 2263));
CREATE INDEX tax_lot_pointbbl on tax_lot_point (bbl); 
CREATE INDEX tax_lot_pointshape on tax_lot_point using GIST(shape);
-- as currently defined in batch Oracle ETL
-- Source SDE tax_lot_polygon --> target Oracle DTM tax_lot_polygon_sdo
--                            --> target tax_lot_point
-- tax_lot_polygon and tax_lot_polygon_sdo have the same columns
-- tax_lot_polygon_sdo is not used in tiles, but is consumed by Geoserver (subject lots)
-- here I propose its time we ditch the sdo on the target PostGIS db
-- tax_lot_polygon is the target postgis dataset.  Will contain 'unedited' data
-- probably out of scope for the ETL for some time
--CREATE TABLE tax_lot_polygon_sdo (
--    objectid INTEGER PRIMARY KEY, --not serial, we transfer from the source
--    boro VARCHAR(1) NOT NULL,  --unsure why varchar
--    block NUMERIC(10,0) NOT NULL,
--    lot NUMERIC(5,0) NOT NULL,
--    bbl VARCHAR(10),                  -- perhaps this can be made unique
--    community_district NUMERIC(5,0),
--    regular_lot_indicator VARCHAR(1),
--    number_lot_sides NUMERIC(5,0),
--    condo_flag VARCHAR(1), 
--	reuc_flag VARCHAR(1), 
--	air_rights_flag VARCHAR(1), 
--	subterranean_flag VARCHAR(1), 
--	easement_flag VARCHAR(1), 
--	section_number NUMERIC(5,0), 
--	volume_number NUMERIC(5,0), 
--	page_number VARCHAR(15), 
--	lot_note VARCHAR(255), 
--	nycmap_bldg_flag NUMERIC(5,0),  --wat? 
--	missing_rpad_flag NUMERIC(5,0), 
--	conversion_exception_flag NUMERIC(5,0), 
--	value_reflected_out_flag NUMERIC(5,0), 
--	created_by VARCHAR(50),   
--	created_date DATE, 
--	last_modified_by VARCHAR(50), 
--	last_modified_date DATE, 
--	av_change NUMERIC(5,0), 
--	bw_change NUMERIC(5,0), 
--	effective_tax_year VARCHAR(50), 
--	bill_bbl_flag NUMERIC(5,0), 
--	globalid VARCHAR(38) NOT NULL,
--    shape GEOMETRY(geometry, 2263));  --yes, there are a few with multiple outer rings
--CREATE INDEX tax_lot_polygonbbl on tax_lot_polygon (bbl); 
--CREATE INDEX tax_lot_polygonshape on tax_lot_polygon using GIST(shape);




