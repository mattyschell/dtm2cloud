--This is the "unedited" data on target postgres
--
--------------------------------------------------------
-- TEMPLATE
-- <boro> block XX unedited data
-- Description: This block is very special to me and test-driven development...
---------------------------------------------------------
-- <boro> block XX tax_block_polygon (usually can copy from \test\resources\data-postgres.sql)
-- <boro> block XX tax_block_point (see messql at the top of this file)
-- <boro> block XX tax_lot_polygon (see messql most likely)
-- <boro> block XX tax_lot_point (see messsql)
-- <boro> block XX tax_lot_face
-- <boro> block XX lot_face_point
--
--select 'insert into tax_block_point 
--(boro, block, shape)
--values 
--(''' || boro || ''',' || block || ','|| 'ST_GeomFromText(''POINT (' || a.shape.sdo_point.x || ' ' || a.shape.sdo_point.y || ')'',2263));'
--from 
--TAX_BLOCK_POINT a
--where boro = X and block = YYYY
--
-- probably copied a chunk into dof_dtm...
--  select 'insert into tax_lot_polygon
--( boro, block, lot, bbl, community_district, regular_lot_indicator, number_lot_sides, condo_flag, reuc_flag,
-- air_rights_flag, subterranean_flag, easement_flag, section_number, volume_number, page_number, lot_note,  
-- nycmap_bldg_flag, missing_rpad_flag, conversion_exception_flag, value_reflected_out_flag, created_by,
-- created_date, last_modified_by, last_modified_date, av_change, bw_change, effective_tax_year, bill_bbl_flag,
-- globalid, shape) values (' || objectid || ',''' || boro || ''',' || block || ',' || lot || ',''' 
--   || bbl || ''',NULL,''' || regular_lot_indicator || ''',' || NUMBER_LOT_SIDES 
--   || ',''' || condo_flag || ''',''' || reuc_flag || ''',''' || air_rights_flag || ''',''' || SUBTERRANEAN_FLAG 
--   || ''',''' || EASEMENT_FLAG || ''',' || section_number || ',' || volume_number || ',' || page_number 
--   || ',''' || lot_note || ''',''' || NYCMAP_BLDG_FLAG || ''',''' || MISSING_RPAD_FLAG 
--   || ''',NULL,NULL,NULL,NULL,''' || LAST_MODIFIED_BY || ''',NULL,0,0,NULL,0,''' || GLOBALID || ''','
--   || 'ST_GeomFromText(''' || SDO_UTIL.TO_WKTGEOMETRY(shape) || ''',2263));'
--   from TAX_LOT_POLYGON_TMPSDO
--  where block = XXXX 
--  and boro = Y
--
-- select 'insert into tax_lot_point
--(bbl,lot,air_rights_flag,condo_flag,reuc_flag,subterranean_flag,lot_area,shape)
--values (''' || bbl || ''',' || lot || ',NULL,NULL,NULL,NULL,' || lot_area || ',' || 'ST_GeomFromText(''' || mdsys.SDO_UTIL.TO_WKTGEOMETRY(shape) || ''',2263));'
--from 
--dof_taxmap.TAX_LOT_POINT
--where bbl like 'XXXXXX%'
--order by bbl
--
--import arcpy
--wherec =  "boro='2' and block = 2386"
--src = "C:/matt_projects/database_utils/arcgisconnections/dof_taxmap@geocdev (dof_taxmap).sde/DOF_TAXMAP.Cadastral/DOF_TAXMAP.Tax_Lot_Face"
--tgt = "C:/matt_projects/database_utils/arcgisconnections/dof_dtm@geocdev.sde"
--arcpy.Delete_management(tgt + "/TAX_LOT_FACE_SCRATCH")
--arcpy.FeatureClassToFeatureClass_conversion(src,tgt,'TAX_LOT_FACE_SCRATCH',wherec,config_keyword='SDO_GEOMETRY')
--
-- select 'insert into tax_lot_face
--   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
--    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
--    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
--   values '
--   || '(' || tax_lot_face_type || ',''' || boro || ''',' || block || ',' || lot || ','''
--   || bbl || ''',' || lot_face_length || ',' || source || ',' || block_face_flag || ','
--   || lot_face_length_error || ',NULL,NULL,NULL,NULL,' 
--   || CASE WHEN av_change IS NOT NULL THEN TO_CHAR(av_change) ELSE 'NULL' END || ','
--   || CASE WHEN bw_change IS NOT NULL THEN TO_CHAR(bw_change) ELSE 'NULL' END || ','
--   || approx_length_flag || ',''' || globalid || ''','
--   || 'ST_GeomFromText(''' || mdsys.SDO_UTIL.TO_WKTGEOMETRY(shape) || ''',2263));'
-- from TAX_LOT_FACE_SCRATCH
-- where boro = 2 and block = 2541
--
begin;
---------------------------------------
-- brooklyn block 2386 unedited data
-- an archetypal merge in the edited data
-- on August 22 2018 lots 12 and 14 (3023860012,3023860014)
-- merged into 7 (3023860007)
---------------------------------------
-- brooklyn block 2386 tax_block_polygon 
insert into tax_block_polygon
( boro, block, eop_overlap_flag, jagged_st_flag, created_by, created_date, last_modified_by, last_modified_date, section_number, volume_number, globalid, shape)
values 
('3',2386,0,0,NULL,NULL,'LTP',NULL,8,5,'{CB124D70-A02D-47FE-9EFA-3CC76A04F08C}',
ST_GeomFromText('POLYGON ((997273.095094979 198597.187394217, 997317.713591024 198689.552194312, 997274.004918978 198710.47891432, 997226.337718934 198733.30080235, 997137.007542864 198776.070210382, 997045.673910767 198819.79859443, 997021.915062755 198770.338114381, 997010.855094746 198747.313474357, 997001.063862726 198726.930498347, 996956.838582695 198634.863426253, 996979.966134712 198623.825986251, 996997.543094725 198615.437634245, 997014.06175074 198607.554370224, 997031.197110757 198599.376450226, 997048.229558781 198591.248194218, 997070.242742792 198580.742466211, 997093.108662814 198569.829954192, 997116.568246841 198558.634306192, 997137.613494858 198548.590658173, 997165.057462886 198535.493442163, 997228.635318935 198505.151298136, 997273.095094979 198597.187394217))',2263)
);
-- brooklyn block 2386 tax_block_point
insert into tax_block_point 
(boro, block, shape)
values 
('3', 2386, ST_GeomFromText('POINT (997137.184843644 198662.384221137)',2263));
-- brooklyn block 2386 tax_lot_polygon 
insert into tax_lot_polygon
( boro, block, lot, bbl, community_district, regular_lot_indicator, number_lot_sides, condo_flag, reuc_flag,
 air_rights_flag, subterranean_flag, easement_flag, section_number, volume_number, page_number, lot_note,  
 nycmap_bldg_flag, missing_rpad_flag, conversion_exception_flag, value_reflected_out_flag, created_by,
 created_date, last_modified_by, last_modified_date, av_change, bw_change, effective_tax_year, bill_bbl_flag,
 globalid, shape) values ('3',2386,1,'3023860001',NULL,'I',0,'','','','','',8,5,7,'','1','0',NULL,NULL,NULL,NULL,'sj',NULL,0,0,NULL,0,'{DDFD27FA-929B-4EF8-998D-4108FA08343A}',ST_GeomFromText('POLYGON ((997069.975478798 198694.043458313, 997001.063862726 198726.930498347, 996956.838582695 198634.863426253, 996979.966134712 198623.825986251, 997015.759542748 198698.339650318, 997033.336502761 198689.951298311, 997049.854902774 198682.068034306, 997061.543606788 198676.489794299, 997069.975478798 198694.043458313))',2263));
insert into tax_lot_polygon
( boro, block, lot, bbl, community_district, regular_lot_indicator, number_lot_sides, condo_flag, reuc_flag,
 air_rights_flag, subterranean_flag, easement_flag, section_number, volume_number, page_number, lot_note,  
 nycmap_bldg_flag, missing_rpad_flag, conversion_exception_flag, value_reflected_out_flag, created_by,
 created_date, last_modified_by, last_modified_date, av_change, bw_change, effective_tax_year, bill_bbl_flag,
 globalid, shape) values ('3',2386,2,'3023860002',NULL,'',0,'','','','','',8,5,7,'','0','0',NULL,NULL,NULL,NULL,'sj',NULL,0,0,NULL,0,'{58B90857-67FC-4D1C-AF46-4C2B880EB0CC}',ST_GeomFromText('POLYGON ((997102.24581483 198703.698242322, 997010.855094746 198747.313474357, 997001.063862726 198726.930498347, 997069.975478798 198694.043458313, 997075.422646806 198691.443778306, 997092.454838812 198683.315522298, 997102.24581483 198703.698242322))',2263));
insert into tax_lot_polygon
( boro, block, lot, bbl, community_district, regular_lot_indicator, number_lot_sides, condo_flag, reuc_flag,
 air_rights_flag, subterranean_flag, easement_flag, section_number, volume_number, page_number, lot_note,  
 nycmap_bldg_flag, missing_rpad_flag, conversion_exception_flag, value_reflected_out_flag, created_by,
 created_date, last_modified_by, last_modified_date, av_change, bw_change, effective_tax_year, bill_bbl_flag,
 globalid, shape) values ('3',2386,3,'3023860003',NULL,'',0,'','','','','',8,5,7,'','1','0',NULL,NULL,NULL,NULL,'sj',NULL,0,0,NULL,0,'{16985104-8FC9-4CB3-A743-7636D7375281}',ST_GeomFromText('POLYGON ((997113.306038842 198726.722626343, 997021.915062755 198770.338114381, 997010.855094746 198747.313474357, 997102.24581483 198703.698242322, 997113.306038842 198726.722626343))',2263));
insert into tax_lot_polygon
( boro, block, lot, bbl, community_district, regular_lot_indicator, number_lot_sides, condo_flag, reuc_flag,
 air_rights_flag, subterranean_flag, easement_flag, section_number, volume_number, page_number, lot_note,  
 nycmap_bldg_flag, missing_rpad_flag, conversion_exception_flag, value_reflected_out_flag, created_by,
 created_date, last_modified_by, last_modified_date, av_change, bw_change, effective_tax_year, bill_bbl_flag,
 globalid, shape) values ('3',2386,4,'3023860004',NULL,'',0,'','','','','',8,5,7,'','0','0',NULL,NULL,NULL,NULL,'sj',NULL,0,0,NULL,0,'{C9C87772-11DC-40A5-B433-D87C20E6688D}',ST_GeomFromText('POLYGON ((997137.007542864 198776.070210382, 997045.673910767 198819.79859443, 997021.915062755 198770.338114381, 997113.306038842 198726.722626343, 997137.007542864 198776.070210382))',2263));
insert into tax_lot_polygon
( boro, block, lot, bbl, community_district, regular_lot_indicator, number_lot_sides, condo_flag, reuc_flag,
 air_rights_flag, subterranean_flag, easement_flag, section_number, volume_number, page_number, lot_note,  
 nycmap_bldg_flag, missing_rpad_flag, conversion_exception_flag, value_reflected_out_flag, created_by,
 created_date, last_modified_by, last_modified_date, av_change, bw_change, effective_tax_year, bill_bbl_flag,
 globalid, shape) values ('3',2386,7,'3023860007',NULL,'',0,'','','','','',8,5,7,'','1','0',NULL,NULL,NULL,NULL,'sj',NULL,0,0,NULL,0,'{062B2E4D-650F-4D14-BDBF-5E080F62E758}',ST_GeomFromText('POLYGON ((997226.337718934 198733.30080235, 997137.007542864 198776.070210382, 997113.306038842 198726.722626343, 997102.24581483 198703.698242322, 997092.454838812 198683.315522298, 997114.468022838 198672.809794292, 997137.33394286 198661.897282288, 997160.793526873 198650.701378271, 997181.838774905 198640.657730266, 997226.337718934 198733.30080235))',2263));
insert into tax_lot_polygon
( boro, block, lot, bbl, community_district, regular_lot_indicator, number_lot_sides, condo_flag, reuc_flag,
 air_rights_flag, subterranean_flag, easement_flag, section_number, volume_number, page_number, lot_note,  
 nycmap_bldg_flag, missing_rpad_flag, conversion_exception_flag, value_reflected_out_flag, created_by,
 created_date, last_modified_by, last_modified_date, av_change, bw_change, effective_tax_year, bill_bbl_flag,
 globalid, shape) values ('3',2386,12,'3023860012',NULL,'',0,'','','','','',8,5,7,'','0','0',NULL,NULL,NULL,NULL,'sj',NULL,0,0,NULL,0,'{83B90A7B-155E-43C6-A2BD-105AAABC8D07}',ST_GeomFromText('POLYGON ((997229.534646943 198617.895490244, 997274.004918978 198710.47891432, 997226.337718934 198733.30080235, 997181.838774905 198640.657730266, 997221.492406935 198621.733698249, 997229.534646943 198617.895490244))',2263));
insert into tax_lot_polygon
( boro, block, lot, bbl, community_district, regular_lot_indicator, number_lot_sides, condo_flag, reuc_flag,
 air_rights_flag, subterranean_flag, easement_flag, section_number, volume_number, page_number, lot_note,  
 nycmap_bldg_flag, missing_rpad_flag, conversion_exception_flag, value_reflected_out_flag, created_by,
 created_date, last_modified_by, last_modified_date, av_change, bw_change, effective_tax_year, bill_bbl_flag,
 globalid, shape) values ('3',2386,14,'3023860014',NULL,'',0,'','','','','',8,5,7,'','2','0',NULL,NULL,NULL,NULL,'sj',NULL,0,0,NULL,0,'{B2D18F38-D809-41F3-87F6-1E09B03F448B}',ST_GeomFromText('POLYGON ((997274.004918978 198710.47891432, 997229.534646943 198617.895490244, 997273.095094979 198597.187394217, 997317.713591024 198689.552194312, 997274.004918978 198710.47891432))',2263));
insert into tax_lot_polygon
( boro, block, lot, bbl, community_district, regular_lot_indicator, number_lot_sides, condo_flag, reuc_flag,
 air_rights_flag, subterranean_flag, easement_flag, section_number, volume_number, page_number, lot_note,  
 nycmap_bldg_flag, missing_rpad_flag, conversion_exception_flag, value_reflected_out_flag, created_by,
 created_date, last_modified_by, last_modified_date, av_change, bw_change, effective_tax_year, bill_bbl_flag,
 globalid, shape) values ('3',2386,18,'3023860018',NULL,'I',0,'','','','','',8,5,7,'','0','0',NULL,NULL,NULL,NULL,'sj',NULL,0,0,NULL,0,'{DA98CFFA-31D1-4756-A0BB-7AD82058A761}',ST_GeomFromText('POLYGON ((997229.534646943 198617.895490244, 997221.492406935 198621.733698249, 997165.057462886 198535.493442163, 997228.635318935 198505.151298136, 997273.095094979 198597.187394217, 997229.534646943 198617.895490244))',2263));
insert into tax_lot_polygon
( boro, block, lot, bbl, community_district, regular_lot_indicator, number_lot_sides, condo_flag, reuc_flag,
 air_rights_flag, subterranean_flag, easement_flag, section_number, volume_number, page_number, lot_note,  
 nycmap_bldg_flag, missing_rpad_flag, conversion_exception_flag, value_reflected_out_flag, created_by,
 created_date, last_modified_by, last_modified_date, av_change, bw_change, effective_tax_year, bill_bbl_flag,
 globalid, shape) values ('3',2386,21,'3023860021',NULL,'I',0,'','','','','',8,5,7,'','2','0',NULL,NULL,NULL,NULL,'sj',NULL,0,0,NULL,0,'{C1EE26E6-7427-4EDE-BAE0-4B4F97CBDE8D}',ST_GeomFromText('POLYGON ((997181.838774905 198640.657730266, 997137.613494858 198548.590658173, 997165.057462886 198535.493442163, 997221.492406935 198621.733698249, 997181.838774905 198640.657730266))',2263));
insert into tax_lot_polygon
( boro, block, lot, bbl, community_district, regular_lot_indicator, number_lot_sides, condo_flag, reuc_flag,
 air_rights_flag, subterranean_flag, easement_flag, section_number, volume_number, page_number, lot_note,  
 nycmap_bldg_flag, missing_rpad_flag, conversion_exception_flag, value_reflected_out_flag, created_by,
 created_date, last_modified_by, last_modified_date, av_change, bw_change, effective_tax_year, bill_bbl_flag,
 globalid, shape) values ('3',2386,23,'3023860023',NULL,'',0,'','','','','',8,5,7,'','1','0',NULL,NULL,NULL,NULL,'sj',NULL,0,0,NULL,0,'{B1A315BB-500F-4A65-8EFA-135B2CA7B672}',ST_GeomFromText('POLYGON ((997160.793526873 198650.701378271, 997116.568246841 198558.634306192, 997137.613494858 198548.590658173, 997181.838774905 198640.657730266, 997160.793526873 198650.701378271))',2263));
insert into tax_lot_polygon
( boro, block, lot, bbl, community_district, regular_lot_indicator, number_lot_sides, condo_flag, reuc_flag,
 air_rights_flag, subterranean_flag, easement_flag, section_number, volume_number, page_number, lot_note,  
 nycmap_bldg_flag, missing_rpad_flag, conversion_exception_flag, value_reflected_out_flag, created_by,
 created_date, last_modified_by, last_modified_date, av_change, bw_change, effective_tax_year, bill_bbl_flag,
 globalid, shape) values ('3',2386,24,'3023860024',NULL,'',0,'','','','','',8,5,7,'','1','0',NULL,NULL,NULL,NULL,'sj',NULL,0,0,NULL,0,'{6FB6B8EE-B7B3-48F7-8C5B-DB9A7AB70099}',ST_GeomFromText('POLYGON ((997116.568246841 198558.634306192, 997160.793526873 198650.701378271, 997137.33394286 198661.897282288, 997093.108662814 198569.829954192, 997116.568246841 198558.634306192))',2263));
insert into tax_lot_polygon
( boro, block, lot, bbl, community_district, regular_lot_indicator, number_lot_sides, condo_flag, reuc_flag,
 air_rights_flag, subterranean_flag, easement_flag, section_number, volume_number, page_number, lot_note,  
 nycmap_bldg_flag, missing_rpad_flag, conversion_exception_flag, value_reflected_out_flag, created_by,
 created_date, last_modified_by, last_modified_date, av_change, bw_change, effective_tax_year, bill_bbl_flag,
 globalid, shape) values ('3',2386,25,'3023860025',NULL,'',0,'','','','','',8,5,7,'','1','0',NULL,NULL,NULL,NULL,'sj',NULL,0,0,NULL,0,'{A2C3D8FF-F6A5-41BF-9AE3-ABBED6131F83}',ST_GeomFromText('POLYGON ((997070.242742792 198580.742466211, 997093.108662814 198569.829954192, 997137.33394286 198661.897282288, 997114.468022838 198672.809794292, 997070.242742792 198580.742466211))',2263));
insert into tax_lot_polygon
( boro, block, lot, bbl, community_district, regular_lot_indicator, number_lot_sides, condo_flag, reuc_flag,
 air_rights_flag, subterranean_flag, easement_flag, section_number, volume_number, page_number, lot_note,  
 nycmap_bldg_flag, missing_rpad_flag, conversion_exception_flag, value_reflected_out_flag, created_by,
 created_date, last_modified_by, last_modified_date, av_change, bw_change, effective_tax_year, bill_bbl_flag,
 globalid, shape) values ('3',2386,26,'3023860026',NULL,'',0,'','','','','',8,5,7,'','1','0',NULL,NULL,NULL,NULL,'sj',NULL,0,0,NULL,0,'{C46EA24B-597A-4810-84CC-4E207A06BFD2}',ST_GeomFromText('POLYGON ((997114.468022838 198672.809794292, 997092.454838812 198683.315522298, 997048.229558781 198591.248194218, 997070.242742792 198580.742466211, 997114.468022838 198672.809794292))',2263));
insert into tax_lot_polygon
( boro, block, lot, bbl, community_district, regular_lot_indicator, number_lot_sides, condo_flag, reuc_flag,
 air_rights_flag, subterranean_flag, easement_flag, section_number, volume_number, page_number, lot_note,  
 nycmap_bldg_flag, missing_rpad_flag, conversion_exception_flag, value_reflected_out_flag, created_by,
 created_date, last_modified_by, last_modified_date, av_change, bw_change, effective_tax_year, bill_bbl_flag,
 globalid, shape) values ('3',2386,27,'3023860027',NULL,'',0,'','','','','',8,5,7,'','0','0',NULL,NULL,NULL,NULL,'sj',NULL,0,0,NULL,0,'{171B1B10-7C3E-4DCC-BE09-8E8904F81FE3}',ST_GeomFromText('POLYGON ((997092.454838812 198683.315522298, 997075.422646806 198691.443778306, 997031.197110757 198599.376450226, 997048.229558781 198591.248194218, 997092.454838812 198683.315522298))',2263));
insert into tax_lot_polygon
( boro, block, lot, bbl, community_district, regular_lot_indicator, number_lot_sides, condo_flag, reuc_flag,
 air_rights_flag, subterranean_flag, easement_flag, section_number, volume_number, page_number, lot_note,  
 nycmap_bldg_flag, missing_rpad_flag, conversion_exception_flag, value_reflected_out_flag, created_by,
 created_date, last_modified_by, last_modified_date, av_change, bw_change, effective_tax_year, bill_bbl_flag,
 globalid, shape) values ('3',2386,28,'3023860028',NULL,'I',0,'','','','','',8,5,7,'','1','0',NULL,NULL,NULL,NULL,'sj',NULL,0,0,NULL,0,'{9B23E723-5E5A-4651-9107-9AA59D620615}',ST_GeomFromText('POLYGON ((997075.422646806 198691.443778306, 997069.975478798 198694.043458313, 997061.543606788 198676.489794299, 997049.854902774 198682.068034306, 997014.06175074 198607.554370224, 997031.197110757 198599.376450226, 997075.422646806 198691.443778306))',2263));
insert into tax_lot_polygon
( boro, block, lot, bbl, community_district, regular_lot_indicator, number_lot_sides, condo_flag, reuc_flag,
 air_rights_flag, subterranean_flag, easement_flag, section_number, volume_number, page_number, lot_note,  
 nycmap_bldg_flag, missing_rpad_flag, conversion_exception_flag, value_reflected_out_flag, created_by,
 created_date, last_modified_by, last_modified_date, av_change, bw_change, effective_tax_year, bill_bbl_flag,
 globalid, shape) values ('3',2386,29,'3023860029',NULL,'',0,'','','','','',8,5,7,'','1','0',NULL,NULL,NULL,NULL,'sj',NULL,0,0,NULL,0,'{D1CD70D8-9066-4C20-B554-A19EDF1F1FED}',ST_GeomFromText('POLYGON ((997014.06175074 198607.554370224, 997049.854902774 198682.068034306, 997033.336502761 198689.951298311, 996997.543094725 198615.437634245, 997014.06175074 198607.554370224))',2263));
insert into tax_lot_polygon
( boro, block, lot, bbl, community_district, regular_lot_indicator, number_lot_sides, condo_flag, reuc_flag,
 air_rights_flag, subterranean_flag, easement_flag, section_number, volume_number, page_number, lot_note,  
 nycmap_bldg_flag, missing_rpad_flag, conversion_exception_flag, value_reflected_out_flag, created_by,
 created_date, last_modified_by, last_modified_date, av_change, bw_change, effective_tax_year, bill_bbl_flag,
 globalid, shape) values ('3',2386,129,'3023860129',NULL,'',0,'','','','','',8,5,7,'','0','0',NULL,NULL,NULL,NULL,'sj',NULL,0,0,NULL,0,'{D11DC106-BFC5-44C0-8856-F3572CC8F86F}',ST_GeomFromText('POLYGON ((997015.759542748 198698.339650318, 996979.966134712 198623.825986251, 996997.543094725 198615.437634245, 997033.336502761 198689.951298311, 997015.759542748 198698.339650318))',2263));
-- brooklyn block 2386 tax_lot_point 
insert into tax_lot_point
(bbl,lot,air_rights_flag,condo_flag,reuc_flag,subterranean_flag,lot_area,shape)
values ('3023860001',1,NULL,NULL,NULL,NULL,3605.3,ST_GeomFromText('POINT (996990.5150235873 198675.37824229896)',2263));
insert into tax_lot_point
(bbl,lot,air_rights_flag,condo_flag,reuc_flag,subterranean_flag,lot_area,shape)
values ('3023860002',2,NULL,NULL,NULL,NULL,2289.8,ST_GeomFromText('POINT (997051.6546752721 198715.31449832767)',2263));
insert into tax_lot_point
(bbl,lot,air_rights_flag,condo_flag,reuc_flag,subterranean_flag,lot_area,shape)
values ('3023860003',3,NULL,NULL,NULL,NULL,2586.6,ST_GeomFromText('POINT (997062.0803316794 198737.01817835122)',2263));
insert into tax_lot_point
(bbl,lot,air_rights_flag,condo_flag,reuc_flag,subterranean_flag,lot_area,shape)
values ('3023860004',4,NULL,NULL,NULL,NULL,5550,ST_GeomFromText('POINT (997079.4885068126 198773.26061038673)',2263));
insert into tax_lot_point
(bbl,lot,air_rights_flag,condo_flag,reuc_flag,subterranean_flag,lot_area,shape)
values ('3023860007',7,NULL,NULL,NULL,NULL,10185.1,ST_GeomFromText('POINT (997159.423491316 198708.3639703244)',2263));
insert into tax_lot_point
(bbl,lot,air_rights_flag,condo_flag,reuc_flag,subterranean_flag,lot_area,shape)
values ('3023860012',12,NULL,NULL,NULL,NULL,5429.8,ST_GeomFromText('POINT (997227.9361762502 198675.59814629704)',2263));
insert into tax_lot_point
(bbl,lot,air_rights_flag,condo_flag,reuc_flag,subterranean_flag,lot_area,shape)
values ('3023860014',14,NULL,NULL,NULL,NULL,4962.4,ST_GeomFromText('POINT (997273.6276593064 198653.83315426856)',2263));
insert into tax_lot_point
(bbl,lot,air_rights_flag,condo_flag,reuc_flag,subterranean_flag,lot_area,shape)
values ('3023860018',18,NULL,NULL,NULL,NULL,6517.7,ST_GeomFromText('POINT (997220.0705449865 198563.4424981922)',2263));
insert into tax_lot_point
(bbl,lot,air_rights_flag,condo_flag,reuc_flag,subterranean_flag,lot_area,shape)
values ('3023860021',21,NULL,NULL,NULL,NULL,3796.8,ST_GeomFromText('POINT (997178.0236266728 198588.07558621466)',2263));
insert into tax_lot_point
(bbl,lot,air_rights_flag,condo_flag,reuc_flag,subterranean_flag,lot_area,shape)
values ('3023860023',23,NULL,NULL,NULL,NULL,2381.8,ST_GeomFromText('POINT (997149.2035108677 198599.64601822197)',2263));
insert into tax_lot_point
(bbl,lot,air_rights_flag,condo_flag,reuc_flag,subterranean_flag,lot_area,shape)
values ('3023860024',24,NULL,NULL,NULL,NULL,2655,ST_GeomFromText('POINT (997126.9511293304 198610.26579423994)',2263));
insert into tax_lot_point
(bbl,lot,air_rights_flag,condo_flag,reuc_flag,subterranean_flag,lot_area,shape)
values ('3023860025',25,NULL,NULL,NULL,NULL,2587.8,ST_GeomFromText('POINT (997103.788342824 198621.31987424195)',2263));
insert into tax_lot_point
(bbl,lot,air_rights_flag,condo_flag,reuc_flag,subterranean_flag,lot_area,shape)
values ('3023860026',26,NULL,NULL,NULL,NULL,2491.3,ST_GeomFromText('POINT (997081.3487908063 198632.02899425477)',2263));
insert into tax_lot_point
(bbl,lot,air_rights_flag,condo_flag,reuc_flag,subterranean_flag,lot_area,shape)
values ('3023860027',27,NULL,NULL,NULL,NULL,1927.6,ST_GeomFromText('POINT (997061.8260331383 198641.34598626196)',2263));
insert into tax_lot_point
(bbl,lot,air_rights_flag,condo_flag,reuc_flag,subterranean_flag,lot_area,shape)
values ('3023860028',28,NULL,NULL,NULL,NULL,1687.1,ST_GeomFromText('POINT (997043.4023381708 198646.70995426923)',2263));
insert into tax_lot_point
(bbl,lot,air_rights_flag,condo_flag,reuc_flag,subterranean_flag,lot_area,shape)
values ('3023860029',29,NULL,NULL,NULL,NULL,1513,ST_GeomFromText('POINT (997023.6990559767 198648.7528342679)',2263));
insert into tax_lot_point
(bbl,lot,air_rights_flag,condo_flag,reuc_flag,subterranean_flag,lot_area,shape)
values ('3023860129',129,NULL,NULL,NULL,NULL,1610,ST_GeomFromText('POINT (997006.6513187364 198656.8886422813)',2263));
-- brooklyn block 2386 tax_lot_face
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'3',2386,24,'3023860024',100,0,0,0,NULL,NULL,NULL,NULL,0,0,0,'{BAABD4E7-8891-4B9C-93F0-C6EFE38DCC7F}',ST_GeomFromText('LINESTRING (997160.793526873 198650.701378271, 997116.568246841 198558.634306192)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'3',2386,14,'3023860014',100,0,1,0,NULL,NULL,NULL,NULL,0,0,0,'{18040B8C-95B7-4794-B235-CA835E8E3CB9}',ST_GeomFromText('LINESTRING (997317.713591024 198689.552194312, 997273.095094979 198597.187394217)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'3',2386,29,'3023860029',80,0,0,0,NULL,NULL,NULL,NULL,0,0,0,'{9C21F70B-6F6B-40AC-BB91-35DBA8803A8D}',ST_GeomFromText('LINESTRING (997049.854902774 198682.068034306, 997014.06175074 198607.554370224)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'3',2386,18,'3023860018',70,0,1,0,NULL,NULL,NULL,NULL,0,0,0,'{457962C6-C6BD-4B0D-B02A-F3CF40373E6A}',ST_GeomFromText('LINESTRING (997228.635318935 198505.151298136, 997165.057462886 198535.493442163)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'3',2386,1,'3023860001',20,0,0,0,NULL,NULL,NULL,NULL,0,0,0,'{AA5A0986-8DA0-4120-8AFB-FA1414A517D9}',ST_GeomFromText('LINESTRING (997069.975478798 198694.043458313, 997061.543606788 198676.489794299)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'3',2386,26,'3023860026',25,0,0,0,NULL,NULL,NULL,NULL,0,0,0,'{D1CB3D96-24E5-4818-AE12-DF38EB3F3024}',ST_GeomFromText('LINESTRING (997092.454838812 198683.315522298, 997114.468022838 198672.809794292)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'3',2386,14,'3023860014',100,0,0,0,NULL,NULL,NULL,NULL,0,0,0,'{3594E296-0B35-492E-B307-33516628B03B}',ST_GeomFromText('LINESTRING (997229.534646943 198617.895490244, 997274.004918978 198710.47891432)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'3',2386,21,'3023860021',30,0,1,0,NULL,NULL,NULL,NULL,0,0,0,'{F380375E-C20F-46D2-8BE2-10A448BF2F60}',ST_GeomFromText('LINESTRING (997165.057462886 198535.493442163, 997137.613494858 198548.590658173)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'3',2386,27,'3023860027',18.75,0,0,0,NULL,NULL,NULL,NULL,0,0,0,'{5EDC657C-2ADD-464D-BD2D-C50AB9820C61}',ST_GeomFromText('LINESTRING (997075.422646806 198691.443778306, 997092.454838812 198683.315522298)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'3',2386,1,'3023860001',100,0,1,0,NULL,NULL,NULL,NULL,0,0,0,'{E37B87AC-D59F-42C3-8FB5-33FECC0058E6}',ST_GeomFromText('LINESTRING (996956.838582695 198634.863426253, 997001.063862726 198726.930498347)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'3',2386,28,'3023860028',18.75,0,1,0,NULL,NULL,NULL,NULL,0,0,0,'{B7149B28-176C-4DD8-8A4D-3900F6321FD4}',ST_GeomFromText('LINESTRING (997031.197110757 198599.376450226, 997014.06175074 198607.554370224)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'3',2386,18,'3023860018',56.25,0,0,0,NULL,NULL,NULL,NULL,0,0,0,'{8CD75D5E-1D29-44F7-A713-5B0DDC5FF5E3}',ST_GeomFromText('LINESTRING (997221.492406935 198621.733698249, 997229.534646943 198617.895490244, 997273.095094979 198597.187394217)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'3',2386,28,'3023860028',80,0,0,0,NULL,NULL,NULL,NULL,0,0,0,'{0960A733-A004-4A5F-9172-0FBBB52AABA3}',ST_GeomFromText('LINESTRING (997014.06175074 198607.554370224, 997049.854902774 198682.068034306)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'3',2386,26,'3023860026',100,0,0,0,NULL,NULL,NULL,NULL,0,0,0,'{EDC0AD06-7135-46D5-A5EE-F4C5941D0207}',ST_GeomFromText('LINESTRING (997114.468022838 198672.809794292, 997070.242742792 198580.742466211)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'3',2386,1,'3023860001',25,0,1,0,NULL,NULL,NULL,NULL,0,0,0,'{1CC5A23D-7796-4628-B62B-82DA252B2343}',ST_GeomFromText('LINESTRING (996979.966134712 198623.825986251, 996956.838582695 198634.863426253)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'3',2386,21,'3023860021',0,1,0,2,NULL,NULL,NULL,NULL,0,0,0,'{89E99DB4-E900-4E2C-9243-62B2279CFE9F}',ST_GeomFromText('LINESTRING (997221.492406935 198621.733698249, 997165.057462886 198535.493442163)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'3',2386,29,'3023860029',80,0,0,0,NULL,NULL,NULL,NULL,0,0,0,'{505386A4-F8CA-4224-9647-F231B71489CA}',ST_GeomFromText('LINESTRING (996997.543094725 198615.437634245, 997033.336502761 198689.951298311)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'3',2386,1,'3023860001',50,0,0,0,NULL,NULL,NULL,NULL,0,0,0,'{B637EDAF-845E-4C8F-89B5-261C442CF6B6}',ST_GeomFromText('LINESTRING (997061.543606788 198676.489794299, 997049.854902774 198682.068034306, 997033.336502761 198689.951298311, 997015.759542748 198698.339650318)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'3',2386,129,'3023860129',18.75,0,1,0,NULL,NULL,NULL,NULL,0,0,0,'{3051DD46-C30D-40AE-8354-2CEF42227469}',ST_GeomFromText('LINESTRING (996997.543094725 198615.437634245, 996979.966134712 198623.825986251)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'3',2386,23,'3023860023',25,0,1,0,NULL,NULL,NULL,NULL,0,0,0,'{A89BD320-0BC9-4EAE-8002-97CAF2D65D22}',ST_GeomFromText('LINESTRING (997137.613494858 198548.590658173, 997116.568246841 198558.634306192)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'3',2386,25,'3023860025',24.5,0,0,0,NULL,NULL,NULL,NULL,0,0,0,'{DCF8B10B-B6BB-4F77-88DE-A4D5D19E080A}',ST_GeomFromText('LINESTRING (997114.468022838 198672.809794292, 997137.33394286 198661.897282288)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'3',2386,23,'3023860023',100,0,0,0,NULL,NULL,NULL,NULL,0,0,0,'{2D204440-2325-4BC5-B066-A8A05572FEC1}',ST_GeomFromText('LINESTRING (997116.568246841 198558.634306192, 997160.793526873 198650.701378271)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'3',2386,2,'3023860002',100,0,0,0,NULL,NULL,NULL,NULL,0,0,0,'{E145C47C-037B-4AE5-9C50-574BE6AF497F}',ST_GeomFromText('LINESTRING (997010.855094746 198747.313474357, 997102.24581483 198703.698242322)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'3',2386,3,'3023860003',100,0,0,0,NULL,NULL,NULL,NULL,0,0,0,'{7E36EA59-08B4-45B7-AAA4-67477EF49D2D}',ST_GeomFromText('LINESTRING (997102.24581483 198703.698242322, 997010.855094746 198747.313474357)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'3',2386,28,'3023860028',6.25,0,0,0,NULL,NULL,NULL,NULL,0,0,0,'{4556166C-5543-4A5C-A024-2D69D5A9BF90}',ST_GeomFromText('LINESTRING (997069.975478798 198694.043458313, 997075.422646806 198691.443778306)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'3',2386,4,'3023860004',100,0,0,0,NULL,NULL,NULL,NULL,0,0,0,'{63DB8E1B-4B5F-4181-A057-6540BC5E3F70}',ST_GeomFromText('LINESTRING (997113.306038842 198726.722626343, 997021.915062755 198770.338114381)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'3',2386,1,'3023860001',75,0,0,0,NULL,NULL,NULL,NULL,0,0,0,'{EE24BE62-446C-4AEB-8059-17E324634D56}',ST_GeomFromText('LINESTRING (997001.063862726 198726.930498347, 997069.975478798 198694.043458313)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'3',2386,23,'3023860023',25,0,0,0,NULL,NULL,NULL,NULL,0,0,0,'{A3B67234-6CD2-48CB-BA2C-8EE44B42D8D2}',ST_GeomFromText('LINESTRING (997160.793526873 198650.701378271, 997181.838774905 198640.657730266)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'3',2386,3,'3023860003',25,0,1,0,NULL,NULL,NULL,NULL,0,0,0,'{3F6D9CB6-66AE-464F-A076-BAEC8F67876F}',ST_GeomFromText('LINESTRING (997010.855094746 198747.313474357, 997021.915062755 198770.338114381)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'3',2386,12,'3023860012',100,0,0,0,NULL,NULL,NULL,NULL,0,0,0,'{447E5CC7-3301-4691-976B-9EB9E92251EF}',ST_GeomFromText('LINESTRING (997274.004918978 198710.47891432, 997229.534646943 198617.895490244)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'3',2386,129,'3023860129',18.75,0,0,0,NULL,NULL,NULL,NULL,0,0,0,'{A05D33E7-1D6B-45B7-938B-115D9489E025}',ST_GeomFromText('LINESTRING (997015.759542748 198698.339650318, 997033.336502761 198689.951298311)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'3',2386,4,'3023860004',100,0,1,0,NULL,NULL,NULL,NULL,0,0,0,'{9AB073C8-3B9B-4CCF-A801-93191289AA6F}',ST_GeomFromText('LINESTRING (997045.673910767 198819.79859443, 997137.007542864 198776.070210382)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'3',2386,24,'3023860024',25.5,0,0,0,NULL,NULL,NULL,NULL,0,0,0,'{AEBBDE8E-5462-4DC4-9100-6034CA76DEC6}',ST_GeomFromText('LINESTRING (997137.33394286 198661.897282288, 997160.793526873 198650.701378271)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'3',2386,1,'3023860001',80,0,0,0,NULL,NULL,NULL,NULL,0,0,0,'{DD1AB217-1C7E-41D9-A52C-6F60AE1726ED}',ST_GeomFromText('LINESTRING (997015.759542748 198698.339650318, 996979.966134712 198623.825986251)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'3',2386,21,'3023860021',100,0,0,0,NULL,NULL,NULL,NULL,0,0,0,'{09261F13-8E0F-4952-833F-C4FB6D79FDAA}',ST_GeomFromText('LINESTRING (997137.613494858 198548.590658173, 997181.838774905 198640.657730266)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'3',2386,4,'3023860004',50,0,0,0,NULL,NULL,NULL,NULL,0,0,0,'{8DB578CE-B252-4EFA-834B-9A396F05382A}',ST_GeomFromText('LINESTRING (997137.007542864 198776.070210382, 997113.306038842 198726.722626343)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'3',2386,27,'3023860027',100,0,0,0,NULL,NULL,NULL,NULL,0,0,0,'{FCAD83D9-99B3-4BE7-8216-186191DB80B7}',ST_GeomFromText('LINESTRING (997092.454838812 198683.315522298, 997048.229558781 198591.248194218)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'3',2386,29,'3023860029',18.75,0,0,0,NULL,NULL,NULL,NULL,0,0,0,'{906EA199-B4B9-4627-BE6E-38814E077ACB}',ST_GeomFromText('LINESTRING (997033.336502761 198689.951298311, 997049.854902774 198682.068034306)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'3',2386,129,'3023860129',80,0,0,0,NULL,NULL,NULL,NULL,0,0,0,'{ABA9A7B7-D712-4864-AB61-15274774B028}',ST_GeomFromText('LINESTRING (996979.966134712 198623.825986251, 997015.759542748 198698.339650318)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'3',2386,14,'3023860014',48,0,1,0,NULL,NULL,NULL,NULL,0,0,0,'{E7E85FE5-3C32-4A48-9AE2-EEAE12617A06}',ST_GeomFromText('LINESTRING (997274.004918978 198710.47891432, 997317.713591024 198689.552194312)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'3',2386,18,'3023860018',0,1,0,2,NULL,NULL,NULL,NULL,0,0,0,'{57B86132-E1AF-455D-9E2C-A6B1DABF579D}',ST_GeomFromText('LINESTRING (997165.057462886 198535.493442163, 997221.492406935 198621.733698249)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'3',2386,7,'3023860007',100,0,1,0,NULL,NULL,NULL,NULL,0,0,0,'{B8EA45C1-B52A-40CC-80E4-10527C14A949}',ST_GeomFromText('LINESTRING (997137.007542864 198776.070210382, 997226.337718934 198733.30080235)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'3',2386,26,'3023860026',25,0,1,0,NULL,NULL,NULL,NULL,0,0,0,'{F0EE84EA-496B-4288-9FB0-60F24A3E7083}',ST_GeomFromText('LINESTRING (997070.242742792 198580.742466211, 997048.229558781 198591.248194218)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'3',2386,3,'3023860003',25,0,0,0,NULL,NULL,NULL,NULL,0,0,0,'{BE653DEF-ABF9-4AF9-904D-BF32A882FCD3}',ST_GeomFromText('LINESTRING (997113.306038842 198726.722626343, 997102.24581483 198703.698242322)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'3',2386,28,'3023860028',20,0,0,0,NULL,NULL,NULL,NULL,0,0,0,'{EF135AE0-89C5-4A6E-BFD0-2C88345788AF}',ST_GeomFromText('LINESTRING (997061.543606788 198676.489794299, 997069.975478798 198694.043458313)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'3',2386,4,'3023860004',50,0,1,0,NULL,NULL,NULL,NULL,0,0,0,'{33CA9862-8F3F-43DC-AFAA-E7D4F9BB80E4}',ST_GeomFromText('LINESTRING (997021.915062755 198770.338114381, 997045.673910767 198819.79859443)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'3',2386,2,'3023860002',100,0,0,0,NULL,NULL,NULL,NULL,0,0,0,'{6DD7EF78-4A33-4128-92E5-2AB2C23AEA26}',ST_GeomFromText('LINESTRING (997092.454838812 198683.315522298, 997075.422646806 198691.443778306, 997069.975478798 198694.043458313, 997001.063862726 198726.930498347)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'3',2386,25,'3023860025',100,0,0,0,NULL,NULL,NULL,NULL,0,0,0,'{865633B3-0608-4884-B68F-218308A48C87}',ST_GeomFromText('LINESTRING (997137.33394286 198661.897282288, 997093.108662814 198569.829954192)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'3',2386,7,'3023860007',100,0,0,0,NULL,NULL,NULL,NULL,0,0,0,'{91077E3F-3540-41D0-9955-E452BC8F5D48}',ST_GeomFromText('LINESTRING (997092.454838812 198683.315522298, 997102.24581483 198703.698242322, 997113.306038842 198726.722626343, 997137.007542864 198776.070210382)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'3',2386,27,'3023860027',18.75,0,1,0,NULL,NULL,NULL,NULL,0,0,0,'{3F530E00-1E04-466F-909A-21E55451A54C}',ST_GeomFromText('LINESTRING (997048.229558781 198591.248194218, 997031.197110757 198599.376450226)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'3',2386,29,'3023860029',18.75,0,1,0,NULL,NULL,NULL,NULL,0,0,0,'{DF98E4BD-0C0F-4245-A6C7-424FD12AAE7B}',ST_GeomFromText('LINESTRING (997014.06175074 198607.554370224, 996997.543094725 198615.437634245)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'3',2386,2,'3023860002',25,0,1,0,NULL,NULL,NULL,NULL,0,0,0,'{A687DA7D-296D-4A78-A70F-EE54D6A1B87D}',ST_GeomFromText('LINESTRING (997001.063862726 198726.930498347, 997010.855094746 198747.313474357)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'3',2386,7,'3023860007',100,0,0,0,NULL,NULL,NULL,NULL,0,0,0,'{2577AC93-4A7A-44F7-8D6C-6128E79209BD}',ST_GeomFromText('LINESTRING (997181.838774905 198640.657730266, 997160.793526873 198650.701378271, 997137.33394286 198661.897282288, 997114.468022838 198672.809794292, 997092.454838812 198683.315522298)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'3',2386,26,'3023860026',100,0,0,0,NULL,NULL,NULL,NULL,0,0,0,'{7007B2BB-FC1E-4B77-97E1-81ACF6282B13}',ST_GeomFromText('LINESTRING (997048.229558781 198591.248194218, 997092.454838812 198683.315522298)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'3',2386,28,'3023860028',100,0,0,0,NULL,NULL,NULL,NULL,0,0,0,'{3D3860CC-A5DB-4212-806D-6771E92D119C}',ST_GeomFromText('LINESTRING (997075.422646806 198691.443778306, 997031.197110757 198599.376450226)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'3',2386,2,'3023860002',25,0,0,0,NULL,NULL,NULL,NULL,0,0,0,'{0E68E7A4-39F0-4B6E-B637-FE4E920AD24C}',ST_GeomFromText('LINESTRING (997102.24581483 198703.698242322, 997092.454838812 198683.315522298)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'3',2386,21,'3023860021',0,1,0,2,NULL,NULL,NULL,NULL,0,0,0,'{2C67AF2B-C9C2-4E74-91B3-AB082F34024D}',ST_GeomFromText('LINESTRING (997181.838774905 198640.657730266, 997221.492406935 198621.733698249)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'3',2386,27,'3023860027',100,0,0,0,NULL,NULL,NULL,NULL,0,0,0,'{2EACFBC2-FAE9-4E40-BF45-A4A0F878C912}',ST_GeomFromText('LINESTRING (997031.197110757 198599.376450226, 997075.422646806 198691.443778306)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'3',2386,24,'3023860024',25.5,0,1,0,NULL,NULL,NULL,NULL,0,0,0,'{B1B2AEFC-476C-4FBB-A716-6E2016FFAC5C}',ST_GeomFromText('LINESTRING (997116.568246841 198558.634306192, 997093.108662814 198569.829954192)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'3',2386,28,'3023860028',12.5,0,0,0,NULL,NULL,NULL,NULL,0,0,0,'{45B059D4-371D-4C05-A295-A4ABE0F766B9}',ST_GeomFromText('LINESTRING (997049.854902774 198682.068034306, 997061.543606788 198676.489794299)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'3',2386,12,'3023860012',100,0,0,0,NULL,NULL,NULL,NULL,0,0,0,'{09E1EBF0-1F3F-4013-B5C6-0259764A00BD}',ST_GeomFromText('LINESTRING (997181.838774905 198640.657730266, 997226.337718934 198733.30080235)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'3',2386,24,'3023860024',100,0,0,0,NULL,NULL,NULL,NULL,0,0,0,'{246AB3E4-1489-4B55-A5DD-66F4C76A549A}',ST_GeomFromText('LINESTRING (997093.108662814 198569.829954192, 997137.33394286 198661.897282288)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'3',2386,129,'3023860129',80,0,0,0,NULL,NULL,NULL,NULL,0,0,0,'{69898179-E50B-43F0-B39D-BE80478899C7}',ST_GeomFromText('LINESTRING (997033.336502761 198689.951298311, 996997.543094725 198615.437634245)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'3',2386,23,'3023860023',100,0,0,0,NULL,NULL,NULL,NULL,0,0,0,'{F358CC82-DB60-48E3-91E0-DD597AB48480}',ST_GeomFromText('LINESTRING (997181.838774905 198640.657730266, 997137.613494858 198548.590658173)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'3',2386,18,'3023860018',100,0,1,0,NULL,NULL,NULL,NULL,0,0,0,'{EB433C81-233E-4566-B0F7-996C05A00DE0}',ST_GeomFromText('LINESTRING (997273.095094979 198597.187394217, 997228.635318935 198505.151298136)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'3',2386,12,'3023860012',52,0,1,0,NULL,NULL,NULL,NULL,0,0,0,'{C00DDE5C-6303-4D64-9D0A-71CC9AC291F5}',ST_GeomFromText('LINESTRING (997226.337718934 198733.30080235, 997274.004918978 198710.47891432)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'3',2386,12,'3023860012',52,0,0,0,NULL,NULL,NULL,NULL,0,0,0,'{AACECEC1-EB1F-4A5A-8FE9-20D6CB0A5F8B}',ST_GeomFromText('LINESTRING (997229.534646943 198617.895490244, 997221.492406935 198621.733698249, 997181.838774905 198640.657730266)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'3',2386,25,'3023860025',100,0,0,0,NULL,NULL,NULL,NULL,0,0,0,'{AF1D65E8-BC56-42AB-94F6-B9A1BE0114C0}',ST_GeomFromText('LINESTRING (997070.242742792 198580.742466211, 997114.468022838 198672.809794292)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'3',2386,3,'3023860003',100,0,0,0,NULL,NULL,NULL,NULL,0,0,0,'{E9EA845E-9803-4B5F-A7D1-CE4F0BDBE7FF}',ST_GeomFromText('LINESTRING (997021.915062755 198770.338114381, 997113.306038842 198726.722626343)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'3',2386,7,'3023860007',100,0,0,0,NULL,NULL,NULL,NULL,0,0,0,'{0C504FAE-7476-4CA5-81C7-89C4E73EDF6A}',ST_GeomFromText('LINESTRING (997226.337718934 198733.30080235, 997181.838774905 198640.657730266)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'3',2386,25,'3023860025',24.5,0,1,0,NULL,NULL,NULL,NULL,0,0,0,'{934024BD-91C9-44BA-8A13-9C3032B50B92}',ST_GeomFromText('LINESTRING (997093.108662814 198569.829954192, 997070.242742792 198580.742466211)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'3',2386,14,'3023860014',48,0,0,0,NULL,NULL,NULL,NULL,0,0,0,'{5FCD86E1-FF72-4875-AB8A-137F79E68A59}',ST_GeomFromText('LINESTRING (997273.095094979 198597.187394217, 997229.534646943 198617.895490244)',2263));
-- brooklyn block 2386 lot_face_point...
-- 
-------------------------------------------------------
 -- Bronx block 2541
 -- An interesting critter because 3 lots in the source have identical BBLs (2025418900)
 -- In this target data the 3 lot polygons appear to be "merged" (matching legacy prod)
 -- So without noting the duplicate BBLs this will look like a lot in the source that has been split
 -- However the tax_lot_point records for these 3 identical BBLs remain separate for labeling 
 -- My understanding is that the ETL should do nothing here -- the 3 lot polygons on the target 
 --    that have been dissolved are intended that way for display of the subject triplicate lot
 --------------------------------------------------------------------- 
-- Bronx block 2541 tax_block_polygon 
insert into tax_block_polygon
( boro, block, eop_overlap_flag, jagged_st_flag, 
 created_by, created_date, last_modified_by, last_modified_date, 
 section_number, volume_number, globalid, shape)
values ('2',2541,1,0,NULL,NULL,NULL,NULL,9,9,'{810BAB14-0425-4F13-800F-DF7D480CC117}',ST_GeomFromText('POLYGON ((1003956.97094122 245973.955694348, 1004066.11986931 246334.51991868, 1004096.80710134 246406.57214275, 1004122.17798136 246452.265838787, 1004103.92518134 246458.822510794, 1004138.90118139 246560.109934896, 1004390.59679762 247193.78545548, 1004409.01318163 247240.407407522, 1004309.14476554 247280.243823558, 1004167.11545341 247336.897903621, 1004105.18444535 247214.370671496, 1004077.39001332 247159.33527945, 1004050.32338929 247105.740655392, 1004041.24870129 247088.506223381, 1004033.62988529 247074.033519372, 1004029.21286127 247065.302127361, 1004015.50508526 247038.201199338, 1003999.15078124 247003.636079296, 1003983.70450923 246968.639855266, 1003968.02374122 246930.423919231, 1003946.1982052 246869.558383182, 1003928.58591717 246812.728431121, 1003904.87519716 246727.159663051, 1003888.89260514 246661.782638982, 1003860.63993312 246546.212718874, 1003787.45516504 246246.847342595, 1003780.46866904 246218.268014565, 1003759.36121303 246153.837934509, 1003757.87846102 246149.343598515, 1003743.85094102 246106.823278472, 1003721.24153298 246044.250478417, 1003717.88230099 246035.957358405, 1003700.44332497 245992.905838355, 1003683.29798095 245952.965230331, 1003641.49087691 245864.585326239, 1003604.44230089 245784.975214168, 1003566.48518084 245700.820846096, 1003452.03986874 245435.729261845, 1003587.10086086 245395.960685805, 1003591.66201288 245394.617709801, 1003598.78162888 245417.705837831, 1003742.77446102 245884.662126258, 1003762.14623703 245947.482734323, 1003790.66873306 245939.921518311, 1003793.79910105 245939.020142317, 1003932.85318118 245897.050734267, 1003956.97094122 245973.955694348))',2263));
-- Bronx block 2541 tax_block_point
insert into tax_block_point 
(boro, block, shape)
values 
('2', 2541, ST_GeomFromText('POINT (1003976.70806533 246496.573758009)',2263));
-- Bronx block 2541 tax_lot_polygons 
insert into tax_lot_polygon
( boro, block, lot, bbl, community_district, regular_lot_indicator, number_lot_sides, condo_flag, reuc_flag,
 air_rights_flag, subterranean_flag, easement_flag, section_number, volume_number, page_number, lot_note,  
 nycmap_bldg_flag, missing_rpad_flag, conversion_exception_flag, value_reflected_out_flag, created_by,
 created_date, last_modified_by, last_modified_date, av_change, bw_change, effective_tax_year, bill_bbl_flag,
 globalid, shape) values ('2',2541,8900,'2025418900',NULL,'',0,'','R','','','',9,9,18,'','0','0',NULL,NULL,NULL,NULL,'',NULL,0,0,NULL,0,'{4EF7180B-B3CD-4154-93E6-B6F842D845B0}',ST_GeomFromText('MULTIPOLYGON (((1004309.14476554 247280.243823558, 1004167.11545341 247336.897903621, 1004105.18444535 247214.370671496, 1004077.39001332 247159.33527945, 1004209.33010945 247120.101487413, 1003993.06975724 246614.87499094, 1003949.8382692 246516.340078846, 1003948.9235812 246514.500462845, 1003901.61631715 246418.751086757, 1003855.65510112 246340.642670691, 1003841.0257251 246314.01431866, 1003825.28633308 246284.274286628, 1003809.00575706 246252.2079826, 1003797.63730906 246228.026478589, 1003781.44326104 246192.106350541, 1003769.54514903 246166.929518521, 1003761.01753302 246149.053038508, 1003757.87846102 246149.343598515, 1003743.85094102 246106.823278472, 1003721.24153298 246044.250478417, 1003717.88230099 246035.957358405, 1003700.44332497 245992.905838355, 1003683.29798095 245952.965230331, 1003641.49087691 245864.585326239, 1003604.44230089 245784.975214168, 1003566.48518084 245700.820846096, 1003452.03986874 245435.729261845, 1003587.10086086 245395.960685805, 1003591.66201288 245394.617709801, 1003598.78162888 245417.705837831, 1003742.77446102 245884.662126258, 1003762.14623703 245947.482734323, 1003790.66873306 245939.921518311, 1003793.79910105 245939.020142317, 1003801.43532506 245986.520174354, 1003798.39686106 245987.022702351, 1003765.69516502 245990.209134355, 1003772.65734103 246014.115950376, 1003810.86662108 246139.698286504, 1003817.40921308 246157.544046521, 1003830.4603491 246190.568558544, 1003841.33036511 246216.242542565, 1003856.92383711 246250.651758596, 1003872.07058913 246281.764462635, 1003892.91743715 246321.485166669, 1003936.18860519 246398.077294737, 1003981.87564524 246502.663790837, 1003983.92722924 246501.926766843, 1004262.4465255 247169.289071456, 1004290.09222151 247234.031983525, 1004390.59679762 247193.78545548, 1004409.01318163 247240.407407522, 1004309.14476554 247280.243823558)))',2263));
insert into tax_lot_polygon
( boro, block, lot, bbl, community_district, regular_lot_indicator, number_lot_sides, condo_flag, reuc_flag,
 air_rights_flag, subterranean_flag, easement_flag, section_number, volume_number, page_number, lot_note,  
 nycmap_bldg_flag, missing_rpad_flag, conversion_exception_flag, value_reflected_out_flag, created_by,
 created_date, last_modified_by, last_modified_date, av_change, bw_change, effective_tax_year, bill_bbl_flag,
 globalid, shape) values ('2',2541,3,'2025410003',NULL,'I',0,'','R','','','E',9,9,18,'','0','0',NULL,NULL,NULL,NULL,'sj',NULL,0,0,NULL,0,'{2FEF3F17-9694-4F16-9363-B04A2D7FC1E0}',ST_GeomFromText('POLYGON ((1003892.94406115 246136.837998495, 1003839.9597411 246141.743726507, 1003830.8202851 246111.272814468, 1003881.32319714 246106.890094474, 1003892.94406115 246136.837998495))',2263));
insert into tax_lot_polygon
( boro, block, lot, bbl, community_district, regular_lot_indicator, number_lot_sides, condo_flag, reuc_flag,
 air_rights_flag, subterranean_flag, easement_flag, section_number, volume_number, page_number, lot_note,  
 nycmap_bldg_flag, missing_rpad_flag, conversion_exception_flag, value_reflected_out_flag, created_by,
 created_date, last_modified_by, last_modified_date, av_change, bw_change, effective_tax_year, bill_bbl_flag,
 globalid, shape) values ('2',2541,123,'2025410123',NULL,'I',0,'','R','','','',9,9,18,'','0','0',NULL,NULL,NULL,NULL,'sj',NULL,0,0,NULL,0,'{DFBFF950-755E-46BD-AC10-46F52A961857}',ST_GeomFromText('POLYGON ((1003983.92722924 246501.926766843, 1003981.87564524 246502.663790837, 1003936.18860519 246398.077294737, 1003892.91743715 246321.485166669, 1003872.07058913 246281.764462635, 1003856.92383711 246250.651758596, 1003841.33036511 246216.242542565, 1003830.4603491 246190.568558544, 1003817.40921308 246157.544046521, 1003810.86662108 246139.698286504, 1003772.65734103 246014.115950376, 1003765.69516502 245990.209134355, 1003798.39686106 245987.022702351, 1003801.19289306 245997.239406362, 1003830.8202851 246111.272814468, 1003839.9597411 246141.743726507, 1003848.04114911 246162.204782516, 1003855.49663712 246180.041070536, 1003865.06284513 246201.666670561, 1003878.03846113 246229.065582588, 1003898.03922915 246267.709550619, 1003952.48300521 246370.145902708, 1004010.98182125 246492.208494827, 1003983.92722924 246501.926766843))',2263));
insert into tax_lot_polygon
( boro, block, lot, bbl, community_district, regular_lot_indicator, number_lot_sides, condo_flag, reuc_flag,
 air_rights_flag, subterranean_flag, easement_flag, section_number, volume_number, page_number, lot_note,  
 nycmap_bldg_flag, missing_rpad_flag, conversion_exception_flag, value_reflected_out_flag, created_by,
 created_date, last_modified_by, last_modified_date, av_change, bw_change, effective_tax_year, bill_bbl_flag,
 globalid, shape) values ('2',2541,132,'2025410132',NULL,'I',0,'','','','','',9,9,18,'','1','0',NULL,NULL,NULL,NULL,'sj',NULL,0,0,NULL,0,'{E3143347-2E6B-4071-9093-2B14C915D692}',ST_GeomFromText('POLYGON ((1003993.06975724 246614.87499094, 1004209.33010945 247120.101487413, 1004077.39001332 247159.33527945, 1004050.32338929 247105.740655392, 1004041.24870129 247088.506223381, 1004033.62988529 247074.033519372, 1004029.21286127 247065.302127361, 1004015.50508526 247038.201199338, 1003999.15078124 247003.636079296, 1003983.70450923 246968.639855266, 1003968.02374122 246930.423919231, 1003946.1982052 246869.558383182, 1003928.58591717 246812.728431121, 1003904.87519716 246727.159663051, 1003888.89260514 246661.782638982, 1003993.06975724 246614.87499094))',2263));
insert into tax_lot_polygon
( boro, block, lot, bbl, community_district, regular_lot_indicator, number_lot_sides, condo_flag, reuc_flag,
 air_rights_flag, subterranean_flag, easement_flag, section_number, volume_number, page_number, lot_note,  
 nycmap_bldg_flag, missing_rpad_flag, conversion_exception_flag, value_reflected_out_flag, created_by,
 created_date, last_modified_by, last_modified_date, av_change, bw_change, effective_tax_year, bill_bbl_flag,
 globalid, shape) values ('2',2541,159,'2025410159',NULL,'',0,'','','','','',9,9,18,'','0','0',NULL,NULL,NULL,NULL,'sj',NULL,0,0,NULL,0,'{583B749A-B043-424A-A396-B3557438C3B9}',ST_GeomFromText('POLYGON ((1003860.63993312 246546.212718874, 1003948.9235812 246514.500462845, 1003949.8382692 246516.340078846, 1003993.06975724 246614.87499094, 1003888.89260514 246661.782638982, 1003860.63993312 246546.212718874))',2263));
insert into tax_lot_polygon
( boro, block, lot, bbl, community_district, regular_lot_indicator, number_lot_sides, condo_flag, reuc_flag,
 air_rights_flag, subterranean_flag, easement_flag, section_number, volume_number, page_number, lot_note,  
 nycmap_bldg_flag, missing_rpad_flag, conversion_exception_flag, value_reflected_out_flag, created_by,
 created_date, last_modified_by, last_modified_date, av_change, bw_change, effective_tax_year, bill_bbl_flag,
 globalid, shape) values ('2',2541,180,'2025410180',NULL,'I',0,'','R','','','E',9,9,18,'','0','0',NULL,NULL,NULL,NULL,'sj',NULL,0,0,NULL,0,'{2B185883-90CA-4724-95B9-4929B27AC0FF}',ST_GeomFromText('POLYGON ((1004390.59679762 247193.78545548, 1004290.09222151 247234.031983525, 1004262.4465255 247169.289071456, 1003983.92722924 246501.926766843, 1004010.98182125 246492.208494827, 1003952.48300521 246370.145902708, 1003898.03922915 246267.709550619, 1003878.03846113 246229.065582588, 1003865.06284513 246201.666670561, 1003855.49663712 246180.041070536, 1003848.04114911 246162.204782516, 1003839.9597411 246141.743726507, 1003892.94406115 246136.837998495, 1003900.30380516 246152.854126513, 1003908.47967717 246170.27902253, 1003916.17682917 246186.346606538, 1003924.99654117 246204.376430556, 1003932.89695719 246220.197486579, 1003943.0980452 246240.189550594, 1003996.62994924 246343.146862686, 1004059.9466853 246474.619502813, 1004082.53382133 246466.5063508, 1004103.92518134 246458.822510794, 1004138.90118139 246560.109934896, 1004390.59679762 247193.78545548))',2263));
insert into tax_lot_polygon
( boro, block, lot, bbl, community_district, regular_lot_indicator, number_lot_sides, condo_flag, reuc_flag,
 air_rights_flag, subterranean_flag, easement_flag, section_number, volume_number, page_number, lot_note,  
 nycmap_bldg_flag, missing_rpad_flag, conversion_exception_flag, value_reflected_out_flag, created_by,
 created_date, last_modified_by, last_modified_date, av_change, bw_change, effective_tax_year, bill_bbl_flag,
 globalid, shape) values ('2',2541,22,'2025410022',NULL,'I',0,'','R','','','E',9,9,18,'','0','0',NULL,NULL,NULL,NULL,'sj',NULL,0,0,NULL,0,'{D7E8A6BA-120A-4257-B311-BB44CF0744F3}',ST_GeomFromText('POLYGON ((1004082.53382133 246466.5063508, 1004059.9466853 246474.619502813, 1003996.62994924 246343.146862686, 1003943.0980452 246240.189550594, 1003932.89695719 246220.197486579, 1003924.99654117 246204.376430556, 1003916.17682917 246186.346606538, 1003908.47967717 246170.27902253, 1003900.30380516 246152.854126513, 1003892.94406115 246136.837998495, 1003881.32319714 246106.890094474, 1003872.79481313 246084.226670444, 1003866.35692513 246065.053038433, 1003860.18937312 246044.39639841, 1003854.92652512 246024.278638393, 1003850.60934111 246005.262958378, 1003846.4311651 245983.483502358, 1003846.3333731 245982.919022352, 1003956.97094122 245973.955694348, 1004066.11986931 246334.51991868, 1004096.80710134 246406.57214275, 1004122.17798136 246452.265838787, 1004103.92518134 246458.822510794, 1004082.53382133 246466.5063508))',2263));
insert into tax_lot_polygon
( boro, block, lot, bbl, community_district, regular_lot_indicator, number_lot_sides, condo_flag, reuc_flag,
 air_rights_flag, subterranean_flag, easement_flag, section_number, volume_number, page_number, lot_note,  
 nycmap_bldg_flag, missing_rpad_flag, conversion_exception_flag, value_reflected_out_flag, created_by,
 created_date, last_modified_by, last_modified_date, av_change, bw_change, effective_tax_year, bill_bbl_flag,
 globalid, shape) values ('2',2541,4,'2025410004',NULL,'',0,'','R','','','E',9,9,18,'','0','0',NULL,NULL,NULL,NULL,'sj',NULL,0,0,NULL,0,'{AB586153-5CC7-4D4A-892E-E94356B752F5}',ST_GeomFromText('POLYGON ((1003881.32319714 246106.890094474, 1003830.8202851 246111.272814468, 1003801.19289306 245997.239406362, 1003798.39686106 245987.022702351, 1003801.43532506 245986.520174354, 1003793.79910105 245939.020142317, 1003932.85318118 245897.050734267, 1003956.97094122 245973.955694348, 1003846.3333731 245982.919022352, 1003846.4311651 245983.483502358, 1003850.60934111 246005.262958378, 1003854.92652512 246024.278638393, 1003860.18937312 246044.39639841, 1003866.35692513 246065.053038433, 1003872.79481313 246084.226670444, 1003881.32319714 246106.890094474))',2263));
insert into tax_lot_polygon
( boro, block, lot, bbl, community_district, regular_lot_indicator, number_lot_sides, condo_flag, reuc_flag,
 air_rights_flag, subterranean_flag, easement_flag, section_number, volume_number, page_number, lot_note,  
 nycmap_bldg_flag, missing_rpad_flag, conversion_exception_flag, value_reflected_out_flag, created_by,
 created_date, last_modified_by, last_modified_date, av_change, bw_change, effective_tax_year, bill_bbl_flag,
 globalid, shape) values ('2',2541,122,'2025410122',NULL,'I',0,'','R','','','',9,9,18,'','0','0',NULL,NULL,NULL,NULL,'sj',NULL,0,0,NULL,0,'{527D925D-5F0D-4F17-A0C2-4F5DC96D35BC}',ST_GeomFromText('POLYGON ((1003948.9235812 246514.500462845, 1003860.63993312 246546.212718874, 1003787.45516504 246246.847342595, 1003780.46866904 246218.268014565, 1003759.36121303 246153.837934509, 1003757.87846102 246149.343598515, 1003761.01753302 246149.053038508, 1003769.54514903 246166.929518521, 1003781.44326104 246192.106350541, 1003797.63730906 246228.026478589, 1003809.00575706 246252.2079826, 1003825.28633308 246284.274286628, 1003841.0257251 246314.01431866, 1003855.65510112 246340.642670691, 1003901.61631715 246418.751086757, 1003948.9235812 246514.500462845))',2263));
-- bronx block 2541 tax_lot_point 
insert into tax_lot_point
(bbl,lot,air_rights_flag,condo_flag,reuc_flag,subterranean_flag,lot_area,shape)
values ('2025410003',3,NULL,NULL,NULL,NULL,1611.4,ST_GeomFromText('POINT (1003861.40908221 246124.31691049)',2263));
insert into tax_lot_point
(bbl,lot,air_rights_flag,condo_flag,reuc_flag,subterranean_flag,lot_area,shape)
values ('2025410004',4,NULL,NULL,NULL,NULL,15565.4,ST_GeomFromText('POINT (1003826.6947529 246004.161774367)',2263));
insert into tax_lot_point
(bbl,lot,air_rights_flag,condo_flag,reuc_flag,subterranean_flag,lot_area,shape)
values ('2025410022',22,NULL,NULL,NULL,NULL,46404.7,ST_GeomFromText('POINT (1003983.86731731 246224.28759858)',2263));
insert into tax_lot_point
(bbl,lot,air_rights_flag,condo_flag,reuc_flag,subterranean_flag,lot_area,shape)
values ('2025410122',122,NULL,NULL,NULL,NULL,18145.1,ST_GeomFromText('POINT (1003835.93108908 246347.632878691)',2263));
insert into tax_lot_point
(bbl,lot,air_rights_flag,condo_flag,reuc_flag,subterranean_flag,lot_area,shape)
values ('2025410123',123,NULL,NULL,NULL,NULL,15943.2,ST_GeomFromText('POINT (1003870.24799042 246244.843246594)',2263));
insert into tax_lot_point
(bbl,lot,air_rights_flag,condo_flag,reuc_flag,subterranean_flag,lot_area,shape)
values ('2025410132',132,NULL,NULL,NULL,NULL,74892.5,ST_GeomFromText('POINT (1004031.04355034 246887.105135195)',2263));
insert into tax_lot_point
(bbl,lot,air_rights_flag,condo_flag,reuc_flag,subterranean_flag,lot_area,shape)
values ('2025410159',159,NULL,NULL,NULL,NULL,11818.5,ST_GeomFromText('POINT (1003926.11533502 246588.141550913)',2263));
insert into tax_lot_point
(bbl,lot,air_rights_flag,condo_flag,reuc_flag,subterranean_flag,lot_area,shape)
values ('2025410180',180,NULL,NULL,NULL,NULL,111728.7,ST_GeomFromText('POINT (1004124.59671075 246685.43499101)',2263));
insert into tax_lot_point
(bbl,lot,air_rights_flag,condo_flag,reuc_flag,subterranean_flag,lot_area,shape)
values ('2025418900',8900,NULL,NULL,NULL,NULL,5400.5,ST_GeomFromText('POINT (1004349.4974592 247237.014639519)',2263));
insert into tax_lot_point
(bbl,lot,air_rights_flag,condo_flag,reuc_flag,subterranean_flag,lot_area,shape)
values ('2025418900',8900,NULL,NULL,NULL,NULL,127122.7,ST_GeomFromText('POINT (1003859.9936641 246304.494190648)',2263));
insert into tax_lot_point
(bbl,lot,air_rights_flag,condo_flag,reuc_flag,subterranean_flag,lot_area,shape)
values ('2025418900',8900,NULL,NULL,NULL,NULL,20254.7,ST_GeomFromText('POINT (1004211.35390265 247253.093487538)',2263));
-- Bronx block 2541 contd tax_lot_face
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,180,'2025410180',25.01,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{AB89802F-A5C1-4FCF-B907-FA61E49B6F25}',ST_GeomFromText('LINESTRING (1004103.92518134 246458.822510794, 1004082.53382133 246466.5063508)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,180,'2025410180',143.76,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{2458579E-5648-436F-9692-2ED85CA54F61}',ST_GeomFromText('LINESTRING (1004059.9466853 246474.619502813, 1003996.62994924 246343.146862686)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,22,'2025410022',271.35,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{6A13A884-85F9-4ACA-8CFA-6834060F51B3}',ST_GeomFromText('LINESTRING (1003846.4311651 245983.483502358, 1003850.60934111 246005.262958378, 1003854.92652512 246024.278638393, 1003860.18937312 246044.39639841, 1003866.35692513 246065.053038433, 1003872.79481313 246084.226670444, 1003881.32319714 246106.890094474, 1003892.94406115 246136.837998495, 1003900.30380516 246152.854126513, 1003908.47967717 246170.27902253, 1003916.17682917 246186.346606538, 1003924.99654117 246204.376430556, 1003932.89695719 246220.197486579, 1003943.0980452 246240.189550594)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,8900,'2025418900',0,1,0,2,NULL,NULL,NULL,NULL,NULL,NULL,0,'{2E62351B-CFDE-438A-8DDB-A49208910E02}',ST_GeomFromText('LINESTRING (1003798.39686106 245987.022702351, 1003801.43532506 245986.520174354)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,8900,'2025418900',123.37,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{F6012E39-1315-4CD7-A7AB-AB854440DABE}',ST_GeomFromText('LINESTRING (1003717.88230099 246035.957358405, 1003721.24153298 246044.250478417, 1003743.85094102 246106.823278472, 1003757.87846102 246149.343598515)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,8900,'2025418900',3,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{91639E65-373A-4D44-9C20-86D82EC436AD}',ST_GeomFromText('LINESTRING (1003757.87846102 246149.343598515, 1003761.01753302 246149.053038508)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,122,'2025410122',3,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{710BAFB5-DF51-4C80-886D-C0415EF1CA97}',ST_GeomFromText('LINESTRING (1003761.01753302 246149.053038508, 1003757.87846102 246149.343598515)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,4,'2025410004',0,1,0,2,NULL,NULL,NULL,NULL,NULL,NULL,0,'{87959870-07CE-4B25-A87B-BE91B55B728F}',ST_GeomFromText('LINESTRING (1003801.43532506 245986.520174354, 1003798.39686106 245987.022702351)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,123,'2025410123',9.63,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{7058E110-81C4-4E59-872B-BC40A5D9665F}',ST_GeomFromText('LINESTRING (1003801.19289306 245997.239406362, 1003798.39686106 245987.022702351)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,180,'2025410180',0,1,0,2,NULL,NULL,NULL,NULL,NULL,NULL,0,'{2ECD9E39-A185-4D6C-A0AC-5B516577A8A1}',ST_GeomFromText('LINESTRING (1004010.98182125 246492.208494827, 1003983.92722924 246501.926766843)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,8900,'2025418900',113.62,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{ED164E7C-B347-473A-ADAF-1A61B9E2D872}',ST_GeomFromText('LINESTRING (1003981.87564524 246502.663790837, 1003936.18860519 246398.077294737)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,8900,'2025418900',0,1,1,2,NULL,NULL,NULL,NULL,NULL,NULL,0,'{1D07FDFC-3A14-4E5F-8340-E504C1E85B80}',ST_GeomFromText('LINESTRING (1003598.78162888 245417.705837831, 1003591.66201288 245394.617709801)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,22,'2025410022',25.71,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{DAB2006E-87FC-4463-9338-4862A4D0D459}',ST_GeomFromText('LINESTRING (1004059.9466853 246474.619502813, 1004082.53382133 246466.5063508)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,159,'2025410159',105.13,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{69E3060E-287C-4386-8227-CCC8BA83D2E1}',ST_GeomFromText('LINESTRING (1003993.06975724 246614.87499094, 1003949.8382692 246516.340078846)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,123,'2025410123',178.11,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{AB7C3415-876B-4BC6-9353-42FD25D253C2}',ST_GeomFromText('LINESTRING (1003817.40921308 246157.544046521, 1003830.4603491 246190.568558544, 1003841.33036511 246216.242542565, 1003856.92383711 246250.651758596, 1003872.07058913 246281.764462635, 1003892.91743715 246321.485166669)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,123,'2025410123',22.76,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{9D6BEC51-BFD3-4655-A4D0-518AE9710B5E}',ST_GeomFromText('LINESTRING (1003765.69516502 245990.209134355, 1003772.65734103 246014.115950376)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,180,'2025410180',25.71,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{C7B815B6-8900-4D22-A205-CBB1838DE3BC}',ST_GeomFromText('LINESTRING (1004082.53382133 246466.5063508, 1004059.9466853 246474.619502813)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,22,'2025410022',.53,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{B4A5D5D6-D498-4FF6-B01C-229DE482E6AD}',ST_GeomFromText('LINESTRING (1003846.3333731 245982.919022352, 1003846.4311651 245983.483502358)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,4,'2025410004',142,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{861AE752-161C-470A-AFCF-CAC278A3BEC5}',ST_GeomFromText('LINESTRING (1003932.85318118 245897.050734267, 1003793.79910105 245939.020142317)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,8900,'2025418900',128.93,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{F1740A6B-7B53-4B26-8984-7A80E31E4F5A}',ST_GeomFromText('LINESTRING (1004209.33010945 247120.101487413, 1004077.39001332 247159.33527945)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,132,'2025410132',71.29,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{B6041B20-CED9-4D81-B4A5-2207F581A9E5}',ST_GeomFromText('LINESTRING (1003888.89260514 246661.782638982, 1003904.87519716 246727.159663051)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,180,'2025410180',136.4,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{F6F3EC6B-D3D2-4AA7-A117-7D5FB574C03B}',ST_GeomFromText('LINESTRING (1003952.48300521 246370.145902708, 1004010.98182125 246492.208494827)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,8900,'2025418900',126.99,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{FD9349E0-DF24-49BB-812D-DD5E234CA89B}',ST_GeomFromText('LINESTRING (1003810.86662108 246139.698286504, 1003772.65734103 246014.115950376)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,123,'2025410123',19.91,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{646F8455-FC29-4C48-90A6-04278D39938A}',ST_GeomFromText('LINESTRING (1003810.86662108 246139.698286504, 1003817.40921308 246157.544046521)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,123,'2025410123',32.97,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{DEF8B0C6-9A7D-42F4-A97F-B26CA2C4D27C}',ST_GeomFromText('LINESTRING (1003798.39686106 245987.022702351, 1003765.69516502 245990.209134355)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,180,'2025410180',107.29,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{F418C60A-BDE9-4872-8BF0-557EAFA67665}',ST_GeomFromText('LINESTRING (1004138.90118139 246560.109934896, 1004103.92518134 246458.822510794)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,159,'2025410159',104.26,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{2DDC4A37-DEAE-4082-B760-0ABB7C3A51E6}',ST_GeomFromText('LINESTRING (1003888.89260514 246661.782638982, 1003993.06975724 246614.87499094)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,8900,'2025418900',32.97,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{8D1BBC6A-4536-4A47-B8B0-8A2C33D98913}',ST_GeomFromText('LINESTRING (1003765.69516502 245990.209134355, 1003798.39686106 245987.022702351)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,123,'2025410123',126.99,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{E4D8AB19-15B1-4F6D-B559-02DA20DB79B7}',ST_GeomFromText('LINESTRING (1003772.65734103 246014.115950376, 1003810.86662108 246139.698286504)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,122,'2025410122',300.61,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{50082E61-EF0C-4D9A-855E-D889FED6272E}',ST_GeomFromText('LINESTRING (1003787.45516504 246246.847342595, 1003860.63993312 246546.212718874)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,8900,'2025418900',178.11,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{C4BAB886-4F60-44C3-9064-63DC2B66B092}',ST_GeomFromText('LINESTRING (1003892.91743715 246321.485166669, 1003872.07058913 246281.764462635, 1003856.92383711 246250.651758596, 1003841.33036511 246216.242542565, 1003830.4603491 246190.568558544, 1003817.40921308 246157.544046521)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,180,'2025410180',0,1,0,2,NULL,NULL,NULL,NULL,NULL,NULL,0,'{1AF8E34F-A546-4D7F-B4D5-0774CE9896D2}',ST_GeomFromText('LINESTRING (1003892.94406115 246136.837998495, 1003839.9597411 246141.743726507)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,4,'2025410004',0,1,0,2,NULL,NULL,NULL,NULL,NULL,NULL,0,'{35DF883A-82F6-4A16-BE2A-8CA23E92A2A0}',ST_GeomFromText('LINESTRING (1003881.32319714 246106.890094474, 1003872.79481313 246084.226670444, 1003866.35692513 246065.053038433, 1003860.18937312 246044.39639841, 1003854.92652512 246024.278638393, 1003850.60934111 246005.262958378, 1003846.4311651 245983.483502358, 1003846.3333731 245982.919022352)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,8900,'2025418900',128.81,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{6D4812A0-512E-4C22-8ADC-7CF5E32EE881}',ST_GeomFromText('LINESTRING (1004262.4465255 247169.289071456, 1004290.09222151 247234.031983525, 1004309.14476554 247280.243823558)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,8900,'2025418900',718.05,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{84C2EDCC-81C3-4B6C-8A14-23A98FFA251E}',ST_GeomFromText('LINESTRING (1004262.4465255 247169.289071456, 1003983.92722924 246501.926766843)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,122,'2025410122',86.22,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{601B8C76-773D-4B25-AD80-8F45508B4246}',ST_GeomFromText('LINESTRING (1003860.63993312 246546.212718874, 1003948.9235812 246514.500462845)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,123,'2025410123',115.85,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{5FBC4C53-A69F-4A95-B87F-FDCF197BAE93}',ST_GeomFromText('LINESTRING (1003952.48300521 246370.145902708, 1003898.03922915 246267.709550619)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,22,'2025410022',374.09,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{400DFA1B-0C89-4AF4-80F1-59DA99EC433F}',ST_GeomFromText('LINESTRING (1004066.11986931 246334.51991868, 1003956.97094122 245973.955694348)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,180,'2025410180',108.44,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{6D0EDE4E-7CAF-46E4-BBD6-C179A0EAB19F}',ST_GeomFromText('LINESTRING (1004290.09222151 247234.031983525, 1004390.59679762 247193.78545548)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,122,'2025410122',100.15,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{08A31EAB-36A8-4A85-A49F-1F5955B638A2}',ST_GeomFromText('LINESTRING (1003757.87846102 246149.343598515, 1003759.36121303 246153.837934509, 1003780.46866904 246218.268014565, 1003787.45516504 246246.847342595)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,8900,'2025418900',49.54,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{FD78CD1D-D462-478B-B4BA-AAE030FF172C}',ST_GeomFromText('LINESTRING (1003801.43532506 245986.520174354, 1003793.79910105 245939.020142317)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,132,'2025410132',360.85,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{955A56E3-2CC5-44F5-AEAE-5661182FC7A8}',ST_GeomFromText('LINESTRING (1003904.87519716 246727.159663051, 1003928.58591717 246812.728431121, 1003946.1982052 246869.558383182, 1003968.02374122 246930.423919231, 1003983.70450923 246968.639855266, 1003999.15078124 247003.636079296, 1004015.50508526 247038.201199338, 1004029.21286127 247065.302127361)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,3,'2025410003',0,1,0,2,NULL,NULL,NULL,NULL,NULL,NULL,0,'{D6BAF2D9-CE98-4965-8832-207BE5535D58}',ST_GeomFromText('LINESTRING (1003881.32319714 246106.890094474, 1003830.8202851 246111.272814468)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,123,'2025410123',113.62,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{E773F514-1C8D-4809-968A-3A453B4DC30A}',ST_GeomFromText('LINESTRING (1003936.18860519 246398.077294737, 1003981.87564524 246502.663790837)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,22,'2025410022',115.85,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{6914B40F-9BB6-47BD-9676-742A3313142D}',ST_GeomFromText('LINESTRING (1003943.0980452 246240.189550594, 1003996.62994924 246343.146862686)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,180,'2025410180',0,1,0,2,NULL,NULL,NULL,NULL,NULL,NULL,0,'{5974135C-5336-4E00-ABC5-8C65A4925781}',ST_GeomFromText('LINESTRING (1003943.0980452 246240.189550594, 1003932.89695719 246220.197486579, 1003924.99654117 246204.376430556, 1003916.17682917 246186.346606538, 1003908.47967717 246170.27902253, 1003900.30380516 246152.854126513, 1003892.94406115 246136.837998495)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,8900,'2025418900',108.32,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{B0AD1EC6-31F6-4585-B299-D9582DD23136}',ST_GeomFromText('LINESTRING (1003901.61631715 246418.751086757, 1003948.9235812 246514.500462845, 1003949.8382692 246516.340078846)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,180,'2025410180',675.98,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{2B071CAA-E24D-4CA3-A17A-7F0CFFD5C6A0}',ST_GeomFromText('LINESTRING (1004390.59679762 247193.78545548, 1004138.90118139 246560.109934896)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,22,'2025410022',143.76,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{4CA1A211-7B30-4895-A2D7-A399DD30ECB3}',ST_GeomFromText('LINESTRING (1003996.62994924 246343.146862686, 1004059.9466853 246474.619502813)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,180,'2025410180',115.85,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{0DC07492-624E-4992-B67A-CC2CC76E3B62}',ST_GeomFromText('LINESTRING (1003996.62994924 246343.146862686, 1003943.0980452 246240.189550594)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,8900,'2025418900',0,1,1,2,NULL,NULL,NULL,NULL,NULL,NULL,0,'{21EF75B3-4B7B-4C4C-95D8-961FD55667A3}',ST_GeomFromText('LINESTRING (1004409.01318163 247240.407407522, 1004390.59679762 247193.78545548)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,8900,'2025418900',89.59,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{9B3CC6DE-67DE-40C9-B052-9BB35F13DF6D}',ST_GeomFromText('LINESTRING (1003936.18860519 246398.077294737, 1003892.91743715 246321.485166669)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,8900,'2025418900',30.01,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{40289305-C07D-461F-BFCB-09CF654E0796}',ST_GeomFromText('LINESTRING (1003793.79910105 245939.020142317, 1003790.66873306 245939.921518311, 1003762.14623703 245947.482734323)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,123,'2025410123',281,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{739DF847-0908-4328-81D5-596D0475CAE8}',ST_GeomFromText('LINESTRING (1003898.03922915 246267.709550619, 1003878.03846113 246229.065582588, 1003865.06284513 246201.666670561, 1003855.49663712 246180.041070536, 1003848.04114911 246162.204782516, 1003839.9597411 246141.743726507, 1003830.8202851 246111.272814468, 1003801.19289306 245997.239406362)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,8900,'2025418900',19.91,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{E967CBD8-295C-40FE-BA34-3D90D46F2516}',ST_GeomFromText('LINESTRING (1003817.40921308 246157.544046521, 1003810.86662108 246139.698286504)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,159,'2025410159',86.22,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{457F7FF9-4277-42A3-8669-36A374F0B20D}',ST_GeomFromText('LINESTRING (1003948.9235812 246514.500462845, 1003860.63993312 246546.212718874)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,8900,'2025418900',2,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{9E1D2D37-C3A8-4F9D-9B01-C715D097CAFA}',ST_GeomFromText('LINESTRING (1003983.92722924 246501.926766843, 1003981.87564524 246502.663790837)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,8900,'2025418900',644.19,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{8DDD1249-143F-4690-AC84-A77A6DCA060D}',ST_GeomFromText('LINESTRING (1003452.03986874 245435.729261845, 1003566.48518084 245700.820846096, 1003604.44230089 245784.975214168, 1003641.49087691 245864.585326239, 1003683.29798095 245952.965230331, 1003700.44332497 245992.905838355, 1003717.88230099 246035.957358405)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,4,'2025410004',80.3,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{887D9996-79E4-4803-9A81-D50600E35DFA}',ST_GeomFromText('LINESTRING (1003956.97094122 245973.955694348, 1003932.85318118 245897.050734267)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,8900,'2025418900',0,1,1,2,NULL,NULL,NULL,NULL,NULL,NULL,0,'{754A8892-8521-4F57-A638-A3B77DCE21C2}',ST_GeomFromText('LINESTRING (1003591.66201288 245394.617709801, 1003587.10086086 245395.960685805, 1003452.03986874 245435.729261845)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,132,'2025410132',104.26,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{520ABA25-E7C9-432A-BB7F-6AB9D7F3A8ED}',ST_GeomFromText('LINESTRING (1003993.06975724 246614.87499094, 1003888.89260514 246661.782638982)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,8900,'2025418900',524.69,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{0746D44D-08AA-4B94-9148-992803174DBD}',ST_GeomFromText('LINESTRING (1003762.14623703 245947.482734323, 1003742.77446102 245884.662126258, 1003598.78162888 245417.705837831)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,8900,'2025418900',19.91,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{56243DAC-36AC-4413-85BF-0A5B4730E508}',ST_GeomFromText('LINESTRING (1003761.01753302 246149.053038508, 1003769.54514903 246166.929518521)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,122,'2025410122',19.91,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{DF9A28CB-8C45-4C61-BB04-712B5E929CA5}',ST_GeomFromText('LINESTRING (1003769.54514903 246166.929518521, 1003761.01753302 246149.053038508)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,8900,'2025418900',653.51,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{F6CF153A-9DA7-4A28-8C2D-9A6645B1F8D9}',ST_GeomFromText('LINESTRING (1003949.8382692 246516.340078846, 1003993.06975724 246614.87499094, 1004209.33010945 247120.101487413)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,8900,'2025418900',107.44,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{402F8CDC-E63E-4F39-BBF2-4E4419E6E93B}',ST_GeomFromText('LINESTRING (1004309.14476554 247280.243823558, 1004409.01318163 247240.407407522)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,8900,'2025418900',156.87,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{9AFA2E44-E052-4063-A61C-D8C445E6D458}',ST_GeomFromText('LINESTRING (1004167.11545341 247336.897903621, 1004309.14476554 247280.243823558)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,8900,'2025418900',165.75,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{6A00FE23-7052-4132-A2AF-A75E41E5D133}',ST_GeomFromText('LINESTRING (1004262.4465255 247169.289071456, 1004105.18444535 247214.370671496)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,123,'2025410123',0,1,0,2,NULL,NULL,NULL,NULL,NULL,NULL,0,'{0E09CAD4-B78F-4DFD-AF74-BF03E0191B81}',ST_GeomFromText('LINESTRING (1003981.87564524 246502.663790837, 1003983.92722924 246501.926766843, 1004010.98182125 246492.208494827)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,8900,'2025418900',165.75,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{703B8912-F910-46F8-B715-CB44C19622F5}',ST_GeomFromText('LINESTRING (1004105.18444535 247214.370671496, 1004262.4465255 247169.289071456)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,3,'2025410003',0,1,0,2,NULL,NULL,NULL,NULL,NULL,NULL,0,'{998C86C6-3AA6-4F92-9CF3-4D88FC9B15C3}',ST_GeomFromText('LINESTRING (1003892.94406115 246136.837998495, 1003881.32319714 246106.890094474)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,8900,'2025418900',22.76,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{CE0964B2-3733-4681-B131-C5AE58463CAE}',ST_GeomFromText('LINESTRING (1003772.65734103 246014.115950376, 1003765.69516502 245990.209134355)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,8900,'2025418900',0,1,0,2,NULL,NULL,NULL,NULL,NULL,NULL,0,'{C6DE93B3-22A0-42E1-B6F2-71E1B35E3956}',ST_GeomFromText('LINESTRING (1004290.09222151 247234.031983525, 1004309.14476554 247280.243823558)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,123,'2025410123',136.4,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{6F40428B-7836-4911-9CAA-2661ED2C0652}',ST_GeomFromText('LINESTRING (1004010.98182125 246492.208494827, 1003952.48300521 246370.145902708)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,4,'2025410004',101.13,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{8685843D-D2CD-4B33-96B1-9ED6C20C0A68}',ST_GeomFromText('LINESTRING (1003846.3333731 245982.919022352, 1003956.97094122 245973.955694348)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,159,'2025410159',2.1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{13A8CF5A-46E1-4F9E-B784-26BF5D8103B8}',ST_GeomFromText('LINESTRING (1003949.8382692 246516.340078846, 1003948.9235812 246514.500462845)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,22,'2025410022',25.01,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{324DB06F-0D51-4B8E-AF6D-3144FE60F930}',ST_GeomFromText('LINESTRING (1004082.53382133 246466.5063508, 1004103.92518134 246458.822510794)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,3,'2025410003',0,1,0,2,NULL,NULL,NULL,NULL,NULL,NULL,0,'{8884201A-5660-4D4B-A790-D99450CF6A83}',ST_GeomFromText('LINESTRING (1003839.9597411 246141.743726507, 1003892.94406115 246136.837998495)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,180,'2025410180',0,1,0,2,NULL,NULL,NULL,NULL,NULL,NULL,0,'{4618FE6C-D999-4E29-9B3F-FD302429849A}',ST_GeomFromText('LINESTRING (1003839.9597411 246141.743726507, 1003848.04114911 246162.204782516, 1003855.49663712 246180.041070536, 1003865.06284513 246201.666670561, 1003878.03846113 246229.065582588, 1003898.03922915 246267.709550619)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,22,'2025410022',78.5,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{10BCB92D-8CC2-407A-A2D5-1BF2614985B2}',ST_GeomFromText('LINESTRING (1004096.80710134 246406.57214275, 1004066.11986931 246334.51991868)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,22,'2025410022',51.5,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{7B0978CC-C26A-4F41-924B-2EECC47351CE}',ST_GeomFromText('LINESTRING (1004122.17798136 246452.265838787, 1004096.80710134 246406.57214275)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,132,'2025410132',128.93,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{D812BF43-D518-4982-A041-BB8DF82F2E6F}',ST_GeomFromText('LINESTRING (1004077.39001332 247159.33527945, 1004209.33010945 247120.101487413)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,8900,'2025418900',186.73,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{0C88DAE5-03A8-4FED-880F-438BF1369176}',ST_GeomFromText('LINESTRING (1003769.54514903 246166.929518521, 1003781.44326104 246192.106350541, 1003797.63730906 246228.026478589, 1003809.00575706 246252.2079826, 1003825.28633308 246284.274286628, 1003841.0257251 246314.01431866, 1003855.65510112 246340.642670691)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,8900,'2025418900',108.44,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{E926E457-E1F0-4782-8A86-E61D1FFE72E3}',ST_GeomFromText('LINESTRING (1004390.59679762 247193.78545548, 1004290.09222151 247234.031983525)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,4,'2025410004',0,1,0,2,NULL,NULL,NULL,NULL,NULL,NULL,0,'{1DB6BE40-D20C-4796-8A7B-C6951228B023}',ST_GeomFromText('LINESTRING (1003798.39686106 245987.022702351, 1003801.19289306 245997.239406362, 1003830.8202851 246111.272814468)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,132,'2025410132',105,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{816C773D-038A-49FC-AECB-7D454A58445E}',ST_GeomFromText('LINESTRING (1004029.21286127 247065.302127361, 1004033.62988529 247074.033519372, 1004041.24870129 247088.506223381, 1004050.32338929 247105.740655392, 1004077.39001332 247159.33527945)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,122,'2025410122',89.58,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{2CA647F6-6C5D-4DAC-B1B2-E0E4DCF5BA1E}',ST_GeomFromText('LINESTRING (1003901.61631715 246418.751086757, 1003855.65510112 246340.642670691)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,22,'2025410022',101.13,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{09D8504F-3228-4558-A285-AAC3550D923E}',ST_GeomFromText('LINESTRING (1003956.97094122 245973.955694348, 1003846.3333731 245982.919022352)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,4,'2025410004',0,1,0,2,NULL,NULL,NULL,NULL,NULL,NULL,0,'{B3D5E15D-4418-4CE2-BFFC-8A3A6318387E}',ST_GeomFromText('LINESTRING (1003830.8202851 246111.272814468, 1003881.32319714 246106.890094474)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,132,'2025410132',548.38,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{3931C2E7-C149-4B3E-ACEE-DC181A612D3C}',ST_GeomFromText('LINESTRING (1004209.33010945 247120.101487413, 1003993.06975724 246614.87499094)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,122,'2025410122',106.22,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{3683EFF4-2FFC-4CC2-BC32-A3FAB6B073ED}',ST_GeomFromText('LINESTRING (1003948.9235812 246514.500462845, 1003901.61631715 246418.751086757)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,3,'2025410003',0,1,0,2,NULL,NULL,NULL,NULL,NULL,NULL,0,'{A80D7DB2-44E2-4B9C-8E7E-BBC1800F8ED2}',ST_GeomFromText('LINESTRING (1003830.8202851 246111.272814468, 1003839.9597411 246141.743726507)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,122,'2025410122',186.73,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{87B33D08-A7FE-49FA-BDA5-83BE9BAD4E1C}',ST_GeomFromText('LINESTRING (1003855.65510112 246340.642670691, 1003841.0257251 246314.01431866, 1003825.28633308 246284.274286628, 1003809.00575706 246252.2079826, 1003797.63730906 246228.026478589, 1003781.44326104 246192.106350541, 1003769.54514903 246166.929518521)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,8900,'2025418900',89.58,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{E26348D6-89AC-4952-BA47-5FC9D975FDDA}',ST_GeomFromText('LINESTRING (1003855.65510112 246340.642670691, 1003901.61631715 246418.751086757)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,4,'2025410004',49.54,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{8365291E-2595-492B-A1C5-A14B6B3F3496}',ST_GeomFromText('LINESTRING (1003793.79910105 245939.020142317, 1003801.43532506 245986.520174354)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,159,'2025410159',113.47,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{B3CF3971-0234-429B-90C8-E882A902DFD9}',ST_GeomFromText('LINESTRING (1003860.63993312 246546.212718874, 1003888.89260514 246661.782638982)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,8900,'2025418900',143.67,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{184BF806-1FD1-49A5-8119-6160F1587658}',ST_GeomFromText('LINESTRING (1004105.18444535 247214.370671496, 1004167.11545341 247336.897903621)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,8900,'2025418900',60.78,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{5F43653F-D2A0-4414-8A37-718568A27F9D}',ST_GeomFromText('LINESTRING (1004077.39001332 247159.33527945, 1004105.18444535 247214.370671496)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,180,'2025410180',786.85,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{7B36B79A-C8A6-4E06-9C85-459CC63240ED}',ST_GeomFromText('LINESTRING (1003983.92722924 246501.926766843, 1004262.4465255 247169.289071456, 1004290.09222151 247234.031983525)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,22,'2025410022',19.1,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{7761089A-52FC-4BDC-990C-BAE6762400C9}',ST_GeomFromText('LINESTRING (1004103.92518134 246458.822510794, 1004122.17798136 246452.265838787)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,180,'2025410180',115.85,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{8145BBD9-854E-4A0C-A4EE-39BFCBF5A04F}',ST_GeomFromText('LINESTRING (1003898.03922915 246267.709550619, 1003952.48300521 246370.145902708)',2263));
insert into tax_lot_face
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,123,'2025410123',89.59,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{C1F5C7E9-4CEE-47B5-9951-61AB308101CA}',ST_GeomFromText('LINESTRING (1003892.91743715 246321.485166669, 1003936.18860519 246398.077294737)',2263));
-- Bronx block 2541 contd lot_face_point...
commit;
