--This is the "edited" data on temp scratch postgres database
--will dump out as shp and toss over to an sde-like facsimile
begin;
-- brooklyn block 2386
-- on August 22 2018 lots 12 and 14 (3023860012,3023860014)
-- merged into 7 (3023860007)
-- I am extracting tax_block_polygon data from dof_dtm.TAX_BLOCK_POLYGON_0829SDO@geocdev. It doesnt change
insert into tax_block_polygon_scratch 
(objectid, boro, block, eop_overlap_flag, jagged_st_flag, created_by, created_date, last_modified_by, last_modified_date, section_number, volume_number, globalid, shape)
values 
(24092,'3',2386,0,0,NULL,NULL,'LTP',NULL,8,5,'{CB124D70-A02D-47FE-9EFA-3CC76A04F08C}',
ST_GeomFromText('POLYGON ((997273.095094979 198597.187394217, 997317.713591024 198689.552194312, 997274.004918978 198710.47891432, 997226.337718934 198733.30080235, 997137.007542864 198776.070210382, 997045.673910767 198819.79859443, 997021.915062755 198770.338114381, 997010.855094746 198747.313474357, 997001.063862726 198726.930498347, 996956.838582695 198634.863426253, 996979.966134712 198623.825986251, 996997.543094725 198615.437634245, 997014.06175074 198607.554370224, 997031.197110757 198599.376450226, 997048.229558781 198591.248194218, 997070.242742792 198580.742466211, 997093.108662814 198569.829954192, 997116.568246841 198558.634306192, 997137.613494858 198548.590658173, 997165.057462886 198535.493442163, 997228.635318935 198505.151298136, 997273.095094979 198597.187394217))',2263)
);
-- I am artisinally hand-crafting tax_lot_polygon data from live production
-- into dof_dtm.TAX_LOT_POLYGON_TMPSDO@geocdev
--   select '(' || objectid || ',''' || boro || ''',' || block || ',' || lot || ',''' 
--   || bbl || ''',NULL,''' || regular_lot_indicator || ''',' || NUMBER_LOT_SIDES 
--   || ',''' || condo_flag || ''',''' || reuc_flag || ''',''' || air_rights_flag || ''',''' || SUBTERRANEAN_FLAG 
--   || ''',''' || EASEMENT_FLAG || ''',' || section_number || ',' || volume_number || ',' || page_number 
--   || ',''' || lot_note || ''',''' || NYCMAP_BLDG_FLAG || ''',''' || MISSING_RPAD_FLAG 
--   || ''',NULL,NULL,NULL,NULL,''' || LAST_MODIFIED_BY || ''',NULL,0,0,NULL,0,''' || GLOBALID || ''','
--   || 'ST_GeomFromText(''' || SDO_UTIL.TO_WKTGEOMETRY(shape) || ''',2263));'
--   from TAX_LOT_POLYGON_TMPSDO
---  where block = 2386
--   order by lot
insert into tax_lot_polygon_scratch
(objectid, boro, block, lot, bbl, community_district, regular_lot_indicator, number_lot_sides, condo_flag, reuc_flag,
 air_rights_flag, subterranean_flag, easement_flag, section_number, volume_number, page_number, lot_note,  
 nycmap_bldg_flag, missing_rpad_flag, conversion_exception_flag, value_reflected_out_flag, created_by,
 created_date, last_modified_by, last_modified_date, av_change, bw_change, effective_tax_year, bill_bbl_flag,
 globalid, shape)
 values(3,'3',2386,1,'3023860001',NULL,'I',0,'','','','','',8,5,7,'','1','0',NULL,NULL,NULL,NULL,'sj',NULL,0,0,NULL,0,'{6C3730FC-3020-493F-B1A0-1217CF0A300C}',ST_GeomFromText('POLYGON ((997069.975478798 198694.043458313, 997001.063862726 198726.930498347, 996956.838582695 198634.863426253, 996979.966134712 198623.825986251, 997015.759542748 198698.339650318, 997033.336502761 198689.951298311, 997049.854902774 198682.068034306, 997061.543606788 198676.489794299, 997069.975478798 198694.043458313))',2263));
insert into tax_lot_polygon_scratch
(objectid, boro, block, lot, bbl, community_district, regular_lot_indicator, number_lot_sides, condo_flag, reuc_flag,
 air_rights_flag, subterranean_flag, easement_flag, section_number, volume_number, page_number, lot_note,  
 nycmap_bldg_flag, missing_rpad_flag, conversion_exception_flag, value_reflected_out_flag, created_by,
 created_date, last_modified_by, last_modified_date, av_change, bw_change, effective_tax_year, bill_bbl_flag,
 globalid, shape)
 values(11,'3',2386,2,'3023860002',NULL,'',0,'','','','','',8,5,7,'','0','0',NULL,NULL,NULL,NULL,'sj',NULL,0,0,NULL,0,'{74193D81-AA70-4765-A96C-7E91E291FC75}',ST_GeomFromText('POLYGON ((997102.24581483 198703.698242322, 997010.855094746 198747.313474357, 997001.063862726 198726.930498347, 997069.975478798 198694.043458313, 997075.422646806 198691.443778306, 997092.454838812 198683.315522298, 997102.24581483 198703.698242322))',2263));
insert into tax_lot_polygon_scratch
(objectid, boro, block, lot, bbl, community_district, regular_lot_indicator, number_lot_sides, condo_flag, reuc_flag,
 air_rights_flag, subterranean_flag, easement_flag, section_number, volume_number, page_number, lot_note,  
 nycmap_bldg_flag, missing_rpad_flag, conversion_exception_flag, value_reflected_out_flag, created_by,
 created_date, last_modified_by, last_modified_date, av_change, bw_change, effective_tax_year, bill_bbl_flag,
 globalid, shape)
 values(6,'3',2386,3,'3023860003',NULL,'',0,'','','','','',8,5,7,'','1','0',NULL,NULL,NULL,NULL,'sj',NULL,0,0,NULL,0,'{8C14592F-875A-4E71-B988-DF20A973CD37}',ST_GeomFromText('POLYGON ((997113.306038842 198726.722626343, 997021.915062755 198770.338114381, 997010.855094746 198747.313474357, 997102.24581483 198703.698242322, 997113.306038842 198726.722626343))',2263));
insert into tax_lot_polygon_scratch
(objectid, boro, block, lot, bbl, community_district, regular_lot_indicator, number_lot_sides, condo_flag, reuc_flag,
 air_rights_flag, subterranean_flag, easement_flag, section_number, volume_number, page_number, lot_note,  
 nycmap_bldg_flag, missing_rpad_flag, conversion_exception_flag, value_reflected_out_flag, created_by,
 created_date, last_modified_by, last_modified_date, av_change, bw_change, effective_tax_year, bill_bbl_flag,
 globalid, shape)
 values(5,'3',2386,4,'3023860004',NULL,'',0,'','','','','',8,5,7,'','0','0',NULL,NULL,NULL,NULL,'sj',NULL,0,0,NULL,0,'{51016302-0CFA-47FC-ACC7-4F56A9A59639}',ST_GeomFromText('POLYGON ((997137.007542864 198776.070210382, 997045.673910767 198819.79859443, 997021.915062755 198770.338114381, 997113.306038842 198726.722626343, 997137.007542864 198776.070210382))',2263));
insert into tax_lot_polygon_scratch
(objectid, boro, block, lot, bbl, community_district, regular_lot_indicator, number_lot_sides, condo_flag, reuc_flag,
 air_rights_flag, subterranean_flag, easement_flag, section_number, volume_number, page_number, lot_note,  
 nycmap_bldg_flag, missing_rpad_flag, conversion_exception_flag, value_reflected_out_flag, created_by,
 created_date, last_modified_by, last_modified_date, av_change, bw_change, effective_tax_year, bill_bbl_flag,
 globalid, shape)
 values(10,'3',2386,7,'3023860007',NULL,'',0,'','','','','',8,5,7,'','1','0',NULL,NULL,NULL,NULL,'sj',NULL,0,0,NULL,0,'{F36C3699-7360-4011-99DB-4B586C047956}',ST_GeomFromText('POLYGON ((997317.713591024 198689.552194312, 997274.004918978 198710.47891432, 997226.337718934 198733.30080235, 997137.007542864 198776.070210382, 997113.306038842 198726.722626343, 997102.24581483 198703.698242322, 997092.454838812 198683.315522298, 997114.468022838 198672.809794292, 997137.33394286 198661.897282288, 997160.793526873 198650.701378271, 997181.838774905 198640.657730266, 997221.492406935 198621.733698249, 997229.534646943 198617.895490244, 997273.095094979 198597.187394217, 997317.713591024 198689.552194312))',2263));
insert into tax_lot_polygon_scratch
(objectid, boro, block, lot, bbl, community_district, regular_lot_indicator, number_lot_sides, condo_flag, reuc_flag,
 air_rights_flag, subterranean_flag, easement_flag, section_number, volume_number, page_number, lot_note,  
 nycmap_bldg_flag, missing_rpad_flag, conversion_exception_flag, value_reflected_out_flag, created_by,
 created_date, last_modified_by, last_modified_date, av_change, bw_change, effective_tax_year, bill_bbl_flag,
 globalid, shape)
 values(4,'3',2386,18,'3023860018',NULL,'I',0,'','','','','',8,5,7,'','0','0',NULL,NULL,NULL,NULL,'sj',NULL,0,0,NULL,0,'{76DC2BAF-572D-45DC-BA8F-582522AAB5B9}',ST_GeomFromText('POLYGON ((997229.534646943 198617.895490244, 997221.492406935 198621.733698249, 997165.057462886 198535.493442163, 997228.635318935 198505.151298136, 997273.095094979 198597.187394217, 997229.534646943 198617.895490244))',2263));
insert into tax_lot_polygon_scratch
(objectid, boro, block, lot, bbl, community_district, regular_lot_indicator, number_lot_sides, condo_flag, reuc_flag,
 air_rights_flag, subterranean_flag, easement_flag, section_number, volume_number, page_number, lot_note,  
 nycmap_bldg_flag, missing_rpad_flag, conversion_exception_flag, value_reflected_out_flag, created_by,
 created_date, last_modified_by, last_modified_date, av_change, bw_change, effective_tax_year, bill_bbl_flag,
 globalid, shape)
 values(8,'3',2386,21,'3023860021',NULL,'I',0,'','','','','',8,5,7,'','2','0',NULL,NULL,NULL,NULL,'sj',NULL,0,0,NULL,0,'{21774E39-E113-4F59-83E8-546DB53C5261}',ST_GeomFromText('POLYGON ((997181.838774905 198640.657730266, 997137.613494858 198548.590658173, 997165.057462886 198535.493442163, 997221.492406935 198621.733698249, 997181.838774905 198640.657730266))',2263));
insert into tax_lot_polygon_scratch
(objectid, boro, block, lot, bbl, community_district, regular_lot_indicator, number_lot_sides, condo_flag, reuc_flag,
 air_rights_flag, subterranean_flag, easement_flag, section_number, volume_number, page_number, lot_note,  
 nycmap_bldg_flag, missing_rpad_flag, conversion_exception_flag, value_reflected_out_flag, created_by,
 created_date, last_modified_by, last_modified_date, av_change, bw_change, effective_tax_year, bill_bbl_flag,
 globalid, shape)
 values(13,'3',2386,23,'3023860023',NULL,'',0,'','','','','',8,5,7,'','1','0',NULL,NULL,NULL,NULL,'sj',NULL,0,0,NULL,0,'{E9C6FB4D-4BC5-43B0-A94B-6074ED8CFDC0}',ST_GeomFromText('POLYGON ((997160.793526873 198650.701378271, 997116.568246841 198558.634306192, 997137.613494858 198548.590658173, 997181.838774905 198640.657730266, 997160.793526873 198650.701378271))',2263));
insert into tax_lot_polygon_scratch
(objectid, boro, block, lot, bbl, community_district, regular_lot_indicator, number_lot_sides, condo_flag, reuc_flag,
 air_rights_flag, subterranean_flag, easement_flag, section_number, volume_number, page_number, lot_note,  
 nycmap_bldg_flag, missing_rpad_flag, conversion_exception_flag, value_reflected_out_flag, created_by,
 created_date, last_modified_by, last_modified_date, av_change, bw_change, effective_tax_year, bill_bbl_flag,
 globalid, shape)
 values(12,'3',2386,24,'3023860024',NULL,'',0,'','','','','',8,5,7,'','1','0',NULL,NULL,NULL,NULL,'sj',NULL,0,0,NULL,0,'{10C4B99A-3D3C-4C46-8C67-D45FCC9DCBE1}',ST_GeomFromText('POLYGON ((997116.568246841 198558.634306192, 997160.793526873 198650.701378271, 997137.33394286 198661.897282288, 997093.108662814 198569.829954192, 997116.568246841 198558.634306192))',2263));
insert into tax_lot_polygon_scratch
(objectid, boro, block, lot, bbl, community_district, regular_lot_indicator, number_lot_sides, condo_flag, reuc_flag,
 air_rights_flag, subterranean_flag, easement_flag, section_number, volume_number, page_number, lot_note,  
 nycmap_bldg_flag, missing_rpad_flag, conversion_exception_flag, value_reflected_out_flag, created_by,
 created_date, last_modified_by, last_modified_date, av_change, bw_change, effective_tax_year, bill_bbl_flag,
 globalid, shape)
 values(14,'3',2386,25,'3023860025',NULL,'',0,'','','','','',8,5,7,'','1','0',NULL,NULL,NULL,NULL,'sj',NULL,0,0,NULL,0,'{67F2825C-0C47-4EB5-9034-237A7223AC13}',ST_GeomFromText('POLYGON ((997070.242742792 198580.742466211, 997093.108662814 198569.829954192, 997137.33394286 198661.897282288, 997114.468022838 198672.809794292, 997070.242742792 198580.742466211))',2263));
insert into tax_lot_polygon_scratch
(objectid, boro, block, lot, bbl, community_district, regular_lot_indicator, number_lot_sides, condo_flag, reuc_flag,
 air_rights_flag, subterranean_flag, easement_flag, section_number, volume_number, page_number, lot_note,  
 nycmap_bldg_flag, missing_rpad_flag, conversion_exception_flag, value_reflected_out_flag, created_by,
 created_date, last_modified_by, last_modified_date, av_change, bw_change, effective_tax_year, bill_bbl_flag,
 globalid, shape)
 values(2,'3',2386,26,'3023860026',NULL,'',0,'','','','','',8,5,7,'','1','0',NULL,NULL,NULL,NULL,'sj',NULL,0,0,NULL,0,'{CC3F2565-96EA-4953-A97C-5B55A5209354}',ST_GeomFromText('POLYGON ((997114.468022838 198672.809794292, 997092.454838812 198683.315522298, 997048.229558781 198591.248194218, 997070.242742792 198580.742466211, 997114.468022838 198672.809794292))',2263));
insert into tax_lot_polygon_scratch
(objectid, boro, block, lot, bbl, community_district, regular_lot_indicator, number_lot_sides, condo_flag, reuc_flag,
 air_rights_flag, subterranean_flag, easement_flag, section_number, volume_number, page_number, lot_note,  
 nycmap_bldg_flag, missing_rpad_flag, conversion_exception_flag, value_reflected_out_flag, created_by,
 created_date, last_modified_by, last_modified_date, av_change, bw_change, effective_tax_year, bill_bbl_flag,
 globalid, shape)
 values(9,'3',2386,27,'3023860027',NULL,'',0,'','','','','',8,5,7,'','0','0',NULL,NULL,NULL,NULL,'sj',NULL,0,0,NULL,0,'{D0E70451-5AD2-44A4-A7CD-3C3D29518200}',ST_GeomFromText('POLYGON ((997092.454838812 198683.315522298, 997075.422646806 198691.443778306, 997031.197110757 198599.376450226, 997048.229558781 198591.248194218, 997092.454838812 198683.315522298))',2263));
insert into tax_lot_polygon_scratch
(objectid, boro, block, lot, bbl, community_district, regular_lot_indicator, number_lot_sides, condo_flag, reuc_flag,
 air_rights_flag, subterranean_flag, easement_flag, section_number, volume_number, page_number, lot_note,  
 nycmap_bldg_flag, missing_rpad_flag, conversion_exception_flag, value_reflected_out_flag, created_by,
 created_date, last_modified_by, last_modified_date, av_change, bw_change, effective_tax_year, bill_bbl_flag,
 globalid, shape)
 values(15,'3',2386,28,'3023860028',NULL,'I',0,'','','','','',8,5,7,'','1','0',NULL,NULL,NULL,NULL,'sj',NULL,0,0,NULL,0,'{DB198F5C-CF64-4804-95DF-B61C2652C473}',ST_GeomFromText('POLYGON ((997075.422646806 198691.443778306, 997069.975478798 198694.043458313, 997061.543606788 198676.489794299, 997049.854902774 198682.068034306, 997014.06175074 198607.554370224, 997031.197110757 198599.376450226, 997075.422646806 198691.443778306))',2263));
insert into tax_lot_polygon_scratch
(objectid, boro, block, lot, bbl, community_district, regular_lot_indicator, number_lot_sides, condo_flag, reuc_flag,
 air_rights_flag, subterranean_flag, easement_flag, section_number, volume_number, page_number, lot_note,  
 nycmap_bldg_flag, missing_rpad_flag, conversion_exception_flag, value_reflected_out_flag, created_by,
 created_date, last_modified_by, last_modified_date, av_change, bw_change, effective_tax_year, bill_bbl_flag,
 globalid, shape)
 values(7,'3',2386,29,'3023860029',NULL,'',0,'','','','','',8,5,7,'','1','0',NULL,NULL,NULL,NULL,'sj',NULL,0,0,NULL,0,'{D9B71D84-E35C-4AC5-923D-09C74834DC55}',ST_GeomFromText('POLYGON ((997014.06175074 198607.554370224, 997049.854902774 198682.068034306, 997033.336502761 198689.951298311, 996997.543094725 198615.437634245, 997014.06175074 198607.554370224))',2263));
insert into tax_lot_polygon_scratch
(objectid, boro, block, lot, bbl, community_district, regular_lot_indicator, number_lot_sides, condo_flag, reuc_flag,
 air_rights_flag, subterranean_flag, easement_flag, section_number, volume_number, page_number, lot_note,  
 nycmap_bldg_flag, missing_rpad_flag, conversion_exception_flag, value_reflected_out_flag, created_by,
 created_date, last_modified_by, last_modified_date, av_change, bw_change, effective_tax_year, bill_bbl_flag,
 globalid, shape)
 values(1,'3',2386,129,'3023860129',NULL,'',0,'','','','','',8,5,7,'','0','0',NULL,NULL,NULL,NULL,'sj',NULL,0,0,NULL,0,'{D2A58B1B-5E7A-4E9D-A170-768C1F305839}',ST_GeomFromText('POLYGON ((997015.759542748 198698.339650318, 996979.966134712 198623.825986251, 996997.543094725 198615.437634245, 997033.336502761 198689.951298311, 997015.759542748 198698.339650318))',2263));
 commit;

