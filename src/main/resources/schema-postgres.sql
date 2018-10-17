-- set up Digital Tax Map database in PostgreSQL
-- first
--    ./src/main/resources/createdb-postgres.sql
-- then this fella, test-style
--    psql -h localhost -U dtmwrite -d dtm -f src/test/resources/schema-postgres.sql
-- or real deal-style
--   export PGPASSWORD="IAmDtmWriter!"
--   psql -h jeffbezos.taxes.us-east-1.rds.amazonaws.com -p 5432 -U dtmwrite -d dtm -f src/test/resources/schema-postgres.sql
SELECT
   CASE WHEN count(*) = 1 
   THEN 'creating extension postgis ' || (select default_version from pg_available_extensions where name = 'postgis') 
                                      || ' if not already created'
   ELSE 'MAYDAY: No postgis extension available in pg_available extensions'
   END AS postgis_clue
FROM pg_available_extensions
where name = 'postgis';
create extension if not exists postgis;
-- tax_block_polygon: In the legacy system this is an SDE dataset, actively edited
CREATE TABLE tax_block_polygon (
	objectid serial primary key,
	boro VARCHAR(1) NOT NULL, 
	block NUMERIC(10,0) NOT NULL, 
	eop_overlap_flag NUMERIC(5,0), 
	jagged_st_flag NUMERIC(5,0), 
	created_by VARCHAR(50), 
	created_date DATE, 
	last_modified_by VARCHAR(50), 
	last_modified_date DATE, 
	section_number NUMERIC(5,0) NOT NULL, 
	volume_number NUMERIC(5,0) NOT NULL, 
	globalid VARCHAR(38) NOT NULL, 
    shape GEOMETRY(polygon, 2263)); 
CREATE INDEX tax_block_polygonshape on tax_block_polygon using GIST(shape);
grant select on tax_block_polygon to dtmread;
-- from legacy ETL
-- Source SDE TAX_BLOCK_POLYGON (above) --> target Oracle DTM TAX_BLOCK_POINT, tiled
CREATE TABLE tax_block_point (
    boro VARCHAR(1) NOT NULL, 
	block NUMERIC(10,0) NOT NULL, 
    shape GEOMETRY(point, 2263)); 
CREATE INDEX tax_block_pointshape on tax_block_point using GIST(shape);
grant select on tax_block_point to dtmread;
-- Tax Lots in the legacy system:
-- Source SDE tax_lot_polygon --> target Oracle DTM tax_lot_polygon_sdo (we are renaming it)
--                            --> target tax_lot_point
-- tax_lot_polygon and tax_lot_polygon_sdo have the same columns
-- tax_lot_polygon (formerly tax_lot_polygon_sdo) is not used in tiles, 
--   but is consumed by Geoserver (subject lots)
-- bbls in tax_lot_polygon are unique.  A few (~70) multipolygons exist
--    For tax_lot_point we explode mutipolygons into separate, non-unique bbl records
CREATE TABLE tax_lot_polygon (
    objectid serial primary key, 
    boro VARCHAR(1) NOT NULL,  --unsure why varchar
    block NUMERIC(10,0) NOT NULL,
    lot NUMERIC(5,0) NOT NULL,
    bbl VARCHAR(10),                  
    community_district NUMERIC(5,0),
    regular_lot_indicator VARCHAR(1),
    number_lot_sides NUMERIC(5,0),
    condo_flag VARCHAR(1), 
	reuc_flag VARCHAR(1), 
	air_rights_flag VARCHAR(1), 
	subterranean_flag VARCHAR(1), 
	easement_flag VARCHAR(1), 
	section_number NUMERIC(5,0), 
	volume_number NUMERIC(5,0), 
	page_number VARCHAR(15), 
	lot_note VARCHAR(255), 
	nycmap_bldg_flag NUMERIC(5,0),  --wat? 
	missing_rpad_flag NUMERIC(5,0), 
	conversion_exception_flag NUMERIC(5,0), 
	value_reflected_out_flag NUMERIC(5,0), 
	created_by VARCHAR(50),   
	created_date DATE, 
	last_modified_by VARCHAR(50), 
	last_modified_date DATE, 
	av_change NUMERIC(5,0), 
	bw_change NUMERIC(5,0), 
	effective_tax_year VARCHAR(50), 
	bill_bbl_flag NUMERIC(5,0), 
	globalid VARCHAR(38) NOT NULL,
    shape GEOMETRY(geometry, 2263));  --yes, there are a few with multiple outer rings
CREATE UNIQUE INDEX tax_lot_polygonbbl on tax_lot_polygon (bbl); 
CREATE INDEX tax_lot_polygonshape on tax_lot_polygon using GIST(shape);
grant select on tax_lot_polygon to dtmread;
-- Source SDE TAX_LOT_POLYGON --> target Oracle SDO TAX_LOT_POINT, tiled
--   Duplicate bbls exist (~70) for multipolygon tax_lot_polygon records
--   Each separate piece (usually across the street from each other)
--   Gets a separate point and label  
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
grant select on tax_lot_point to dtmread;
-- lot_face_point: Created by ETL from tax_lot_face
CREATE TABLE lot_face_point (
    tax_lot_face_type NUMERIC,
    bbl VARCHAR(10),
    length NUMERIC(38,8), -- 0.0000 to 9999.9999?
    approx_length_flag NUMERIC,
    angle NUMERIC(38,8),
    delta_x NUMERIC(38,8),
    delta_y NUMERIC(38,8),
    boro VARCHAR(1),
    block NUMERIC(10,0),
    lot NUMERIC(5,0),
    shape GEOMETRY (point,2263));
CREATE INDEX lot_face_pointbbl on lot_face_point (bbl); 
CREATE INDEX lot_face_pointshape on tax_lot_point using GIST(shape);
grant select on lot_face_point to dtmread;
-- air_label: adds labels to v_tax_lot_point
CREATE TABLE air_label (
    bbl VARCHAR(10) NOT NULL,
    label VARCHAR(200) NOT NULL,
    count NUMERIC NOT NULL
);
CREATE INDEX air_labelbbl on air_label (bbl); 
-- no grant, dtmread does not need to see air_label
-- condo_label: adds labels to v_tax_lot_point
CREATE TABLE condo_label (
    bbl VARCHAR(10) NOT NULL,
    label VARCHAR(200) NOT NULL,
    count NUMERIC NOT NULL
);
CREATE INDEX condo_labelbbl on condo_label (bbl); 
-- no grant, dtmread does not need to see condo_label
-- sub_label: adds labels to v_tax_lot_point
CREATE TABLE sub_label (
    bbl VARCHAR(10) NOT NULL,
    label VARCHAR(200) NOT NULL,
    count NUMERIC NOT NULL
);
CREATE INDEX sub_labelbbl on sub_label (bbl); 
-- no grant, dtmread does not need to see sub_label
-- reuc_lots (SDE name REUC_Lots): not spatial, SDE-registered and versioned 
-- filtered by v_reuc_lot (singular) then, I dunno maybe thats all
CREATE TABLE reuc_lots (
    objectid serial primary key,
    appurtenant_boro VARCHAR(1) NOT NULL,
    appurtenant_block NUMERIC(10,0) NOT NULL,
    appurtenant_lot NUMERIC(5,0) NOT NULL,
    appurtenant_bbl VARCHAR(10),
    reuc_number VARCHAR(20),
    deleted_flag NUMERIC(5,0),
    created_by VARCHAR(50),
    created_date DATE,
    last_modified_by VARCHAR(50),
    last_modified_date DATE,
    av_change NUMERIC(5,0),
    bw_change NUMERIC(5,0),
    effective_tax_year VARCHAR(50),
    globalid VARCHAR(38) NOT NULL
);
CREATE INDEX reuc_lotsappurtenant_bbl on reuc_lots (appurtenant_bbl); 
-- no grant, dtmread does not need to see reuc_lots
-- boundary: spatial lines, edited by Dept of Finance, 
-- consumed directly in legacy Digital Tax Map
-- will be ETL'd to target in new system
CREATE TABLE boundary (
    objectid serial primary key,
    boundary_type NUMERIC(5,0) NOT NULL,
    type NUMERIC(5,0),
    id_number VARCHAR(50),
    description VARCHAR(50),
    length NUMERIC(38,8),
    modifier NUMERIC(5,0),
    created_by VARCHAR(50),
    created_date DATE,
    last_modified_by VARCHAR(50),
    last_modified_date DATE,
    effective_tax_year VARCHAR(50),
    globalid VARCHAR(38) NOT NULL,
    shape GEOMETRY (linestring,2263));
CREATE INDEX boundaryshape on boundary using GIST(shape);
grant select on boundary to dtmread;
-- condo_units: edited by Dept of Finance, 
-- consumed directly in legacy Digital Tax Map
-- will be ETL'd to target in new system
CREATE TABLE condo_units (	
    objectid serial primary key,
	condo_boro VARCHAR(1) NOT NULL, 
	condo_number NUMERIC(5,0) NOT NULL, 
	condo_key NUMERIC(10,0), 
	condo_base_boro VARCHAR(1), 
	condo_base_block NUMERIC(10,0), 
	condo_base_lot NUMERIC(5,0), 
	condo_base_bbl VARCHAR(10), 
	condo_base_bbl_key VARCHAR(15), 
	unit_boro VARCHAR(1) NOT NULL, 
	unit_block NUMERIC(10,0) NOT NULL, 
	unit_lot NUMERIC(5,0) NOT NULL, 
	unit_bbl VARCHAR(10), 
	created_by VARCHAR(50), 
	created_date DATE, 
	last_modified_by VARCHAR(50), 
	last_modified_date DATE, 
	av_change NUMERIC(5,0), 
	bw_change NUMERIC(5,0), 
	effective_tax_year VARCHAR(50), 
	unit_designation VARCHAR(10), 
	globalid VARCHAR(38) NOT NULL);
CREATE INDEX condo_unitscondo_base_bbl_key on condo_units (condo_base_bbl_key); 
CREATE INDEX condo_unitscondo_base_bbl on condo_units (condo_base_bbl); 
CREATE INDEX condo_unitscondo_key on condo_units (condo_key); 
grant select on condo_units to dtmread;
-- lot_face_possession_hooks: spatial points, edited by Dept of Finance, 
-- consumed directly in legacy Digital Tax Map
-- will be ETL'd to target in new system
CREATE TABLE lot_face_possession_hooks (
    objectid serial primary key,
	lot_face_possession_hook_type NUMERIC(5,0), 
	rotation NUMERIC(38,8) NOT NULL , 
	created_by VARCHAR(50), 
	created_date DATE, 
	last_modified_by VARCHAR(50), 
	last_modified_date DATE, 
	globalid VARCHAR(38) NOT NULL, 
	shape GEOMETRY (point,2263));
CREATE INDEX lot_face_possession_hooksshape on lot_face_possession_hooks using GIST(shape);
grant select on lot_face_possession_hooks to dtmread;
-- misc_text: spatial points, edited by Dept of Finance, 
-- consumed directly in legacy Digital Tax Map
-- will be ETL'd to target in new system
CREATE TABLE misc_text (
    objectid serial primary key,
	misc_text VARCHAR(250), 
	rotation NUMERIC(38,8),    -- can be null, unlike lot_face_possession_hooks rotation?
	globalid VARCHAR(38) NOT NULL, 
	shape GEOMETRY (point,2263));
CREATE INDEX misc_textshape on misc_text using GIST(shape);
grant select on misc_text to dtmread;
-- possession_hooks: spatial points, edited by Dept of Finance, 
-- consumed directly in legacy Digital Tax Map
-- will be ETL'd to target in new system
CREATE TABLE possession_hooks (
    objectid serial primary key,
	hook_type NUMERIC(5,0), 
	rotation NUMERIC(38,8) NOT NULL, 
	created_by VARCHAR(50), 
	created_date DATE, 
	last_modified_by VARCHAR(50), 
	last_modified_date DATE, 
	globalid VARCHAR(38) NOT NULL, 
	shape GEOMETRY (point,2263));
CREATE INDEX possession_hooksshape on possession_hooks using GIST(shape);
grant select on possession_hooks to dtmread;
-- tax_lot_face: spatial lines, edited by Dept of Finance, 
-- consumed directly in legacy Digital Tax Map
-- will be ETL'd to target in new system
CREATE TABLE tax_lot_face (
    objectid serial primary key,
	tax_lot_face_type NUMERIC(5,0), 
	boro VARCHAR(1) NOT NULL, 
	block NUMERIC(10,0) NOT NULL, 
	lot NUMERIC(5,0) NOT NULL, 
	bbl NUMERIC(10), 
	lot_face_length NUMERIC(38,8), 
	source NUMERIC(5,0), 
	block_face_flag NUMERIC(5,0), 
	lot_face_length_error NUMERIC(5,0), 
	created_by VARCHAR(50), 
	created_date DATE, 
	last_modified_by VARCHAR(50), 
	last_modified_date DATE, 
	av_change NUMERIC(5,0), 
	bw_change NUMERIC(5,0), 
	approx_length_flag NUMERIC(5,0) NOT NULL, 
	globalid VARCHAR(38) NOT NULL, 
	shape GEOMETRY (linestring,2263));
CREATE INDEX tax_lot_facebbl on tax_lot_face (bbl); 
CREATE INDEX tax_lot_faceshape on tax_lot_face using GIST(shape);
grant select on tax_lot_face to dtmread;
-- a view, a nice integration check candidate
-- sample data from legacy database.  I do not think that other_label is supposed to look like this
--
--      BBL        |LOT |CONDO_FLAG |ALL_FLAGS |OTHER_LABEL         |LABEL_COUNT    
--      -----------|----|-----------|----------|--------------------|------------
--      1001970011 |11  |C          |ACR       |R      ¶A9011¶C2014 |3
--      1004020039 |39  |           |          |                    |0 
--      1004050037 |37  |C          |C         |       ¶C1092       |1
--      1012800010 |10  |           |AR        |R      ¶A9010       |2
--      1013300013 |13  |           |A         |      ¶A9013¶A9014¶A9015 |3
--      3001570009 |9   |           |ARS       |R      ¶A9009¶S8009 |3
--      3032380005 |5   |C          |CR        |R      ¶C1486       |2
--
-- My stated english spec for other_label
--    No white space at the beginning or end of other_label
--    Each on its own line:
--    If Reuc lot, start string with R and 6 spaces 
--    If air labels, condo labels, or sub labels exist, on a new line add that label
--    If none of the above, null
-- The new postgres view below produces:
--
--      bbl        |lot |condo_flag |all_flags |other_label         |label_count 
--      -----------|----|-----------|----------|--------------------|------------
--      1001970011 |11  |C          |ACR       |R      ¶A9011¶C2014 |3           
--      1004020039 |39  |           |          |                    |0           
--      1004050037 |37  |C          |C         |C1092               |1           
--      1012800010 |10  |           |AR        |R      ¶A9010       |2     
--      1013300013 |13  |           |A         |A9013¶A9014¶A9015   |3              
--      3001570009 |9   |           |ARS       |R      ¶A9009¶S8009 |3           
--      3032380005 |5   |C          |CR        |R      ¶C1486       |2  
--
-- A helpful visual aid
-- select l.bbl, l.air_rights_flag, l.condo_flag, l.reuc_flag, a.*, c.*, s.*
-- FROM tax_lot_point l
--   LEFT JOIN air_label a ON l.bbl = a.bbl
--   LEFT JOIN condo_label c ON l.bbl = c.bbl
--   LEFT JOIN sub_label s ON l.bbl = s.bbl
-- where l.bbl IN 
-- ('1001970011','1004020039','1012800010','3001570009','3032380005','1004050037','1013300013')
-- order by 1
--
-- Reminder: NULL || A = NULL, as is NULL + 1.  That's why coalesce to empty strings or 0s
CREATE OR REPLACE VIEW v_tax_lot_point
( bbl, lot, condo_flag, all_flags, other_label, label_count, area, shape )
AS 
SELECT  l.bbl 
       ,l.lot 
       ,l.condo_flag::varchar(1) as condo_flag 
       ,COALESCE(l.air_rights_flag, '') || COALESCE(l.condo_flag, '') || COALESCE(l.reuc_flag, '') || COALESCE(l.subterranean_flag, '')::varchar(4) as all_flags 
       ,regexp_replace(
                       regexp_replace( COALESCE(l.reuc_flag, ' ') || '      '  --other_label reuc flag: R then spaces
                                       ||
                                       CASE WHEN a.bbl IS NOT NULL    --other_label air label
                                       THEN
                                           CHR(10) || a.label 
                                       ELSE
                                           ''
                                       END     
                                       ||
                                       CASE WHEN c.bbl IS NOT NULL    --other_label condo label
                                       THEN
                                           CHR(10) || c.label 
                                       ELSE
                                          ''                
                                       END       
                                       ||
                                       CASE WHEN s.bbl IS NOT NULL     --other_label sub label
                                       THEN
                                           CHR(10) || s.label 
                                       ELSE
                                          ''
                                       END    
                                    ,'^\s+', '')                       --other_label replace leading white space
                       ,'\s+$', '')::text AS other_label               --other_label replace trailing white space. THE END
       ,COALESCE(a.count, 0) + COALESCE(c.count, 0) + COALESCE(s.count, 0) + COALESCE(length(l.reuc_flag), 0)::numeric AS label_count 
       ,l.lot_area
       ,l.shape
   FROM tax_lot_point l
   LEFT JOIN air_label a ON l.bbl = a.bbl
   LEFT JOIN condo_label c ON l.bbl = c.bbl
   LEFT JOIN sub_label s ON l.bbl = s.bbl;
grant select on v_tax_lot_point to dtmread;
