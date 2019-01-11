-- /test/resources/ EZ setup of scratch source schema in PostgreSQL
-- It is scratch because we are using it to dump out shps and import into SDE
-- as defined in legacy ETL:
-- Source SDE TAX_BLOCK_POLYGON --> target Oracle SDO TAX_BLOCK (not tiled)
--                              --> target Oracle SDO TAX_BLOCK_POINT
-- Different names because they lived in the same Oracle schema DOF_TAXMAP
CREATE TABLE tax_block_polygon_scratch (
	 objectid serial primary key
	,boro VARCHAR(1) NOT NULL 
	,block NUMERIC(10,0) NOT NULL 
	,eop_overlap_flag NUMERIC(5,0) 
	,jagged_st_flag NUMERIC(5,0) 
	,created_by VARCHAR(50) 
	,created_date DATE 
	,last_modified_by VARCHAR(50) 
	,last_modified_date DATE 
	,section_number NUMERIC(5,0) NOT NULL 
	,volume_number NUMERIC(5,0) NOT NULL 
	,globalid VARCHAR(38) NOT NULL 
    ,shape GEOMETRY(multipolygon, 2263)); 
CREATE INDEX tax_block_polygon_scratchshape on tax_block_polygon_scratch using GIST(shape);
-- as defined in legacy ETL:
-- Source SDE tax_lot_polygon --> target Oracle SDO tax_lot_polygon_sdo
--                            --> target Oracle SDO tax_lot_point
-- tax_lot_polygon and tax_lot_polygon_sdo have almost identical columns
-- tax_lot_polygon_sdo is not used in tiles, but is consumed by Geoserver (subject lots, I think)
CREATE TABLE tax_lot_polygon_scratch (
     objectid serial primary key
    ,boro VARCHAR(1)
    ,block NUMERIC(10,0) NOT NULL
    ,lot NUMERIC(5,0) NOT NULL
    ,bbl VARCHAR(10)                  -- perhaps this can be made unique
    ,community_district NUMERIC(5,0)
    ,regular_lot_indicator VARCHAR(1)
    ,number_lot_sides NUMERIC(5,0)
    ,condo_flag VARCHAR(1)
	,reuc_flag VARCHAR(1) 
	,air_rights_flag VARCHAR(1)
	,subterranean_flag VARCHAR(1)
	,easement_flag VARCHAR(1)
	,section_number NUMERIC(5,0)
	,volume_number NUMERIC(5,0)
	,page_number VARCHAR(15)
	,lot_note VARCHAR(255)
	,nycmap_bldg_flag NUMERIC(5,0) --wat? 
	,missing_rpad_flag NUMERIC(5,0)
	,conversion_exception_flag NUMERIC(5,0)
	,value_reflected_out_flag NUMERIC(5,0)
	,created_by VARCHAR(50)
	,created_date DATE
	,last_modified_by VARCHAR(50)
	,last_modified_date DATE
	,av_change NUMERIC(5,0)
	,bw_change NUMERIC(5,0)
	,effective_tax_year VARCHAR(50)
	,bill_bbl_flag NUMERIC(5,0)
	,globalid VARCHAR(38) NOT NULL
    ,shape GEOMETRY(multipolygon, 2263));  --yes, there are a few with multiple outer rings
CREATE INDEX tax_lot_polygon_scratchshape on tax_lot_polygon_scratch using GIST(shape);
-- as defined in legacy ETL:
-- Source SDE tax_lot_face --> consumed directly by Geowebcache
--                         --> target Oracle SDO lot_face_point
-- lot_face_point labels the lines that form the boundaries of tax lots with their length (and more?)
CREATE TABLE tax_lot_face_scratch (
     objectid serial primary key
    ,tax_lot_face_type NUMERIC(5,0)
    ,boro VARCHAR(1) NOT NULL
    ,block NUMERIC(10,0) NOT NULL
    ,lot NUMERIC(5,0) NOT NULL
    ,bbl VARCHAR(10)
    ,lot_face_length NUMERIC
    ,source NUMERIC(5,0)
    ,block_face_flag NUMERIC(5,0)
    ,lot_face_length_error NUMERIC(5,0)
	,created_by VARCHAR(50)
	,created_date DATE
	,last_modified_by VARCHAR(50)
	,last_modified_date DATE
	,av_change NUMERIC(5,0)
	,bw_change NUMERIC(5,0)
    ,approx_length_flag NUMERIC(5,0)
	,globalid VARCHAR(38) NOT NULL
    ,shape GEOMETRY(multilinestring, 2263));  
CREATE INDEX tax_lot_face_scratchshape on tax_lot_face_scratch using GIST(shape);
-- Next section: phony setup for test drives
-- In reality v_boro_block_changes is a view to various Digital Alteration Book
--  (DAB) tracking tables.  But we will create a real table and put fake 
--  data in v_boro_block_changes to trigger ETL activity on each block in our
--  test fixtures
-- I considered adding each dab_* table, this alternative phony approach 
--   may be a poorly-conceived shortcut
CREATE TABLE v_boro_block_changes_scratch (
     boro_block VARCHAR(24)
    ,change_date DATE
    ,shape GEOMETRY(multipolygon, 2263)); -- joined in view to tax_block shape
CREATE INDEX v_boro_block_changes_scratchshape on v_boro_block_changes_scratch using GIST(shape);
grant select on v_boro_block_changes_scratch to dtmread;
    






