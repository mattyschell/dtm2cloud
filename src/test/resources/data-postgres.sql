-- This is the "edited" data on temp scratch postgres database
-- will dump out as shp and toss over to an sde-like facsimile
-- I am artisinally hand-crafting data from dof_taxmap@geocdev and dof_dtm@geocdev
-- so pick a nice block and fc to fc it with sdo keyword from dof_taxmap to dof_dtm. 
-- Then get dumb with the txt below
--
-- 
--   select '(''' || boro || ''',' || block || ',' || lot || ',''' 
--   || bbl || ''',NULL,''' || regular_lot_indicator || ''',' || NUMBER_LOT_SIDES 
--   || ',''' || condo_flag || ''',''' || reuc_flag || ''',''' || air_rights_flag || ''',''' || SUBTERRANEAN_FLAG 
--   || ''',''' || EASEMENT_FLAG || ''',' || section_number || ',' || volume_number || ',' || page_number 
--   || ',''' || lot_note || ''',''' || NYCMAP_BLDG_FLAG || ''',''' || MISSING_RPAD_FLAG 
--   || ''',NULL,NULL,NULL,NULL,''' || LAST_MODIFIED_BY || ''',NULL,0,0,NULL,0,''' || GLOBALID || ''','
--   || 'ST_GeomFromText(''' || SDO_UTIL.TO_WKTGEOMETRY(shape) || ''',2263));'
--   from TAX_LOT_POLYGON_TMPSDO
---  where block = XXXX and boro = Y
--   order by lot
--
-- select 'insert into tax_block_polygon_scratch 
--   (boro, block, eop_overlap_flag, jagged_st_flag, 
--    created_by, created_date, last_modified_by, last_modified_date, 
--    section_number, volume_number, globalid, shape)
--   values '
--   || '(''' || boro || ''',' || block || ',' || eop_overlap_flag || ','
--          || jagged_st_flag || ',NULL,NULL,NULL,NULL,' || section_number || ',' || volume_number || ','''
--          || globalid || ''','
--          || 'ST_GeomFromText(''' || SDO_UTIL.TO_WKTGEOMETRY(shape) || ''',2263));'
-- from TAX_BLOCK_POLYGON_0829SDO
-- where boro = X and block = YYYY
--
-- select 'insert into tax_lot_face_scratch 
--   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
--    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
--    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
--   values '
--   || '(' || tax_lot_face_type || ',''' || boro || ''',' || block || ',' || lot || ','''
--   || bbl || ''',' || lot_face_length || ',' || source || ',' || block_face_flag || ','
--   || lot_face_length_error || ',NULL,NULL,NULL,NULL,' || av_change || ','
--   || bw_change || ',' || approx_length_flag || ',''' || globalid || ''','
--   || 'ST_GeomFromText(''' || mdsys.SDO_UTIL.TO_WKTGEOMETRY(shape) || ''',2263));'
-- from TAX_LOT_FACE_SCRATCH
-- where boro = X and block = YYYY
--
begin;
-------------------------------------
-- brooklyn block 2386
-- an archetypal merge
-- on August 22 2018 lots 12 and 14 (3023860012,3023860014)
-- merged into 7 (3023860007)
--------------------------------------
insert into tax_block_polygon_scratch 
(boro, block, eop_overlap_flag, jagged_st_flag, created_by, created_date, last_modified_by, last_modified_date, section_number, volume_number, globalid, shape)
values 
('3',2386,0,0,NULL,NULL,'LTP',NULL,8,5,'{CB124D70-A02D-47FE-9EFA-3CC76A04F08C}',
ST_GeomFromText('POLYGON ((997273.095094979 198597.187394217, 997317.713591024 198689.552194312, 997274.004918978 198710.47891432, 997226.337718934 198733.30080235, 997137.007542864 198776.070210382, 997045.673910767 198819.79859443, 997021.915062755 198770.338114381, 997010.855094746 198747.313474357, 997001.063862726 198726.930498347, 996956.838582695 198634.863426253, 996979.966134712 198623.825986251, 996997.543094725 198615.437634245, 997014.06175074 198607.554370224, 997031.197110757 198599.376450226, 997048.229558781 198591.248194218, 997070.242742792 198580.742466211, 997093.108662814 198569.829954192, 997116.568246841 198558.634306192, 997137.613494858 198548.590658173, 997165.057462886 198535.493442163, 997228.635318935 198505.151298136, 997273.095094979 198597.187394217))',2263)
);
-- Brooklyn block 2386 continued: internal lot polygons 
insert into tax_lot_polygon_scratch
(boro, block, lot, bbl, community_district, regular_lot_indicator, number_lot_sides, condo_flag, reuc_flag,
 air_rights_flag, subterranean_flag, easement_flag, section_number, volume_number, page_number, lot_note,  
 nycmap_bldg_flag, missing_rpad_flag, conversion_exception_flag, value_reflected_out_flag, created_by,
 created_date, last_modified_by, last_modified_date, av_change, bw_change, effective_tax_year, bill_bbl_flag,
 globalid, shape)
 values('3',2386,1,'3023860001',NULL,'I',0,'','','','','',8,5,7,'','1','0',NULL,NULL,NULL,NULL,'sj',NULL,0,0,NULL,0,'{6C3730FC-3020-493F-B1A0-1217CF0A300C}',ST_GeomFromText('POLYGON ((997069.975478798 198694.043458313, 997001.063862726 198726.930498347, 996956.838582695 198634.863426253, 996979.966134712 198623.825986251, 997015.759542748 198698.339650318, 997033.336502761 198689.951298311, 997049.854902774 198682.068034306, 997061.543606788 198676.489794299, 997069.975478798 198694.043458313))',2263));
insert into tax_lot_polygon_scratch
(boro, block, lot, bbl, community_district, regular_lot_indicator, number_lot_sides, condo_flag, reuc_flag,
 air_rights_flag, subterranean_flag, easement_flag, section_number, volume_number, page_number, lot_note,  
 nycmap_bldg_flag, missing_rpad_flag, conversion_exception_flag, value_reflected_out_flag, created_by,
 created_date, last_modified_by, last_modified_date, av_change, bw_change, effective_tax_year, bill_bbl_flag,
 globalid, shape)
 values('3',2386,2,'3023860002',NULL,'',0,'','','','','',8,5,7,'','0','0',NULL,NULL,NULL,NULL,'sj',NULL,0,0,NULL,0,'{74193D81-AA70-4765-A96C-7E91E291FC75}',ST_GeomFromText('POLYGON ((997102.24581483 198703.698242322, 997010.855094746 198747.313474357, 997001.063862726 198726.930498347, 997069.975478798 198694.043458313, 997075.422646806 198691.443778306, 997092.454838812 198683.315522298, 997102.24581483 198703.698242322))',2263));
insert into tax_lot_polygon_scratch
( boro, block, lot, bbl, community_district, regular_lot_indicator, number_lot_sides, condo_flag, reuc_flag,
 air_rights_flag, subterranean_flag, easement_flag, section_number, volume_number, page_number, lot_note,  
 nycmap_bldg_flag, missing_rpad_flag, conversion_exception_flag, value_reflected_out_flag, created_by,
 created_date, last_modified_by, last_modified_date, av_change, bw_change, effective_tax_year, bill_bbl_flag,
 globalid, shape)
 values('3',2386,3,'3023860003',NULL,'',0,'','','','','',8,5,7,'','1','0',NULL,NULL,NULL,NULL,'sj',NULL,0,0,NULL,0,'{8C14592F-875A-4E71-B988-DF20A973CD37}',ST_GeomFromText('POLYGON ((997113.306038842 198726.722626343, 997021.915062755 198770.338114381, 997010.855094746 198747.313474357, 997102.24581483 198703.698242322, 997113.306038842 198726.722626343))',2263));
insert into tax_lot_polygon_scratch
( boro, block, lot, bbl, community_district, regular_lot_indicator, number_lot_sides, condo_flag, reuc_flag,
 air_rights_flag, subterranean_flag, easement_flag, section_number, volume_number, page_number, lot_note,  
 nycmap_bldg_flag, missing_rpad_flag, conversion_exception_flag, value_reflected_out_flag, created_by,
 created_date, last_modified_by, last_modified_date, av_change, bw_change, effective_tax_year, bill_bbl_flag,
 globalid, shape)
 values('3',2386,4,'3023860004',NULL,'',0,'','','','','',8,5,7,'','0','0',NULL,NULL,NULL,NULL,'sj',NULL,0,0,NULL,0,'{51016302-0CFA-47FC-ACC7-4F56A9A59639}',ST_GeomFromText('POLYGON ((997137.007542864 198776.070210382, 997045.673910767 198819.79859443, 997021.915062755 198770.338114381, 997113.306038842 198726.722626343, 997137.007542864 198776.070210382))',2263));
insert into tax_lot_polygon_scratch
( boro, block, lot, bbl, community_district, regular_lot_indicator, number_lot_sides, condo_flag, reuc_flag,
 air_rights_flag, subterranean_flag, easement_flag, section_number, volume_number, page_number, lot_note,  
 nycmap_bldg_flag, missing_rpad_flag, conversion_exception_flag, value_reflected_out_flag, created_by,
 created_date, last_modified_by, last_modified_date, av_change, bw_change, effective_tax_year, bill_bbl_flag,
 globalid, shape)
 values('3',2386,7,'3023860007',NULL,'',0,'','','','','',8,5,7,'','1','0',NULL,NULL,NULL,NULL,'sj',NULL,0,0,NULL,0,'{F36C3699-7360-4011-99DB-4B586C047956}',ST_GeomFromText('POLYGON ((997317.713591024 198689.552194312, 997274.004918978 198710.47891432, 997226.337718934 198733.30080235, 997137.007542864 198776.070210382, 997113.306038842 198726.722626343, 997102.24581483 198703.698242322, 997092.454838812 198683.315522298, 997114.468022838 198672.809794292, 997137.33394286 198661.897282288, 997160.793526873 198650.701378271, 997181.838774905 198640.657730266, 997221.492406935 198621.733698249, 997229.534646943 198617.895490244, 997273.095094979 198597.187394217, 997317.713591024 198689.552194312))',2263));
insert into tax_lot_polygon_scratch
( boro, block, lot, bbl, community_district, regular_lot_indicator, number_lot_sides, condo_flag, reuc_flag,
 air_rights_flag, subterranean_flag, easement_flag, section_number, volume_number, page_number, lot_note,  
 nycmap_bldg_flag, missing_rpad_flag, conversion_exception_flag, value_reflected_out_flag, created_by,
 created_date, last_modified_by, last_modified_date, av_change, bw_change, effective_tax_year, bill_bbl_flag,
 globalid, shape)
 values('3',2386,18,'3023860018',NULL,'I',0,'','','','','',8,5,7,'','0','0',NULL,NULL,NULL,NULL,'sj',NULL,0,0,NULL,0,'{76DC2BAF-572D-45DC-BA8F-582522AAB5B9}',ST_GeomFromText('POLYGON ((997229.534646943 198617.895490244, 997221.492406935 198621.733698249, 997165.057462886 198535.493442163, 997228.635318935 198505.151298136, 997273.095094979 198597.187394217, 997229.534646943 198617.895490244))',2263));
insert into tax_lot_polygon_scratch
( boro, block, lot, bbl, community_district, regular_lot_indicator, number_lot_sides, condo_flag, reuc_flag,
 air_rights_flag, subterranean_flag, easement_flag, section_number, volume_number, page_number, lot_note,  
 nycmap_bldg_flag, missing_rpad_flag, conversion_exception_flag, value_reflected_out_flag, created_by,
 created_date, last_modified_by, last_modified_date, av_change, bw_change, effective_tax_year, bill_bbl_flag,
 globalid, shape)
 values('3',2386,21,'3023860021',NULL,'I',0,'','','','','',8,5,7,'','2','0',NULL,NULL,NULL,NULL,'sj',NULL,0,0,NULL,0,'{21774E39-E113-4F59-83E8-546DB53C5261}',ST_GeomFromText('POLYGON ((997181.838774905 198640.657730266, 997137.613494858 198548.590658173, 997165.057462886 198535.493442163, 997221.492406935 198621.733698249, 997181.838774905 198640.657730266))',2263));
insert into tax_lot_polygon_scratch
( boro, block, lot, bbl, community_district, regular_lot_indicator, number_lot_sides, condo_flag, reuc_flag,
 air_rights_flag, subterranean_flag, easement_flag, section_number, volume_number, page_number, lot_note,  
 nycmap_bldg_flag, missing_rpad_flag, conversion_exception_flag, value_reflected_out_flag, created_by,
 created_date, last_modified_by, last_modified_date, av_change, bw_change, effective_tax_year, bill_bbl_flag,
 globalid, shape)
 values('3',2386,23,'3023860023',NULL,'',0,'','','','','',8,5,7,'','1','0',NULL,NULL,NULL,NULL,'sj',NULL,0,0,NULL,0,'{E9C6FB4D-4BC5-43B0-A94B-6074ED8CFDC0}',ST_GeomFromText('POLYGON ((997160.793526873 198650.701378271, 997116.568246841 198558.634306192, 997137.613494858 198548.590658173, 997181.838774905 198640.657730266, 997160.793526873 198650.701378271))',2263));
insert into tax_lot_polygon_scratch
( boro, block, lot, bbl, community_district, regular_lot_indicator, number_lot_sides, condo_flag, reuc_flag,
 air_rights_flag, subterranean_flag, easement_flag, section_number, volume_number, page_number, lot_note,  
 nycmap_bldg_flag, missing_rpad_flag, conversion_exception_flag, value_reflected_out_flag, created_by,
 created_date, last_modified_by, last_modified_date, av_change, bw_change, effective_tax_year, bill_bbl_flag,
 globalid, shape)
 values('3',2386,24,'3023860024',NULL,'',0,'','','','','',8,5,7,'','1','0',NULL,NULL,NULL,NULL,'sj',NULL,0,0,NULL,0,'{10C4B99A-3D3C-4C46-8C67-D45FCC9DCBE1}',ST_GeomFromText('POLYGON ((997116.568246841 198558.634306192, 997160.793526873 198650.701378271, 997137.33394286 198661.897282288, 997093.108662814 198569.829954192, 997116.568246841 198558.634306192))',2263));
insert into tax_lot_polygon_scratch
( boro, block, lot, bbl, community_district, regular_lot_indicator, number_lot_sides, condo_flag, reuc_flag,
 air_rights_flag, subterranean_flag, easement_flag, section_number, volume_number, page_number, lot_note,  
 nycmap_bldg_flag, missing_rpad_flag, conversion_exception_flag, value_reflected_out_flag, created_by,
 created_date, last_modified_by, last_modified_date, av_change, bw_change, effective_tax_year, bill_bbl_flag,
 globalid, shape)
 values('3',2386,25,'3023860025',NULL,'',0,'','','','','',8,5,7,'','1','0',NULL,NULL,NULL,NULL,'sj',NULL,0,0,NULL,0,'{67F2825C-0C47-4EB5-9034-237A7223AC13}',ST_GeomFromText('POLYGON ((997070.242742792 198580.742466211, 997093.108662814 198569.829954192, 997137.33394286 198661.897282288, 997114.468022838 198672.809794292, 997070.242742792 198580.742466211))',2263));
insert into tax_lot_polygon_scratch
( boro, block, lot, bbl, community_district, regular_lot_indicator, number_lot_sides, condo_flag, reuc_flag,
 air_rights_flag, subterranean_flag, easement_flag, section_number, volume_number, page_number, lot_note,  
 nycmap_bldg_flag, missing_rpad_flag, conversion_exception_flag, value_reflected_out_flag, created_by,
 created_date, last_modified_by, last_modified_date, av_change, bw_change, effective_tax_year, bill_bbl_flag,
 globalid, shape)
 values('3',2386,26,'3023860026',NULL,'',0,'','','','','',8,5,7,'','1','0',NULL,NULL,NULL,NULL,'sj',NULL,0,0,NULL,0,'{CC3F2565-96EA-4953-A97C-5B55A5209354}',ST_GeomFromText('POLYGON ((997114.468022838 198672.809794292, 997092.454838812 198683.315522298, 997048.229558781 198591.248194218, 997070.242742792 198580.742466211, 997114.468022838 198672.809794292))',2263));
insert into tax_lot_polygon_scratch
( boro, block, lot, bbl, community_district, regular_lot_indicator, number_lot_sides, condo_flag, reuc_flag,
 air_rights_flag, subterranean_flag, easement_flag, section_number, volume_number, page_number, lot_note,  
 nycmap_bldg_flag, missing_rpad_flag, conversion_exception_flag, value_reflected_out_flag, created_by,
 created_date, last_modified_by, last_modified_date, av_change, bw_change, effective_tax_year, bill_bbl_flag,
 globalid, shape)
 values('3',2386,27,'3023860027',NULL,'',0,'','','','','',8,5,7,'','0','0',NULL,NULL,NULL,NULL,'sj',NULL,0,0,NULL,0,'{D0E70451-5AD2-44A4-A7CD-3C3D29518200}',ST_GeomFromText('POLYGON ((997092.454838812 198683.315522298, 997075.422646806 198691.443778306, 997031.197110757 198599.376450226, 997048.229558781 198591.248194218, 997092.454838812 198683.315522298))',2263));
insert into tax_lot_polygon_scratch
( boro, block, lot, bbl, community_district, regular_lot_indicator, number_lot_sides, condo_flag, reuc_flag,
 air_rights_flag, subterranean_flag, easement_flag, section_number, volume_number, page_number, lot_note,  
 nycmap_bldg_flag, missing_rpad_flag, conversion_exception_flag, value_reflected_out_flag, created_by,
 created_date, last_modified_by, last_modified_date, av_change, bw_change, effective_tax_year, bill_bbl_flag,
 globalid, shape)
 values('3',2386,28,'3023860028',NULL,'I',0,'','','','','',8,5,7,'','1','0',NULL,NULL,NULL,NULL,'sj',NULL,0,0,NULL,0,'{DB198F5C-CF64-4804-95DF-B61C2652C473}',ST_GeomFromText('POLYGON ((997075.422646806 198691.443778306, 997069.975478798 198694.043458313, 997061.543606788 198676.489794299, 997049.854902774 198682.068034306, 997014.06175074 198607.554370224, 997031.197110757 198599.376450226, 997075.422646806 198691.443778306))',2263));
insert into tax_lot_polygon_scratch
( boro, block, lot, bbl, community_district, regular_lot_indicator, number_lot_sides, condo_flag, reuc_flag,
 air_rights_flag, subterranean_flag, easement_flag, section_number, volume_number, page_number, lot_note,  
 nycmap_bldg_flag, missing_rpad_flag, conversion_exception_flag, value_reflected_out_flag, created_by,
 created_date, last_modified_by, last_modified_date, av_change, bw_change, effective_tax_year, bill_bbl_flag,
 globalid, shape)
 values('3',2386,29,'3023860029',NULL,'',0,'','','','','',8,5,7,'','1','0',NULL,NULL,NULL,NULL,'sj',NULL,0,0,NULL,0,'{D9B71D84-E35C-4AC5-923D-09C74834DC55}',ST_GeomFromText('POLYGON ((997014.06175074 198607.554370224, 997049.854902774 198682.068034306, 997033.336502761 198689.951298311, 996997.543094725 198615.437634245, 997014.06175074 198607.554370224))',2263));
insert into tax_lot_polygon_scratch
( boro, block, lot, bbl, community_district, regular_lot_indicator, number_lot_sides, condo_flag, reuc_flag,
 air_rights_flag, subterranean_flag, easement_flag, section_number, volume_number, page_number, lot_note,  
 nycmap_bldg_flag, missing_rpad_flag, conversion_exception_flag, value_reflected_out_flag, created_by,
 created_date, last_modified_by, last_modified_date, av_change, bw_change, effective_tax_year, bill_bbl_flag,
 globalid, shape)
 values('3',2386,129,'3023860129',NULL,'',0,'','','','','',8,5,7,'','0','0',NULL,NULL,NULL,NULL,'sj',NULL,0,0,NULL,0,'{D2A58B1B-5E7A-4E9D-A170-768C1F305839}',ST_GeomFromText('POLYGON ((997015.759542748 198698.339650318, 996979.966134712 198623.825986251, 996997.543094725 198615.437634245, 997033.336502761 198689.951298311, 997015.759542748 198698.339650318))',2263));
 --Brooklyn block 2386 continued: tax_lot_face (lines)
 insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'3',2386,24,'3023860024',100,0,0,0,NULL,NULL,NULL,NULL,0,0,0,'{502FE3A3-3D27-42BD-9982-B57BC31797B7}',ST_GeomFromText('LINESTRING (997160.793526873 198650.701378271, 997116.568246841 198558.634306192)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'3',2386,7,'3023860007',100,0,1,0,NULL,NULL,NULL,NULL,0,0,0,'{5015CB22-C2D7-4154-9335-DD0BAFE89986}',ST_GeomFromText('LINESTRING (997317.713591024 198689.552194312, 997273.095094979 198597.187394217)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'3',2386,29,'3023860029',80,0,0,0,NULL,NULL,NULL,NULL,0,0,0,'{B6531132-8097-4862-959F-D9E2C02CA881}',ST_GeomFromText('LINESTRING (997049.854902774 198682.068034306, 997014.06175074 198607.554370224)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'3',2386,18,'3023860018',70,0,1,0,NULL,NULL,NULL,NULL,0,0,0,'{D82A39CB-3527-419E-BF2C-0F98DFE0C8EA}',ST_GeomFromText('LINESTRING (997228.635318935 198505.151298136, 997165.057462886 198535.493442163)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'3',2386,1,'3023860001',20,0,0,0,NULL,NULL,NULL,NULL,0,0,0,'{4FF3C921-B952-4CC1-92D6-14F004AA9244}',ST_GeomFromText('LINESTRING (997069.975478798 198694.043458313, 997061.543606788 198676.489794299)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'3',2386,26,'3023860026',25,0,0,0,NULL,NULL,NULL,NULL,0,0,0,'{DD1A5FFB-9303-4FBA-9D13-327C8D687D3C}',ST_GeomFromText('LINESTRING (997092.454838812 198683.315522298, 997114.468022838 198672.809794292)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'3',2386,21,'3023860021',30,0,1,0,NULL,NULL,NULL,NULL,0,0,0,'{F91E35FD-9751-4C9E-BC76-F374DEF4FCB8}',ST_GeomFromText('LINESTRING (997165.057462886 198535.493442163, 997137.613494858 198548.590658173)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'3',2386,27,'3023860027',18.75,0,0,0,NULL,NULL,NULL,NULL,0,0,0,'{71B56A2F-B0D0-4D69-8E3B-12DB0D28F696}',ST_GeomFromText('LINESTRING (997075.422646806 198691.443778306, 997092.454838812 198683.315522298)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'3',2386,1,'3023860001',100,0,1,0,NULL,NULL,NULL,NULL,0,0,0,'{BDF80A64-72E3-4F7D-939C-2AECBE18F7AA}',ST_GeomFromText('LINESTRING (996956.838582695 198634.863426253, 997001.063862726 198726.930498347)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'3',2386,28,'3023860028',18.75,0,1,0,NULL,NULL,NULL,NULL,0,0,0,'{D956A81E-FAC0-44A6-AAD9-43FA6FFE19C4}',ST_GeomFromText('LINESTRING (997031.197110757 198599.376450226, 997014.06175074 198607.554370224)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'3',2386,18,'3023860018',56.25,0,0,0,NULL,NULL,NULL,NULL,0,0,0,'{52B9BEED-E0EE-4C20-83A0-0C300E4CE8E2}',ST_GeomFromText('LINESTRING (997221.492406935 198621.733698249, 997229.534646943 198617.895490244, 997273.095094979 198597.187394217)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'3',2386,28,'3023860028',80,0,0,0,NULL,NULL,NULL,NULL,0,0,0,'{005F9ABA-DB77-4646-A0FC-9FE8B4ABC332}',ST_GeomFromText('LINESTRING (997014.06175074 198607.554370224, 997049.854902774 198682.068034306)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'3',2386,26,'3023860026',100,0,0,0,NULL,NULL,NULL,NULL,0,0,0,'{16711554-03EA-49D5-9696-80514CAAD6B4}',ST_GeomFromText('LINESTRING (997114.468022838 198672.809794292, 997070.242742792 198580.742466211)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'3',2386,1,'3023860001',25,0,1,0,NULL,NULL,NULL,NULL,0,0,0,'{13A3422A-6CA8-447D-8730-10267F80C0EA}',ST_GeomFromText('LINESTRING (996979.966134712 198623.825986251, 996956.838582695 198634.863426253)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'3',2386,21,'3023860021',0,1,0,2,NULL,NULL,NULL,NULL,0,0,0,'{F5978115-7C9E-44E1-8ADB-EA260F4DEFF2}',ST_GeomFromText('LINESTRING (997221.492406935 198621.733698249, 997165.057462886 198535.493442163)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'3',2386,29,'3023860029',80,0,0,0,NULL,NULL,NULL,NULL,0,0,0,'{D02C25E9-CD2C-4DC5-B555-D30DA7195BB9}',ST_GeomFromText('LINESTRING (996997.543094725 198615.437634245, 997033.336502761 198689.951298311)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'3',2386,1,'3023860001',50,0,0,0,NULL,NULL,NULL,NULL,0,0,0,'{54FEB561-72C3-4433-9C6D-1430C35C57E9}',ST_GeomFromText('LINESTRING (997061.543606788 198676.489794299, 997049.854902774 198682.068034306, 997033.336502761 198689.951298311, 997015.759542748 198698.339650318)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'3',2386,129,'3023860129',18.75,0,1,0,NULL,NULL,NULL,NULL,0,0,0,'{5379B492-6A99-4526-B7B7-39C942D9FFA5}',ST_GeomFromText('LINESTRING (996997.543094725 198615.437634245, 996979.966134712 198623.825986251)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'3',2386,23,'3023860023',25,0,1,0,NULL,NULL,NULL,NULL,0,0,0,'{C214DB6E-3EC7-44BA-95C8-EE939BB08471}',ST_GeomFromText('LINESTRING (997137.613494858 198548.590658173, 997116.568246841 198558.634306192)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'3',2386,25,'3023860025',24.5,0,0,0,NULL,NULL,NULL,NULL,0,0,0,'{452C90A1-BC3A-4AAC-9C7E-20CE0C405D43}',ST_GeomFromText('LINESTRING (997114.468022838 198672.809794292, 997137.33394286 198661.897282288)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'3',2386,23,'3023860023',100,0,0,0,NULL,NULL,NULL,NULL,0,0,0,'{E7F16AE7-D45A-46D4-B05C-55342A94ABA2}',ST_GeomFromText('LINESTRING (997116.568246841 198558.634306192, 997160.793526873 198650.701378271)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'3',2386,2,'3023860002',100,0,0,0,NULL,NULL,NULL,NULL,0,0,0,'{B73D5CB2-4520-49DD-BD1F-AE6A35835074}',ST_GeomFromText('LINESTRING (997010.855094746 198747.313474357, 997102.24581483 198703.698242322)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'3',2386,3,'3023860003',100,0,0,0,NULL,NULL,NULL,NULL,0,0,0,'{B3DFFB38-16B4-411E-A385-0D8B438ADA7A}',ST_GeomFromText('LINESTRING (997102.24581483 198703.698242322, 997010.855094746 198747.313474357)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'3',2386,28,'3023860028',6.25,0,0,0,NULL,NULL,NULL,NULL,0,0,0,'{86B6215B-C3E2-4EA3-B698-F9DFD2249FC8}',ST_GeomFromText('LINESTRING (997069.975478798 198694.043458313, 997075.422646806 198691.443778306)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'3',2386,4,'3023860004',100,0,0,0,NULL,NULL,NULL,NULL,0,0,0,'{71A0D530-7C01-4EDA-BA3F-97933A208054}',ST_GeomFromText('LINESTRING (997113.306038842 198726.722626343, 997021.915062755 198770.338114381)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'3',2386,1,'3023860001',75,0,0,0,NULL,NULL,NULL,NULL,0,0,0,'{4167711D-9D85-403D-BE06-AD19CB447196}',ST_GeomFromText('LINESTRING (997001.063862726 198726.930498347, 997069.975478798 198694.043458313)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'3',2386,23,'3023860023',25,0,0,0,NULL,NULL,NULL,NULL,0,0,0,'{7C2AF651-D880-4433-ADAB-B8F5009C1A20}',ST_GeomFromText('LINESTRING (997160.793526873 198650.701378271, 997181.838774905 198640.657730266)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'3',2386,3,'3023860003',25,0,1,0,NULL,NULL,NULL,NULL,0,0,0,'{FC96419E-F44B-4344-8EB8-DEBEAAC24044}',ST_GeomFromText('LINESTRING (997010.855094746 198747.313474357, 997021.915062755 198770.338114381)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'3',2386,129,'3023860129',18.75,0,0,0,NULL,NULL,NULL,NULL,0,0,0,'{8CF58B15-8664-480D-804D-5376E48C7BAE}',ST_GeomFromText('LINESTRING (997015.759542748 198698.339650318, 997033.336502761 198689.951298311)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'3',2386,4,'3023860004',100,0,1,0,NULL,NULL,NULL,NULL,0,0,0,'{5879DD78-1278-4046-A504-E42A0DC7B281}',ST_GeomFromText('LINESTRING (997045.673910767 198819.79859443, 997137.007542864 198776.070210382)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'3',2386,24,'3023860024',25.5,0,0,0,NULL,NULL,NULL,NULL,0,0,0,'{D32D2415-A074-4D0B-982A-BBD8D2E32370}',ST_GeomFromText('LINESTRING (997137.33394286 198661.897282288, 997160.793526873 198650.701378271)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'3',2386,1,'3023860001',80,0,0,0,NULL,NULL,NULL,NULL,0,0,0,'{26C22AB9-C256-445D-81BA-10286A61B3D2}',ST_GeomFromText('LINESTRING (997015.759542748 198698.339650318, 996979.966134712 198623.825986251)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'3',2386,21,'3023860021',100,0,0,0,NULL,NULL,NULL,NULL,0,0,0,'{D95707CB-1414-49F3-9B00-4F241817FE10}',ST_GeomFromText('LINESTRING (997137.613494858 198548.590658173, 997181.838774905 198640.657730266)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'3',2386,4,'3023860004',50,0,0,0,NULL,NULL,NULL,NULL,0,0,0,'{C8E13191-6155-45A4-BE81-FF4A2AA7A330}',ST_GeomFromText('LINESTRING (997137.007542864 198776.070210382, 997113.306038842 198726.722626343)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'3',2386,27,'3023860027',100,0,0,0,NULL,NULL,NULL,NULL,0,0,0,'{20239EBB-A9FA-4A1A-81BB-11E435A4E6C3}',ST_GeomFromText('LINESTRING (997092.454838812 198683.315522298, 997048.229558781 198591.248194218)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'3',2386,29,'3023860029',18.75,0,0,0,NULL,NULL,NULL,NULL,0,0,0,'{F2359BE0-AEBF-43D2-A581-967FA869F975}',ST_GeomFromText('LINESTRING (997033.336502761 198689.951298311, 997049.854902774 198682.068034306)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'3',2386,129,'3023860129',80,0,0,0,NULL,NULL,NULL,NULL,0,0,0,'{222B6767-27F8-4F8E-A7F8-DA9088ABE0FC}',ST_GeomFromText('LINESTRING (996979.966134712 198623.825986251, 997015.759542748 198698.339650318)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'3',2386,18,'3023860018',0,1,0,2,NULL,NULL,NULL,NULL,0,0,0,'{D0CCB34E-5ECA-4969-84EC-B04E3B783080}',ST_GeomFromText('LINESTRING (997165.057462886 198535.493442163, 997221.492406935 198621.733698249)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'3',2386,7,'3023860007',200,0,1,0,NULL,NULL,NULL,NULL,0,0,0,'{7A765397-65B5-4C90-9FF7-C632041DCDF9}',ST_GeomFromText('LINESTRING (997137.007542864 198776.070210382, 997226.337718934 198733.30080235, 997274.004918978 198710.47891432, 997317.713591024 198689.552194312)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'3',2386,26,'3023860026',25,0,1,0,NULL,NULL,NULL,NULL,0,0,0,'{E46D026A-2DB8-43EA-986D-F76DBF40C602}',ST_GeomFromText('LINESTRING (997070.242742792 198580.742466211, 997048.229558781 198591.248194218)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'3',2386,3,'3023860003',25,0,0,0,NULL,NULL,NULL,NULL,0,0,0,'{05839199-C2C4-414B-957E-B8D6B44278E5}',ST_GeomFromText('LINESTRING (997113.306038842 198726.722626343, 997102.24581483 198703.698242322)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'3',2386,28,'3023860028',20,0,0,0,NULL,NULL,NULL,NULL,0,0,0,'{C0FCB16A-C941-448C-9FFE-0DE020B69816}',ST_GeomFromText('LINESTRING (997061.543606788 198676.489794299, 997069.975478798 198694.043458313)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'3',2386,4,'3023860004',50,0,1,0,NULL,NULL,NULL,NULL,0,0,0,'{FBBAD8DD-0701-4E82-8C76-EC3B6574F8F6}',ST_GeomFromText('LINESTRING (997021.915062755 198770.338114381, 997045.673910767 198819.79859443)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'3',2386,2,'3023860002',100,0,0,0,NULL,NULL,NULL,NULL,0,0,0,'{4661212C-E0B9-4334-8974-D3B5D4E425C8}',ST_GeomFromText('LINESTRING (997092.454838812 198683.315522298, 997075.422646806 198691.443778306, 997069.975478798 198694.043458313, 997001.063862726 198726.930498347)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'3',2386,25,'3023860025',100,0,0,0,NULL,NULL,NULL,NULL,0,0,0,'{0AFD7A59-7900-4E7A-B5C2-8C4859553A71}',ST_GeomFromText('LINESTRING (997137.33394286 198661.897282288, 997093.108662814 198569.829954192)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'3',2386,7,'3023860007',100,0,0,0,NULL,NULL,NULL,NULL,0,0,0,'{A47D88B3-488E-4CA0-97CD-538D4687105F}',ST_GeomFromText('LINESTRING (997092.454838812 198683.315522298, 997102.24581483 198703.698242322, 997113.306038842 198726.722626343, 997137.007542864 198776.070210382)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'3',2386,27,'3023860027',18.75,0,1,0,NULL,NULL,NULL,NULL,0,0,0,'{990ACE95-C6D7-4BFA-BF11-43CAF55BC3C2}',ST_GeomFromText('LINESTRING (997048.229558781 198591.248194218, 997031.197110757 198599.376450226)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'3',2386,29,'3023860029',18.75,0,1,0,NULL,NULL,NULL,NULL,0,0,0,'{23570EF1-F4FD-47DD-A66A-AC8EE51B61A2}',ST_GeomFromText('LINESTRING (997014.06175074 198607.554370224, 996997.543094725 198615.437634245)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'3',2386,2,'3023860002',25,0,1,0,NULL,NULL,NULL,NULL,0,0,0,'{78551E19-DA97-4D31-B4E0-B6B65FE76EAF}',ST_GeomFromText('LINESTRING (997001.063862726 198726.930498347, 997010.855094746 198747.313474357)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'3',2386,7,'3023860007',200,0,0,0,NULL,NULL,NULL,NULL,0,0,0,'{22F1D377-C35E-40BE-BBBC-7B846B4A9A71}',ST_GeomFromText('LINESTRING (997273.095094979 198597.187394217, 997229.534646943 198617.895490244, 997221.492406935 198621.733698249, 997181.838774905 198640.657730266, 997160.793526873 198650.701378271, 997137.33394286 198661.897282288, 997114.468022838 198672.809794292, 997092.454838812 198683.315522298)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'3',2386,26,'3023860026',100,0,0,0,NULL,NULL,NULL,NULL,0,0,0,'{8074F963-887E-4B2A-8445-42108522AF93}',ST_GeomFromText('LINESTRING (997048.229558781 198591.248194218, 997092.454838812 198683.315522298)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'3',2386,28,'3023860028',100,0,0,0,NULL,NULL,NULL,NULL,0,0,0,'{9FA82C5C-C9CA-4065-B687-534842BD7975}',ST_GeomFromText('LINESTRING (997075.422646806 198691.443778306, 997031.197110757 198599.376450226)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'3',2386,2,'3023860002',25,0,0,0,NULL,NULL,NULL,NULL,0,0,0,'{45F42701-19E9-4B11-AAF9-D72720A4872B}',ST_GeomFromText('LINESTRING (997102.24581483 198703.698242322, 997092.454838812 198683.315522298)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'3',2386,21,'3023860021',0,1,0,2,NULL,NULL,NULL,NULL,0,0,0,'{FB21F1D6-D2C4-41F0-ACCD-E1DA7EDD95E5}',ST_GeomFromText('LINESTRING (997181.838774905 198640.657730266, 997221.492406935 198621.733698249)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'3',2386,27,'3023860027',100,0,0,0,NULL,NULL,NULL,NULL,0,0,0,'{C85762A8-B7F7-4F3B-85E2-A252C01ED865}',ST_GeomFromText('LINESTRING (997031.197110757 198599.376450226, 997075.422646806 198691.443778306)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'3',2386,24,'3023860024',25.5,0,1,0,NULL,NULL,NULL,NULL,0,0,0,'{12F26C0C-C108-4C6A-9C68-20928D8D59F4}',ST_GeomFromText('LINESTRING (997116.568246841 198558.634306192, 997093.108662814 198569.829954192)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'3',2386,28,'3023860028',12.5,0,0,0,NULL,NULL,NULL,NULL,0,0,0,'{3B9ABBA7-ACC6-4297-9638-A8DFB7955783}',ST_GeomFromText('LINESTRING (997049.854902774 198682.068034306, 997061.543606788 198676.489794299)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'3',2386,24,'3023860024',100,0,0,0,NULL,NULL,NULL,NULL,0,0,0,'{4BCAFC43-C72F-465F-A585-C7F3A6F43B22}',ST_GeomFromText('LINESTRING (997093.108662814 198569.829954192, 997137.33394286 198661.897282288)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'3',2386,129,'3023860129',80,0,0,0,NULL,NULL,NULL,NULL,0,0,0,'{1B573335-F511-4020-A7BA-C80B85E9AB41}',ST_GeomFromText('LINESTRING (997033.336502761 198689.951298311, 996997.543094725 198615.437634245)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'3',2386,23,'3023860023',100,0,0,0,NULL,NULL,NULL,NULL,0,0,0,'{78093FCE-3581-480D-B9DE-41A22A6D085B}',ST_GeomFromText('LINESTRING (997181.838774905 198640.657730266, 997137.613494858 198548.590658173)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'3',2386,18,'3023860018',100,0,1,0,NULL,NULL,NULL,NULL,0,0,0,'{61457E79-78D5-4952-8550-900FDF3DC2E8}',ST_GeomFromText('LINESTRING (997273.095094979 198597.187394217, 997228.635318935 198505.151298136)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'3',2386,25,'3023860025',100,0,0,0,NULL,NULL,NULL,NULL,0,0,0,'{117797CD-7869-498B-BD05-4CBD0C16A1EC}',ST_GeomFromText('LINESTRING (997070.242742792 198580.742466211, 997114.468022838 198672.809794292)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'3',2386,3,'3023860003',100,0,0,0,NULL,NULL,NULL,NULL,0,0,0,'{A0FBDAEF-6CF5-4100-A298-334FBF7BA841}',ST_GeomFromText('LINESTRING (997021.915062755 198770.338114381, 997113.306038842 198726.722626343)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'3',2386,25,'3023860025',24.5,0,1,0,NULL,NULL,NULL,NULL,0,0,0,'{2E1DF8ED-83A8-4F95-A2F7-DB80A2079E02}',ST_GeomFromText('LINESTRING (997093.108662814 198569.829954192, 997070.242742792 198580.742466211)',2263));
 ---------------------------------------------------------------------
 -- Bronx block 2541
 -- An interesting critter because 3 lots have identical BBLs (2025418900)
 -- In the test target these three bbls look "merged" (matching legacy prod)
 -- So without noting the duplicate BBLs this will look like a lot in the source that has been split
 -- My understanding is that the ETL should do nothing here -- the 3 lots on the target 
 --    that have been dissolved are intended that way for display of the subject triplicate lot
 -- (Or these and similar scenarios could be garbage data) 
 ---------------------------------------------------------------------
insert into tax_block_polygon_scratch 
( boro, block, eop_overlap_flag, jagged_st_flag, 
 created_by, created_date, last_modified_by, last_modified_date, 
 section_number, volume_number, globalid, shape)
values ('2',2541,1,0,NULL,NULL,NULL,NULL,9,9,'{810BAB14-0425-4F13-800F-DF7D480CC117}',ST_GeomFromText('POLYGON ((1003956.97094122 245973.955694348, 1004066.11986931 246334.51991868, 1004096.80710134 246406.57214275, 1004122.17798136 246452.265838787, 1004103.92518134 246458.822510794, 1004138.90118139 246560.109934896, 1004390.59679762 247193.78545548, 1004409.01318163 247240.407407522, 1004309.14476554 247280.243823558, 1004167.11545341 247336.897903621, 1004105.18444535 247214.370671496, 1004077.39001332 247159.33527945, 1004050.32338929 247105.740655392, 1004041.24870129 247088.506223381, 1004033.62988529 247074.033519372, 1004029.21286127 247065.302127361, 1004015.50508526 247038.201199338, 1003999.15078124 247003.636079296, 1003983.70450923 246968.639855266, 1003968.02374122 246930.423919231, 1003946.1982052 246869.558383182, 1003928.58591717 246812.728431121, 1003904.87519716 246727.159663051, 1003888.89260514 246661.782638982, 1003860.63993312 246546.212718874, 1003787.45516504 246246.847342595, 1003780.46866904 246218.268014565, 1003759.36121303 246153.837934509, 1003757.87846102 246149.343598515, 1003743.85094102 246106.823278472, 1003721.24153298 246044.250478417, 1003717.88230099 246035.957358405, 1003700.44332497 245992.905838355, 1003683.29798095 245952.965230331, 1003641.49087691 245864.585326239, 1003604.44230089 245784.975214168, 1003566.48518084 245700.820846096, 1003452.03986874 245435.729261845, 1003587.10086086 245395.960685805, 1003591.66201288 245394.617709801, 1003598.78162888 245417.705837831, 1003742.77446102 245884.662126258, 1003762.14623703 245947.482734323, 1003790.66873306 245939.921518311, 1003793.79910105 245939.020142317, 1003932.85318118 245897.050734267, 1003956.97094122 245973.955694348))',2263));
 -- Bronx block 2541 continued, internal lots:
insert into tax_lot_polygon_scratch 
( boro, block, lot, bbl, community_district, regular_lot_indicator, number_lot_sides, condo_flag, reuc_flag,
 air_rights_flag, subterranean_flag, easement_flag, section_number, volume_number, page_number, lot_note,  
 nycmap_bldg_flag, missing_rpad_flag, conversion_exception_flag, value_reflected_out_flag, created_by,
 created_date, last_modified_by, last_modified_date, av_change, bw_change, effective_tax_year, bill_bbl_flag,
 globalid, shape)
 values 
 ('2',2541,3,'2025410003',NULL,'I',0,'','R','','','E',9,9,18,'','0','0',NULL,NULL,NULL,NULL,'sj',NULL,0,0,NULL,0,'{2FEF3F17-9694-4F16-9363-B04A2D7FC1E0}',ST_GeomFromText('POLYGON ((1003892.94406115 246136.837998495, 1003839.9597411 246141.743726507, 1003830.8202851 246111.272814468, 1003881.32319714 246106.890094474, 1003892.94406115 246136.837998495))',2263));
insert into tax_lot_polygon_scratch 
( boro, block, lot, bbl, community_district, regular_lot_indicator, number_lot_sides, condo_flag, reuc_flag,
 air_rights_flag, subterranean_flag, easement_flag, section_number, volume_number, page_number, lot_note,  
 nycmap_bldg_flag, missing_rpad_flag, conversion_exception_flag, value_reflected_out_flag, created_by,
 created_date, last_modified_by, last_modified_date, av_change, bw_change, effective_tax_year, bill_bbl_flag,
 globalid, shape)
 values 
 ('2',2541,123,'2025410123',NULL,'I',0,'','R','','','',9,9,18,'','0','0',NULL,NULL,NULL,NULL,'sj',NULL,0,0,NULL,0,'{DFBFF950-755E-46BD-AC10-46F52A961857}',ST_GeomFromText('POLYGON ((1003983.92722924 246501.926766843, 1003981.87564524 246502.663790837, 1003936.18860519 246398.077294737, 1003892.91743715 246321.485166669, 1003872.07058913 246281.764462635, 1003856.92383711 246250.651758596, 1003841.33036511 246216.242542565, 1003830.4603491 246190.568558544, 1003817.40921308 246157.544046521, 1003810.86662108 246139.698286504, 1003772.65734103 246014.115950376, 1003765.69516502 245990.209134355, 1003798.39686106 245987.022702351, 1003801.19289306 245997.239406362, 1003830.8202851 246111.272814468, 1003839.9597411 246141.743726507, 1003848.04114911 246162.204782516, 1003855.49663712 246180.041070536, 1003865.06284513 246201.666670561, 1003878.03846113 246229.065582588, 1003898.03922915 246267.709550619, 1003952.48300521 246370.145902708, 1004010.98182125 246492.208494827, 1003983.92722924 246501.926766843))',2263));
insert into tax_lot_polygon_scratch 
( boro, block, lot, bbl, community_district, regular_lot_indicator, number_lot_sides, condo_flag, reuc_flag,
 air_rights_flag, subterranean_flag, easement_flag, section_number, volume_number, page_number, lot_note,  
 nycmap_bldg_flag, missing_rpad_flag, conversion_exception_flag, value_reflected_out_flag, created_by,
 created_date, last_modified_by, last_modified_date, av_change, bw_change, effective_tax_year, bill_bbl_flag,
 globalid, shape)
 values 
 ('2',2541,8900,'2025418900',NULL,'',0,'','R','','','E',9,9,18,'','0','0',NULL,NULL,NULL,NULL,'',NULL,0,0,NULL,0,'{54C8A83E-973B-4A77-8F95-16589B53C048}',ST_GeomFromText('POLYGON ((1004262.4465255 247169.289071456, 1004105.18444535 247214.370671496, 1004077.39001332 247159.33527945, 1004209.33010945 247120.101487413, 1003993.06975724 246614.87499094, 1003949.8382692 246516.340078846, 1003948.9235812 246514.500462845, 1003901.61631715 246418.751086757, 1003855.65510112 246340.642670691, 1003841.0257251 246314.01431866, 1003825.28633308 246284.274286628, 1003809.00575706 246252.2079826, 1003797.63730906 246228.026478589, 1003781.44326104 246192.106350541, 1003769.54514903 246166.929518521, 1003761.01753302 246149.053038508, 1003757.87846102 246149.343598515, 1003743.85094102 246106.823278472, 1003721.24153298 246044.250478417, 1003717.88230099 246035.957358405, 1003700.44332497 245992.905838355, 1003683.29798095 245952.965230331, 1003641.49087691 245864.585326239, 1003604.44230089 245784.975214168, 1003566.48518084 245700.820846096, 1003452.03986874 245435.729261845, 1003587.10086086 245395.960685805, 1003591.66201288 245394.617709801, 1003598.78162888 245417.705837831, 1003742.77446102 245884.662126258, 1003762.14623703 245947.482734323, 1003790.66873306 245939.921518311, 1003793.79910105 245939.020142317, 1003801.43532506 245986.520174354, 1003798.39686106 245987.022702351, 1003765.69516502 245990.209134355, 1003772.65734103 246014.115950376, 1003810.86662108 246139.698286504, 1003817.40921308 246157.544046521, 1003830.4603491 246190.568558544, 1003841.33036511 246216.242542565, 1003856.92383711 246250.651758596, 1003872.07058913 246281.764462635, 1003892.91743715 246321.485166669, 1003936.18860519 246398.077294737, 1003981.87564524 246502.663790837, 1003983.92722924 246501.926766843, 1004262.4465255 247169.289071456))',2263));
insert into tax_lot_polygon_scratch 
( boro, block, lot, bbl, community_district, regular_lot_indicator, number_lot_sides, condo_flag, reuc_flag,
 air_rights_flag, subterranean_flag, easement_flag, section_number, volume_number, page_number, lot_note,  
 nycmap_bldg_flag, missing_rpad_flag, conversion_exception_flag, value_reflected_out_flag, created_by,
 created_date, last_modified_by, last_modified_date, av_change, bw_change, effective_tax_year, bill_bbl_flag,
 globalid, shape)
 values 
 ('2',2541,132,'2025410132',NULL,'I',0,'','','','','',9,9,18,'','1','0',NULL,NULL,NULL,NULL,'sj',NULL,0,0,NULL,0,'{E3143347-2E6B-4071-9093-2B14C915D692}',ST_GeomFromText('POLYGON ((1003993.06975724 246614.87499094, 1004209.33010945 247120.101487413, 1004077.39001332 247159.33527945, 1004050.32338929 247105.740655392, 1004041.24870129 247088.506223381, 1004033.62988529 247074.033519372, 1004029.21286127 247065.302127361, 1004015.50508526 247038.201199338, 1003999.15078124 247003.636079296, 1003983.70450923 246968.639855266, 1003968.02374122 246930.423919231, 1003946.1982052 246869.558383182, 1003928.58591717 246812.728431121, 1003904.87519716 246727.159663051, 1003888.89260514 246661.782638982, 1003993.06975724 246614.87499094))',2263));
insert into tax_lot_polygon_scratch 
( boro, block, lot, bbl, community_district, regular_lot_indicator, number_lot_sides, condo_flag, reuc_flag,
 air_rights_flag, subterranean_flag, easement_flag, section_number, volume_number, page_number, lot_note,  
 nycmap_bldg_flag, missing_rpad_flag, conversion_exception_flag, value_reflected_out_flag, created_by,
 created_date, last_modified_by, last_modified_date, av_change, bw_change, effective_tax_year, bill_bbl_flag,
 globalid, shape)
 values 
 ('2',2541,159,'2025410159',NULL,'',0,'','','','','',9,9,18,'','0','0',NULL,NULL,NULL,NULL,'sj',NULL,0,0,NULL,0,'{583B749A-B043-424A-A396-B3557438C3B9}',ST_GeomFromText('POLYGON ((1003860.63993312 246546.212718874, 1003948.9235812 246514.500462845, 1003949.8382692 246516.340078846, 1003993.06975724 246614.87499094, 1003888.89260514 246661.782638982, 1003860.63993312 246546.212718874))',2263));
insert into tax_lot_polygon_scratch 
( boro, block, lot, bbl, community_district, regular_lot_indicator, number_lot_sides, condo_flag, reuc_flag,
 air_rights_flag, subterranean_flag, easement_flag, section_number, volume_number, page_number, lot_note,  
 nycmap_bldg_flag, missing_rpad_flag, conversion_exception_flag, value_reflected_out_flag, created_by,
 created_date, last_modified_by, last_modified_date, av_change, bw_change, effective_tax_year, bill_bbl_flag,
 globalid, shape)
 values 
 ('2',2541,180,'2025410180',NULL,'I',0,'','R','','','E',9,9,18,'','0','0',NULL,NULL,NULL,NULL,'sj',NULL,0,0,NULL,0,'{2B185883-90CA-4724-95B9-4929B27AC0FF}',ST_GeomFromText('POLYGON ((1004390.59679762 247193.78545548, 1004290.09222151 247234.031983525, 1004262.4465255 247169.289071456, 1003983.92722924 246501.926766843, 1004010.98182125 246492.208494827, 1003952.48300521 246370.145902708, 1003898.03922915 246267.709550619, 1003878.03846113 246229.065582588, 1003865.06284513 246201.666670561, 1003855.49663712 246180.041070536, 1003848.04114911 246162.204782516, 1003839.9597411 246141.743726507, 1003892.94406115 246136.837998495, 1003900.30380516 246152.854126513, 1003908.47967717 246170.27902253, 1003916.17682917 246186.346606538, 1003924.99654117 246204.376430556, 1003932.89695719 246220.197486579, 1003943.0980452 246240.189550594, 1003996.62994924 246343.146862686, 1004059.9466853 246474.619502813, 1004082.53382133 246466.5063508, 1004103.92518134 246458.822510794, 1004138.90118139 246560.109934896, 1004390.59679762 247193.78545548))',2263));
insert into tax_lot_polygon_scratch 
( boro, block, lot, bbl, community_district, regular_lot_indicator, number_lot_sides, condo_flag, reuc_flag,
 air_rights_flag, subterranean_flag, easement_flag, section_number, volume_number, page_number, lot_note,  
 nycmap_bldg_flag, missing_rpad_flag, conversion_exception_flag, value_reflected_out_flag, created_by,
 created_date, last_modified_by, last_modified_date, av_change, bw_change, effective_tax_year, bill_bbl_flag,
 globalid, shape)
 values 
 ('2',2541,22,'2025410022',NULL,'I',0,'','R','','','E',9,9,18,'','0','0',NULL,NULL,NULL,NULL,'sj',NULL,0,0,NULL,0,'{D7E8A6BA-120A-4257-B311-BB44CF0744F3}',ST_GeomFromText('POLYGON ((1004082.53382133 246466.5063508, 1004059.9466853 246474.619502813, 1003996.62994924 246343.146862686, 1003943.0980452 246240.189550594, 1003932.89695719 246220.197486579, 1003924.99654117 246204.376430556, 1003916.17682917 246186.346606538, 1003908.47967717 246170.27902253, 1003900.30380516 246152.854126513, 1003892.94406115 246136.837998495, 1003881.32319714 246106.890094474, 1003872.79481313 246084.226670444, 1003866.35692513 246065.053038433, 1003860.18937312 246044.39639841, 1003854.92652512 246024.278638393, 1003850.60934111 246005.262958378, 1003846.4311651 245983.483502358, 1003846.3333731 245982.919022352, 1003956.97094122 245973.955694348, 1004066.11986931 246334.51991868, 1004096.80710134 246406.57214275, 1004122.17798136 246452.265838787, 1004103.92518134 246458.822510794, 1004082.53382133 246466.5063508))',2263));
insert into tax_lot_polygon_scratch 
( boro, block, lot, bbl, community_district, regular_lot_indicator, number_lot_sides, condo_flag, reuc_flag,
 air_rights_flag, subterranean_flag, easement_flag, section_number, volume_number, page_number, lot_note,  
 nycmap_bldg_flag, missing_rpad_flag, conversion_exception_flag, value_reflected_out_flag, created_by,
 created_date, last_modified_by, last_modified_date, av_change, bw_change, effective_tax_year, bill_bbl_flag,
 globalid, shape)
 values 
 ('2',2541,8900,'2025418900',NULL,'',0,'','R','','','',9,9,18,'','0','0',NULL,NULL,NULL,NULL,'',NULL,0,0,NULL,0,'{4EF7180B-B3CD-4154-93E6-B6F842D845B0}',ST_GeomFromText('POLYGON ((1004290.09222151 247234.031983525, 1004390.59679762 247193.78545548, 1004409.01318163 247240.407407522, 1004309.14476554 247280.243823558, 1004290.09222151 247234.031983525))',2263));
insert into tax_lot_polygon_scratch 
( boro, block, lot, bbl, community_district, regular_lot_indicator, number_lot_sides, condo_flag, reuc_flag,
 air_rights_flag, subterranean_flag, easement_flag, section_number, volume_number, page_number, lot_note,  
 nycmap_bldg_flag, missing_rpad_flag, conversion_exception_flag, value_reflected_out_flag, created_by,
 created_date, last_modified_by, last_modified_date, av_change, bw_change, effective_tax_year, bill_bbl_flag,
 globalid, shape)
 values 
 ('2',2541,8900,'2025418900',NULL,'',0,'','R','','','E',9,9,18,'','0','0',NULL,NULL,NULL,NULL,'',NULL,0,0,NULL,0,'{65E0588A-AD0D-4E3D-826D-D558D62B02C2}',ST_GeomFromText('POLYGON ((1004167.11545341 247336.897903621, 1004105.18444535 247214.370671496, 1004262.4465255 247169.289071456, 1004290.09222151 247234.031983525, 1004309.14476554 247280.243823558, 1004167.11545341 247336.897903621))',2263));
insert into tax_lot_polygon_scratch 
( boro, block, lot, bbl, community_district, regular_lot_indicator, number_lot_sides, condo_flag, reuc_flag,
 air_rights_flag, subterranean_flag, easement_flag, section_number, volume_number, page_number, lot_note,  
 nycmap_bldg_flag, missing_rpad_flag, conversion_exception_flag, value_reflected_out_flag, created_by,
 created_date, last_modified_by, last_modified_date, av_change, bw_change, effective_tax_year, bill_bbl_flag,
 globalid, shape)
 values 
 ('2',2541,4,'2025410004',NULL,'',0,'','R','','','E',9,9,18,'','0','0',NULL,NULL,NULL,NULL,'sj',NULL,0,0,NULL,0,'{AB586153-5CC7-4D4A-892E-E94356B752F5}',ST_GeomFromText('POLYGON ((1003881.32319714 246106.890094474, 1003830.8202851 246111.272814468, 1003801.19289306 245997.239406362, 1003798.39686106 245987.022702351, 1003801.43532506 245986.520174354, 1003793.79910105 245939.020142317, 1003932.85318118 245897.050734267, 1003956.97094122 245973.955694348, 1003846.3333731 245982.919022352, 1003846.4311651 245983.483502358, 1003850.60934111 246005.262958378, 1003854.92652512 246024.278638393, 1003860.18937312 246044.39639841, 1003866.35692513 246065.053038433, 1003872.79481313 246084.226670444, 1003881.32319714 246106.890094474))',2263));
insert into tax_lot_polygon_scratch 
( boro, block, lot, bbl, community_district, regular_lot_indicator, number_lot_sides, condo_flag, reuc_flag,
 air_rights_flag, subterranean_flag, easement_flag, section_number, volume_number, page_number, lot_note,  
 nycmap_bldg_flag, missing_rpad_flag, conversion_exception_flag, value_reflected_out_flag, created_by,
 created_date, last_modified_by, last_modified_date, av_change, bw_change, effective_tax_year, bill_bbl_flag,
 globalid, shape)
 values 
 ('2',2541,122,'2025410122',NULL,'I',0,'','R','','','',9,9,18,'','0','0',NULL,NULL,NULL,NULL,'sj',NULL,0,0,NULL,0,'{527D925D-5F0D-4F17-A0C2-4F5DC96D35BC}',ST_GeomFromText('POLYGON ((1003948.9235812 246514.500462845, 1003860.63993312 246546.212718874, 1003787.45516504 246246.847342595, 1003780.46866904 246218.268014565, 1003759.36121303 246153.837934509, 1003757.87846102 246149.343598515, 1003761.01753302 246149.053038508, 1003769.54514903 246166.929518521, 1003781.44326104 246192.106350541, 1003797.63730906 246228.026478589, 1003809.00575706 246252.2079826, 1003825.28633308 246284.274286628, 1003841.0257251 246314.01431866, 1003855.65510112 246340.642670691, 1003901.61631715 246418.751086757, 1003948.9235812 246514.500462845))',2263));
-- Bronx block 2541 continued, tax_lot_faces
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,180,'2025410180',25.01,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{BDDAE20A-023D-41A5-9C54-345E0FF6C7C3}',ST_GeomFromText('LINESTRING (1004103.92518134 246458.822510794, 1004082.53382133 246466.5063508)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,180,'2025410180',143.76,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{C28FD89D-6687-48B2-BFF9-01565FF1FF87}',ST_GeomFromText('LINESTRING (1004059.9466853 246474.619502813, 1003996.62994924 246343.146862686)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,22,'2025410022',271.35,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{EB549A24-1F6E-4F35-88E5-10A76254C409}',ST_GeomFromText('LINESTRING (1003846.4311651 245983.483502358, 1003850.60934111 246005.262958378, 1003854.92652512 246024.278638393, 1003860.18937312 246044.39639841, 1003866.35692513 246065.053038433, 1003872.79481313 246084.226670444, 1003881.32319714 246106.890094474, 1003892.94406115 246136.837998495, 1003900.30380516 246152.854126513, 1003908.47967717 246170.27902253, 1003916.17682917 246186.346606538, 1003924.99654117 246204.376430556, 1003932.89695719 246220.197486579, 1003943.0980452 246240.189550594)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,8900,'2025418900',0,1,0,2,NULL,NULL,NULL,NULL,NULL,NULL,0,'{E2A6FD19-9B82-44F5-8416-A4CC9F3A2C63}',ST_GeomFromText('LINESTRING (1003798.39686106 245987.022702351, 1003801.43532506 245986.520174354)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,8900,'2025418900',123.37,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{8B519B0F-9775-4A09-B8B4-09D8F4C5F355}',ST_GeomFromText('LINESTRING (1003717.88230099 246035.957358405, 1003721.24153298 246044.250478417, 1003743.85094102 246106.823278472, 1003757.87846102 246149.343598515)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,8900,'2025418900',3,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{7CC3D5CA-B3F6-41DC-9BEF-65023AA1EDB1}',ST_GeomFromText('LINESTRING (1003757.87846102 246149.343598515, 1003761.01753302 246149.053038508)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,122,'2025410122',3,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{B02F552E-68A5-4270-A55A-3B2B6BFB3FAA}',ST_GeomFromText('LINESTRING (1003761.01753302 246149.053038508, 1003757.87846102 246149.343598515)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,4,'2025410004',0,1,0,2,NULL,NULL,NULL,NULL,NULL,NULL,0,'{799D07A0-8FAC-4E72-8880-8C4AE5AFCC49}',ST_GeomFromText('LINESTRING (1003801.43532506 245986.520174354, 1003798.39686106 245987.022702351)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,123,'2025410123',9.63,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{485EE8DC-1911-4042-AF63-EC715DAD839F}',ST_GeomFromText('LINESTRING (1003801.19289306 245997.239406362, 1003798.39686106 245987.022702351)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,180,'2025410180',0,1,0,2,NULL,NULL,NULL,NULL,NULL,NULL,0,'{B0EE9ADD-942D-4304-8E67-DB61DE4DF7ED}',ST_GeomFromText('LINESTRING (1004010.98182125 246492.208494827, 1003983.92722924 246501.926766843)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,8900,'2025418900',113.62,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{27B97378-D412-4BBF-9FCE-82C4DF2052A4}',ST_GeomFromText('LINESTRING (1003981.87564524 246502.663790837, 1003936.18860519 246398.077294737)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,8900,'2025418900',0,1,1,2,NULL,NULL,NULL,NULL,NULL,NULL,0,'{7CDA74C3-959F-418D-B218-F93A9E9CD03B}',ST_GeomFromText('LINESTRING (1003598.78162888 245417.705837831, 1003591.66201288 245394.617709801)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,22,'2025410022',25.71,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{2C9F47C7-F0EA-43B1-B333-271DC7DC71BB}',ST_GeomFromText('LINESTRING (1004059.9466853 246474.619502813, 1004082.53382133 246466.5063508)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,159,'2025410159',105.13,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{2F4BCC7A-D5ED-4F3A-840D-7953573BCB79}',ST_GeomFromText('LINESTRING (1003993.06975724 246614.87499094, 1003949.8382692 246516.340078846)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,123,'2025410123',178.11,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{79807705-CDB4-4F21-B770-3FA8536B8172}',ST_GeomFromText('LINESTRING (1003817.40921308 246157.544046521, 1003830.4603491 246190.568558544, 1003841.33036511 246216.242542565, 1003856.92383711 246250.651758596, 1003872.07058913 246281.764462635, 1003892.91743715 246321.485166669)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,123,'2025410123',22.76,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{C71014DD-7731-4AD1-9D5B-32A8ED83BED9}',ST_GeomFromText('LINESTRING (1003765.69516502 245990.209134355, 1003772.65734103 246014.115950376)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,180,'2025410180',25.71,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{7D0C55CE-C888-47C8-9541-0276BB46434E}',ST_GeomFromText('LINESTRING (1004082.53382133 246466.5063508, 1004059.9466853 246474.619502813)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,22,'2025410022',.53,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{C3842BC4-A654-4C47-8239-BE1552541243}',ST_GeomFromText('LINESTRING (1003846.3333731 245982.919022352, 1003846.4311651 245983.483502358)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,4,'2025410004',142,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{02036909-C888-4464-9027-F744F6179139}',ST_GeomFromText('LINESTRING (1003932.85318118 245897.050734267, 1003793.79910105 245939.020142317)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,8900,'2025418900',128.93,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{38CBEA58-8CE9-49BE-8C29-54124E955764}',ST_GeomFromText('LINESTRING (1004209.33010945 247120.101487413, 1004077.39001332 247159.33527945)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,132,'2025410132',71.29,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{B55B1D46-6A18-49D5-A7DA-3489F16DCDD5}',ST_GeomFromText('LINESTRING (1003888.89260514 246661.782638982, 1003904.87519716 246727.159663051)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,180,'2025410180',136.4,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{5864EF3A-BF3D-42AC-B5C3-57ADA5F3CFFC}',ST_GeomFromText('LINESTRING (1003952.48300521 246370.145902708, 1004010.98182125 246492.208494827)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,8900,'2025418900',126.99,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{45C5E089-A73A-4D0F-B10C-FE1D52B41EFE}',ST_GeomFromText('LINESTRING (1003810.86662108 246139.698286504, 1003772.65734103 246014.115950376)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,123,'2025410123',19.91,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{DBCD9E66-8BF9-4250-8E4A-C4699E9A8B4D}',ST_GeomFromText('LINESTRING (1003810.86662108 246139.698286504, 1003817.40921308 246157.544046521)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,123,'2025410123',32.97,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{292DDC6A-907A-4F5D-8DB9-B69E88991EB9}',ST_GeomFromText('LINESTRING (1003798.39686106 245987.022702351, 1003765.69516502 245990.209134355)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,180,'2025410180',107.29,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{121BE939-4061-4E05-9C80-6079E0F0C9F9}',ST_GeomFromText('LINESTRING (1004138.90118139 246560.109934896, 1004103.92518134 246458.822510794)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,159,'2025410159',104.26,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{1948050E-0AF4-4EDB-8AA8-28BE4C05D3C5}',ST_GeomFromText('LINESTRING (1003888.89260514 246661.782638982, 1003993.06975724 246614.87499094)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,8900,'2025418900',32.97,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{A34CBC71-431D-44A5-B079-55E7CEA647AB}',ST_GeomFromText('LINESTRING (1003765.69516502 245990.209134355, 1003798.39686106 245987.022702351)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,123,'2025410123',126.99,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{5294B155-8F74-4BA1-8448-DE9853FB3915}',ST_GeomFromText('LINESTRING (1003772.65734103 246014.115950376, 1003810.86662108 246139.698286504)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,122,'2025410122',300.61,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{B94F6814-2D3F-4F0E-913C-B483722E2B4E}',ST_GeomFromText('LINESTRING (1003787.45516504 246246.847342595, 1003860.63993312 246546.212718874)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,8900,'2025418900',178.11,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{B1B3DF2B-CFE2-40A1-8176-FCB805402CC7}',ST_GeomFromText('LINESTRING (1003892.91743715 246321.485166669, 1003872.07058913 246281.764462635, 1003856.92383711 246250.651758596, 1003841.33036511 246216.242542565, 1003830.4603491 246190.568558544, 1003817.40921308 246157.544046521)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,180,'2025410180',0,1,0,2,NULL,NULL,NULL,NULL,NULL,NULL,0,'{B84DE3C3-BF26-4659-8BCB-CD4790C84CE1}',ST_GeomFromText('LINESTRING (1003892.94406115 246136.837998495, 1003839.9597411 246141.743726507)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,4,'2025410004',0,1,0,2,NULL,NULL,NULL,NULL,NULL,NULL,0,'{CBD30A7D-B6FE-41E8-8130-1DFF79F24554}',ST_GeomFromText('LINESTRING (1003881.32319714 246106.890094474, 1003872.79481313 246084.226670444, 1003866.35692513 246065.053038433, 1003860.18937312 246044.39639841, 1003854.92652512 246024.278638393, 1003850.60934111 246005.262958378, 1003846.4311651 245983.483502358, 1003846.3333731 245982.919022352)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,8900,'2025418900',128.81,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{A56A9BF0-0001-4CE7-9661-ABD3426EA884}',ST_GeomFromText('LINESTRING (1004262.4465255 247169.289071456, 1004290.09222151 247234.031983525, 1004309.14476554 247280.243823558)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,8900,'2025418900',718.05,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{E9B432D3-BD8F-40C5-A985-9C22B224D812}',ST_GeomFromText('LINESTRING (1004262.4465255 247169.289071456, 1003983.92722924 246501.926766843)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,122,'2025410122',86.22,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{54B1C0F2-3696-452A-B979-CD9A6AC2AEE2}',ST_GeomFromText('LINESTRING (1003860.63993312 246546.212718874, 1003948.9235812 246514.500462845)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,123,'2025410123',115.85,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{662BF955-3CE9-49D4-8018-BD1F82126152}',ST_GeomFromText('LINESTRING (1003952.48300521 246370.145902708, 1003898.03922915 246267.709550619)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,22,'2025410022',374.09,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{5446628D-2AC2-41EC-ACE6-05548EEB7AAF}',ST_GeomFromText('LINESTRING (1004066.11986931 246334.51991868, 1003956.97094122 245973.955694348)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,180,'2025410180',108.44,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{1F533C10-1182-4257-91B4-E1A6B6DCF3CD}',ST_GeomFromText('LINESTRING (1004290.09222151 247234.031983525, 1004390.59679762 247193.78545548)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,122,'2025410122',100.15,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{A0D911DB-5124-4B3B-B09A-B147C6E198F3}',ST_GeomFromText('LINESTRING (1003757.87846102 246149.343598515, 1003759.36121303 246153.837934509, 1003780.46866904 246218.268014565, 1003787.45516504 246246.847342595)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,8900,'2025418900',49.54,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{AD041C4C-EBD4-42D7-A500-B0F12FA0CBA6}',ST_GeomFromText('LINESTRING (1003801.43532506 245986.520174354, 1003793.79910105 245939.020142317)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,132,'2025410132',360.85,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{AC02D2A9-4F76-4DC8-BEF3-9527FD0AAD81}',ST_GeomFromText('LINESTRING (1003904.87519716 246727.159663051, 1003928.58591717 246812.728431121, 1003946.1982052 246869.558383182, 1003968.02374122 246930.423919231, 1003983.70450923 246968.639855266, 1003999.15078124 247003.636079296, 1004015.50508526 247038.201199338, 1004029.21286127 247065.302127361)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,3,'2025410003',0,1,0,2,NULL,NULL,NULL,NULL,NULL,NULL,0,'{0F7AAB4B-01AC-4F7D-9603-DEED685D4D92}',ST_GeomFromText('LINESTRING (1003881.32319714 246106.890094474, 1003830.8202851 246111.272814468)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,123,'2025410123',113.62,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{F3FA99C3-B2C6-40AF-B27A-4F601F3488E9}',ST_GeomFromText('LINESTRING (1003936.18860519 246398.077294737, 1003981.87564524 246502.663790837)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,22,'2025410022',115.85,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{7CFD0AC0-7DC6-420A-9695-18ABFA1656A6}',ST_GeomFromText('LINESTRING (1003943.0980452 246240.189550594, 1003996.62994924 246343.146862686)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,180,'2025410180',0,1,0,2,NULL,NULL,NULL,NULL,NULL,NULL,0,'{32B2E890-EA1F-42D0-A706-5CCF09CB986E}',ST_GeomFromText('LINESTRING (1003943.0980452 246240.189550594, 1003932.89695719 246220.197486579, 1003924.99654117 246204.376430556, 1003916.17682917 246186.346606538, 1003908.47967717 246170.27902253, 1003900.30380516 246152.854126513, 1003892.94406115 246136.837998495)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,8900,'2025418900',108.32,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{0B1879A0-FD8C-45D3-89FE-042648B9F63E}',ST_GeomFromText('LINESTRING (1003901.61631715 246418.751086757, 1003948.9235812 246514.500462845, 1003949.8382692 246516.340078846)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,180,'2025410180',675.98,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{DC84659D-ECBC-4FA5-AF0A-1D6994A8D1E1}',ST_GeomFromText('LINESTRING (1004390.59679762 247193.78545548, 1004138.90118139 246560.109934896)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,22,'2025410022',143.76,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{A1FB860E-074D-431C-B722-0914D5F5C3DF}',ST_GeomFromText('LINESTRING (1003996.62994924 246343.146862686, 1004059.9466853 246474.619502813)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,180,'2025410180',115.85,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{3A0270C9-47EC-4268-A5F9-7A625C6BF01A}',ST_GeomFromText('LINESTRING (1003996.62994924 246343.146862686, 1003943.0980452 246240.189550594)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,8900,'2025418900',0,1,1,2,NULL,NULL,NULL,NULL,NULL,NULL,0,'{A4C26C77-9E4A-4C14-86E0-D97B4A5D7498}',ST_GeomFromText('LINESTRING (1004409.01318163 247240.407407522, 1004390.59679762 247193.78545548)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,8900,'2025418900',89.59,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{DEAF766E-5DCB-4B28-85AB-28093E9D53B2}',ST_GeomFromText('LINESTRING (1003936.18860519 246398.077294737, 1003892.91743715 246321.485166669)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,8900,'2025418900',30.01,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{02132607-7DC9-49DF-BA3A-81A6E6E62D7A}',ST_GeomFromText('LINESTRING (1003793.79910105 245939.020142317, 1003790.66873306 245939.921518311, 1003762.14623703 245947.482734323)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,123,'2025410123',281,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{18699E2B-31EC-4ACF-8C81-7B7276E5B0AA}',ST_GeomFromText('LINESTRING (1003898.03922915 246267.709550619, 1003878.03846113 246229.065582588, 1003865.06284513 246201.666670561, 1003855.49663712 246180.041070536, 1003848.04114911 246162.204782516, 1003839.9597411 246141.743726507, 1003830.8202851 246111.272814468, 1003801.19289306 245997.239406362)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,8900,'2025418900',19.91,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{41082000-15A6-4284-8326-DD81B3B12632}',ST_GeomFromText('LINESTRING (1003817.40921308 246157.544046521, 1003810.86662108 246139.698286504)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,159,'2025410159',86.22,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{0913917B-0EC3-40F8-9C4F-FFE6A723766D}',ST_GeomFromText('LINESTRING (1003948.9235812 246514.500462845, 1003860.63993312 246546.212718874)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,8900,'2025418900',2,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{F5DCB5D8-BB20-4FA9-995D-D8026622EE4E}',ST_GeomFromText('LINESTRING (1003983.92722924 246501.926766843, 1003981.87564524 246502.663790837)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,8900,'2025418900',644.19,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{8D5C7AF4-29E4-4536-BE44-997E84A53E59}',ST_GeomFromText('LINESTRING (1003452.03986874 245435.729261845, 1003566.48518084 245700.820846096, 1003604.44230089 245784.975214168, 1003641.49087691 245864.585326239, 1003683.29798095 245952.965230331, 1003700.44332497 245992.905838355, 1003717.88230099 246035.957358405)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,4,'2025410004',80.3,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{A4BACF9E-21B7-430E-A79A-67B65F5A733C}',ST_GeomFromText('LINESTRING (1003956.97094122 245973.955694348, 1003932.85318118 245897.050734267)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,8900,'2025418900',0,1,1,2,NULL,NULL,NULL,NULL,NULL,NULL,0,'{CAFCE9BB-E099-4A94-ADF5-D5BC03F20E14}',ST_GeomFromText('LINESTRING (1003591.66201288 245394.617709801, 1003587.10086086 245395.960685805, 1003452.03986874 245435.729261845)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,132,'2025410132',104.26,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{6C08EF1C-6B35-4569-82F0-F47F2C6581F5}',ST_GeomFromText('LINESTRING (1003993.06975724 246614.87499094, 1003888.89260514 246661.782638982)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,8900,'2025418900',524.69,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{8EB98699-EC07-4477-B849-114519A6656D}',ST_GeomFromText('LINESTRING (1003762.14623703 245947.482734323, 1003742.77446102 245884.662126258, 1003598.78162888 245417.705837831)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,8900,'2025418900',19.91,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{C23CE95A-418B-42BF-83F4-4C64C083F1BD}',ST_GeomFromText('LINESTRING (1003761.01753302 246149.053038508, 1003769.54514903 246166.929518521)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,122,'2025410122',19.91,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{A5F25C36-B8B8-49E2-9250-749CD52DEE0B}',ST_GeomFromText('LINESTRING (1003769.54514903 246166.929518521, 1003761.01753302 246149.053038508)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,8900,'2025418900',653.51,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{32C04200-AFC1-47FB-9DC7-F26A99480DFD}',ST_GeomFromText('LINESTRING (1003949.8382692 246516.340078846, 1003993.06975724 246614.87499094, 1004209.33010945 247120.101487413)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,8900,'2025418900',107.44,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{63559CA3-9837-44ED-B391-F43FFFB334B3}',ST_GeomFromText('LINESTRING (1004309.14476554 247280.243823558, 1004409.01318163 247240.407407522)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,8900,'2025418900',156.87,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{905CC8F0-40F2-447A-9045-AD07A320CD26}',ST_GeomFromText('LINESTRING (1004167.11545341 247336.897903621, 1004309.14476554 247280.243823558)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,8900,'2025418900',165.75,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{C0A18698-17EF-4146-B22D-909C96ECCE17}',ST_GeomFromText('LINESTRING (1004262.4465255 247169.289071456, 1004105.18444535 247214.370671496)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,123,'2025410123',0,1,0,2,NULL,NULL,NULL,NULL,NULL,NULL,0,'{60A3D4FD-F15A-4D67-89A7-14949A41ED96}',ST_GeomFromText('LINESTRING (1003981.87564524 246502.663790837, 1003983.92722924 246501.926766843, 1004010.98182125 246492.208494827)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,8900,'2025418900',165.75,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{7ECB726A-70F2-48B5-86B2-4A88043C3060}',ST_GeomFromText('LINESTRING (1004105.18444535 247214.370671496, 1004262.4465255 247169.289071456)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,3,'2025410003',0,1,0,2,NULL,NULL,NULL,NULL,NULL,NULL,0,'{FAC98F6D-4CA3-4296-812F-6D032D549E7C}',ST_GeomFromText('LINESTRING (1003892.94406115 246136.837998495, 1003881.32319714 246106.890094474)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,8900,'2025418900',22.76,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{84C69051-0B22-40F2-8A6B-8EBB1C686858}',ST_GeomFromText('LINESTRING (1003772.65734103 246014.115950376, 1003765.69516502 245990.209134355)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,8900,'2025418900',0,1,0,2,NULL,NULL,NULL,NULL,NULL,NULL,0,'{5FD6F639-C7BD-4AF2-B0C2-B4127C0F048D}',ST_GeomFromText('LINESTRING (1004290.09222151 247234.031983525, 1004309.14476554 247280.243823558)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,123,'2025410123',136.4,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{835C8E0A-3386-48DD-91FC-CECB42A6821B}',ST_GeomFromText('LINESTRING (1004010.98182125 246492.208494827, 1003952.48300521 246370.145902708)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,4,'2025410004',101.13,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{A0B01CB7-3C29-4503-8A3E-DAFDDA0215BE}',ST_GeomFromText('LINESTRING (1003846.3333731 245982.919022352, 1003956.97094122 245973.955694348)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,159,'2025410159',2.1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{3639D8FF-E162-4E19-998A-24E43E225D9A}',ST_GeomFromText('LINESTRING (1003949.8382692 246516.340078846, 1003948.9235812 246514.500462845)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,22,'2025410022',25.01,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{9CBC443F-3A76-4AD7-954B-225ADA3F0ACD}',ST_GeomFromText('LINESTRING (1004082.53382133 246466.5063508, 1004103.92518134 246458.822510794)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,3,'2025410003',0,1,0,2,NULL,NULL,NULL,NULL,NULL,NULL,0,'{BDCCD1A5-4DA5-4EAE-AAFB-D5FCC615189E}',ST_GeomFromText('LINESTRING (1003839.9597411 246141.743726507, 1003892.94406115 246136.837998495)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,180,'2025410180',0,1,0,2,NULL,NULL,NULL,NULL,NULL,NULL,0,'{B9DA28EE-658C-43C1-8606-6FD68A2AFA53}',ST_GeomFromText('LINESTRING (1003839.9597411 246141.743726507, 1003848.04114911 246162.204782516, 1003855.49663712 246180.041070536, 1003865.06284513 246201.666670561, 1003878.03846113 246229.065582588, 1003898.03922915 246267.709550619)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,22,'2025410022',78.5,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{1B9FB6BF-87DF-4C72-A13C-E29350EDB2D0}',ST_GeomFromText('LINESTRING (1004096.80710134 246406.57214275, 1004066.11986931 246334.51991868)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,22,'2025410022',51.5,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{9562F82A-3481-499E-8CDE-4C80EF84E0BC}',ST_GeomFromText('LINESTRING (1004122.17798136 246452.265838787, 1004096.80710134 246406.57214275)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,132,'2025410132',128.93,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{544F807B-28ED-418A-AA02-43AC74E46F5A}',ST_GeomFromText('LINESTRING (1004077.39001332 247159.33527945, 1004209.33010945 247120.101487413)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,8900,'2025418900',186.73,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{239F54F5-E974-4C43-A229-D3466DE85BE8}',ST_GeomFromText('LINESTRING (1003769.54514903 246166.929518521, 1003781.44326104 246192.106350541, 1003797.63730906 246228.026478589, 1003809.00575706 246252.2079826, 1003825.28633308 246284.274286628, 1003841.0257251 246314.01431866, 1003855.65510112 246340.642670691)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,8900,'2025418900',108.44,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{095F17C9-7247-436C-81FF-0FD5E5F035EC}',ST_GeomFromText('LINESTRING (1004390.59679762 247193.78545548, 1004290.09222151 247234.031983525)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,4,'2025410004',0,1,0,2,NULL,NULL,NULL,NULL,NULL,NULL,0,'{E309708D-B72E-4DAC-976F-D2B3D052A640}',ST_GeomFromText('LINESTRING (1003798.39686106 245987.022702351, 1003801.19289306 245997.239406362, 1003830.8202851 246111.272814468)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,132,'2025410132',105,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{F9D079CE-232E-4CC0-B0A9-D633B462894E}',ST_GeomFromText('LINESTRING (1004029.21286127 247065.302127361, 1004033.62988529 247074.033519372, 1004041.24870129 247088.506223381, 1004050.32338929 247105.740655392, 1004077.39001332 247159.33527945)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,122,'2025410122',89.58,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{EE275C4E-B25C-4BC4-8822-00C2FF368B84}',ST_GeomFromText('LINESTRING (1003901.61631715 246418.751086757, 1003855.65510112 246340.642670691)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,22,'2025410022',101.13,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{1A1A32FD-C0E0-4594-A4B5-2EFA2960FCB1}',ST_GeomFromText('LINESTRING (1003956.97094122 245973.955694348, 1003846.3333731 245982.919022352)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,4,'2025410004',0,1,0,2,NULL,NULL,NULL,NULL,NULL,NULL,0,'{524AE06E-962D-495A-92C7-8AF2D7162F78}',ST_GeomFromText('LINESTRING (1003830.8202851 246111.272814468, 1003881.32319714 246106.890094474)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,132,'2025410132',548.38,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{024926DD-B007-4292-AEE6-A05A223993C8}',ST_GeomFromText('LINESTRING (1004209.33010945 247120.101487413, 1003993.06975724 246614.87499094)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,122,'2025410122',106.22,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{19E917A6-A5FA-4D38-97D6-4C0E022234F9}',ST_GeomFromText('LINESTRING (1003948.9235812 246514.500462845, 1003901.61631715 246418.751086757)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,3,'2025410003',0,1,0,2,NULL,NULL,NULL,NULL,NULL,NULL,0,'{3A3044DB-33D1-46A8-8BF3-A9E24466FBED}',ST_GeomFromText('LINESTRING (1003830.8202851 246111.272814468, 1003839.9597411 246141.743726507)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,122,'2025410122',186.73,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{1387DE8B-1016-430E-BEA3-FB5B2ED88C85}',ST_GeomFromText('LINESTRING (1003855.65510112 246340.642670691, 1003841.0257251 246314.01431866, 1003825.28633308 246284.274286628, 1003809.00575706 246252.2079826, 1003797.63730906 246228.026478589, 1003781.44326104 246192.106350541, 1003769.54514903 246166.929518521)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,8900,'2025418900',89.58,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{1A3C8752-5BDD-4589-893F-84EAD31C02BC}',ST_GeomFromText('LINESTRING (1003855.65510112 246340.642670691, 1003901.61631715 246418.751086757)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,4,'2025410004',49.54,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{47153B6B-9BE1-4FDE-B1D3-E54F56E142A5}',ST_GeomFromText('LINESTRING (1003793.79910105 245939.020142317, 1003801.43532506 245986.520174354)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,159,'2025410159',113.47,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{B6431549-E91D-448E-9B41-A4F21DCE2C7E}',ST_GeomFromText('LINESTRING (1003860.63993312 246546.212718874, 1003888.89260514 246661.782638982)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,8900,'2025418900',143.67,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{5BF67820-838E-4E1B-A48E-7E888A516219}',ST_GeomFromText('LINESTRING (1004105.18444535 247214.370671496, 1004167.11545341 247336.897903621)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,8900,'2025418900',60.78,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{91C2B83F-EE90-4701-9D84-08F7A5B0852D}',ST_GeomFromText('LINESTRING (1004077.39001332 247159.33527945, 1004105.18444535 247214.370671496)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,180,'2025410180',786.85,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{F4452BF2-F098-4DAE-9444-700B036EC5D2}',ST_GeomFromText('LINESTRING (1003983.92722924 246501.926766843, 1004262.4465255 247169.289071456, 1004290.09222151 247234.031983525)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,22,'2025410022',19.1,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{A998F706-A187-4A5D-B342-C6F405C560B8}',ST_GeomFromText('LINESTRING (1004103.92518134 246458.822510794, 1004122.17798136 246452.265838787)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,180,'2025410180',115.85,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{A1BBEB2A-A52D-4062-BC4A-7404C39B8968}',ST_GeomFromText('LINESTRING (1003898.03922915 246267.709550619, 1003952.48300521 246370.145902708)',2263));
insert into tax_lot_face_scratch 
   (tax_lot_face_type, boro, block, lot, bbl, lot_face_length, source, 
    block_face_flag, lot_face_length_error, created_by, created_date, last_modified_by, 
    last_modified_date, av_change, bw_change, approx_length_flag, globalid, shape )
   values (0,'2',2541,123,'2025410123',89.59,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,'{42D22E2D-B516-42DF-98B8-D3B1D1DCADBD}',ST_GeomFromText('LINESTRING (1003892.91743715 246321.485166669, 1003936.18860519 246398.077294737)',2263));
commit;

