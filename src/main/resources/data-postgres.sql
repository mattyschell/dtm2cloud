--This is the "unedited" data on target postgres
begin;
-- brooklyn block 2386 unedited data
-- on August 22 2018 lots 12 and 14 (3023860012,3023860014)
-- merged into 7 (3023860007)
-- I am extracting tax_block_point data from dof_dtm.TAX_BLOCK_POINT_0830SDO@geocdev
---------------------------------------
-- tax_block_polygon and tax_block_point
---------------------------------------
insert into tax_block_polygon
(objectid, boro, block, eop_overlap_flag, jagged_st_flag, created_by, created_date, last_modified_by, last_modified_date, section_number, volume_number, globalid, shape)
values 
(24092,'3',2386,0,0,NULL,NULL,'LTP',NULL,8,5,'{CB124D70-A02D-47FE-9EFA-3CC76A04F08C}',
ST_GeomFromText('POLYGON ((997273.095094979 198597.187394217, 997317.713591024 198689.552194312, 997274.004918978 198710.47891432, 997226.337718934 198733.30080235, 997137.007542864 198776.070210382, 997045.673910767 198819.79859443, 997021.915062755 198770.338114381, 997010.855094746 198747.313474357, 997001.063862726 198726.930498347, 996956.838582695 198634.863426253, 996979.966134712 198623.825986251, 996997.543094725 198615.437634245, 997014.06175074 198607.554370224, 997031.197110757 198599.376450226, 997048.229558781 198591.248194218, 997070.242742792 198580.742466211, 997093.108662814 198569.829954192, 997116.568246841 198558.634306192, 997137.613494858 198548.590658173, 997165.057462886 198535.493442163, 997228.635318935 198505.151298136, 997273.095094979 198597.187394217))',2263)
);
insert into tax_block_point 
(boro, block, shape)
values 
('3', 2386, ST_GeomFromText('POINT (997137.184843644 198662.384221137)',2263));
---------------------------------------
-- tax_lot_polygon and tax_lot_point
---------------------------------------
--  select 'insert into tax_lot_polygon
--(objectid, boro, block, lot, bbl, community_district, regular_lot_indicator, number_lot_sides, condo_flag, reuc_flag,
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
--  where block = 2386
insert into tax_lot_polygon
(objectid, boro, block, lot, bbl, community_district, regular_lot_indicator, number_lot_sides, condo_flag, reuc_flag,
 air_rights_flag, subterranean_flag, easement_flag, section_number, volume_number, page_number, lot_note,  
 nycmap_bldg_flag, missing_rpad_flag, conversion_exception_flag, value_reflected_out_flag, created_by,
 created_date, last_modified_by, last_modified_date, av_change, bw_change, effective_tax_year, bill_bbl_flag,
 globalid, shape) values (7,'3',2386,1,'3023860001',NULL,'I',0,'','','','','',8,5,7,'','1','0',NULL,NULL,NULL,NULL,'sj',NULL,0,0,NULL,0,'{DDFD27FA-929B-4EF8-998D-4108FA08343A}',ST_GeomFromText('POLYGON ((997069.975478798 198694.043458313, 997001.063862726 198726.930498347, 996956.838582695 198634.863426253, 996979.966134712 198623.825986251, 997015.759542748 198698.339650318, 997033.336502761 198689.951298311, 997049.854902774 198682.068034306, 997061.543606788 198676.489794299, 997069.975478798 198694.043458313))',2263));
insert into tax_lot_polygon
(objectid, boro, block, lot, bbl, community_district, regular_lot_indicator, number_lot_sides, condo_flag, reuc_flag,
 air_rights_flag, subterranean_flag, easement_flag, section_number, volume_number, page_number, lot_note,  
 nycmap_bldg_flag, missing_rpad_flag, conversion_exception_flag, value_reflected_out_flag, created_by,
 created_date, last_modified_by, last_modified_date, av_change, bw_change, effective_tax_year, bill_bbl_flag,
 globalid, shape) values (13,'3',2386,2,'3023860002',NULL,'',0,'','','','','',8,5,7,'','0','0',NULL,NULL,NULL,NULL,'sj',NULL,0,0,NULL,0,'{58B90857-67FC-4D1C-AF46-4C2B880EB0CC}',ST_GeomFromText('POLYGON ((997102.24581483 198703.698242322, 997010.855094746 198747.313474357, 997001.063862726 198726.930498347, 997069.975478798 198694.043458313, 997075.422646806 198691.443778306, 997092.454838812 198683.315522298, 997102.24581483 198703.698242322))',2263));
insert into tax_lot_polygon
(objectid, boro, block, lot, bbl, community_district, regular_lot_indicator, number_lot_sides, condo_flag, reuc_flag,
 air_rights_flag, subterranean_flag, easement_flag, section_number, volume_number, page_number, lot_note,  
 nycmap_bldg_flag, missing_rpad_flag, conversion_exception_flag, value_reflected_out_flag, created_by,
 created_date, last_modified_by, last_modified_date, av_change, bw_change, effective_tax_year, bill_bbl_flag,
 globalid, shape) values (15,'3',2386,3,'3023860003',NULL,'',0,'','','','','',8,5,7,'','1','0',NULL,NULL,NULL,NULL,'sj',NULL,0,0,NULL,0,'{16985104-8FC9-4CB3-A743-7636D7375281}',ST_GeomFromText('POLYGON ((997113.306038842 198726.722626343, 997021.915062755 198770.338114381, 997010.855094746 198747.313474357, 997102.24581483 198703.698242322, 997113.306038842 198726.722626343))',2263));
insert into tax_lot_polygon
(objectid, boro, block, lot, bbl, community_district, regular_lot_indicator, number_lot_sides, condo_flag, reuc_flag,
 air_rights_flag, subterranean_flag, easement_flag, section_number, volume_number, page_number, lot_note,  
 nycmap_bldg_flag, missing_rpad_flag, conversion_exception_flag, value_reflected_out_flag, created_by,
 created_date, last_modified_by, last_modified_date, av_change, bw_change, effective_tax_year, bill_bbl_flag,
 globalid, shape) values (2,'3',2386,4,'3023860004',NULL,'',0,'','','','','',8,5,7,'','0','0',NULL,NULL,NULL,NULL,'sj',NULL,0,0,NULL,0,'{C9C87772-11DC-40A5-B433-D87C20E6688D}',ST_GeomFromText('POLYGON ((997137.007542864 198776.070210382, 997045.673910767 198819.79859443, 997021.915062755 198770.338114381, 997113.306038842 198726.722626343, 997137.007542864 198776.070210382))',2263));
insert into tax_lot_polygon
(objectid, boro, block, lot, bbl, community_district, regular_lot_indicator, number_lot_sides, condo_flag, reuc_flag,
 air_rights_flag, subterranean_flag, easement_flag, section_number, volume_number, page_number, lot_note,  
 nycmap_bldg_flag, missing_rpad_flag, conversion_exception_flag, value_reflected_out_flag, created_by,
 created_date, last_modified_by, last_modified_date, av_change, bw_change, effective_tax_year, bill_bbl_flag,
 globalid, shape) values (3,'3',2386,7,'3023860007',NULL,'',0,'','','','','',8,5,7,'','1','0',NULL,NULL,NULL,NULL,'sj',NULL,0,0,NULL,0,'{062B2E4D-650F-4D14-BDBF-5E080F62E758}',ST_GeomFromText('POLYGON ((997226.337718934 198733.30080235, 997137.007542864 198776.070210382, 997113.306038842 198726.722626343, 997102.24581483 198703.698242322, 997092.454838812 198683.315522298, 997114.468022838 198672.809794292, 997137.33394286 198661.897282288, 997160.793526873 198650.701378271, 997181.838774905 198640.657730266, 997226.337718934 198733.30080235))',2263));
insert into tax_lot_polygon
(objectid, boro, block, lot, bbl, community_district, regular_lot_indicator, number_lot_sides, condo_flag, reuc_flag,
 air_rights_flag, subterranean_flag, easement_flag, section_number, volume_number, page_number, lot_note,  
 nycmap_bldg_flag, missing_rpad_flag, conversion_exception_flag, value_reflected_out_flag, created_by,
 created_date, last_modified_by, last_modified_date, av_change, bw_change, effective_tax_year, bill_bbl_flag,
 globalid, shape) values (12,'3',2386,12,'3023860012',NULL,'',0,'','','','','',8,5,7,'','0','0',NULL,NULL,NULL,NULL,'sj',NULL,0,0,NULL,0,'{83B90A7B-155E-43C6-A2BD-105AAABC8D07}',ST_GeomFromText('POLYGON ((997229.534646943 198617.895490244, 997274.004918978 198710.47891432, 997226.337718934 198733.30080235, 997181.838774905 198640.657730266, 997221.492406935 198621.733698249, 997229.534646943 198617.895490244))',2263));
insert into tax_lot_polygon
(objectid, boro, block, lot, bbl, community_district, regular_lot_indicator, number_lot_sides, condo_flag, reuc_flag,
 air_rights_flag, subterranean_flag, easement_flag, section_number, volume_number, page_number, lot_note,  
 nycmap_bldg_flag, missing_rpad_flag, conversion_exception_flag, value_reflected_out_flag, created_by,
 created_date, last_modified_by, last_modified_date, av_change, bw_change, effective_tax_year, bill_bbl_flag,
 globalid, shape) values (4,'3',2386,14,'3023860014',NULL,'',0,'','','','','',8,5,7,'','2','0',NULL,NULL,NULL,NULL,'sj',NULL,0,0,NULL,0,'{B2D18F38-D809-41F3-87F6-1E09B03F448B}',ST_GeomFromText('POLYGON ((997274.004918978 198710.47891432, 997229.534646943 198617.895490244, 997273.095094979 198597.187394217, 997317.713591024 198689.552194312, 997274.004918978 198710.47891432))',2263));
insert into tax_lot_polygon
(objectid, boro, block, lot, bbl, community_district, regular_lot_indicator, number_lot_sides, condo_flag, reuc_flag,
 air_rights_flag, subterranean_flag, easement_flag, section_number, volume_number, page_number, lot_note,  
 nycmap_bldg_flag, missing_rpad_flag, conversion_exception_flag, value_reflected_out_flag, created_by,
 created_date, last_modified_by, last_modified_date, av_change, bw_change, effective_tax_year, bill_bbl_flag,
 globalid, shape) values (16,'3',2386,18,'3023860018',NULL,'I',0,'','','','','',8,5,7,'','0','0',NULL,NULL,NULL,NULL,'sj',NULL,0,0,NULL,0,'{DA98CFFA-31D1-4756-A0BB-7AD82058A761}',ST_GeomFromText('POLYGON ((997229.534646943 198617.895490244, 997221.492406935 198621.733698249, 997165.057462886 198535.493442163, 997228.635318935 198505.151298136, 997273.095094979 198597.187394217, 997229.534646943 198617.895490244))',2263));
insert into tax_lot_polygon
(objectid, boro, block, lot, bbl, community_district, regular_lot_indicator, number_lot_sides, condo_flag, reuc_flag,
 air_rights_flag, subterranean_flag, easement_flag, section_number, volume_number, page_number, lot_note,  
 nycmap_bldg_flag, missing_rpad_flag, conversion_exception_flag, value_reflected_out_flag, created_by,
 created_date, last_modified_by, last_modified_date, av_change, bw_change, effective_tax_year, bill_bbl_flag,
 globalid, shape) values (11,'3',2386,21,'3023860021',NULL,'I',0,'','','','','',8,5,7,'','2','0',NULL,NULL,NULL,NULL,'sj',NULL,0,0,NULL,0,'{C1EE26E6-7427-4EDE-BAE0-4B4F97CBDE8D}',ST_GeomFromText('POLYGON ((997181.838774905 198640.657730266, 997137.613494858 198548.590658173, 997165.057462886 198535.493442163, 997221.492406935 198621.733698249, 997181.838774905 198640.657730266))',2263));
insert into tax_lot_polygon
(objectid, boro, block, lot, bbl, community_district, regular_lot_indicator, number_lot_sides, condo_flag, reuc_flag,
 air_rights_flag, subterranean_flag, easement_flag, section_number, volume_number, page_number, lot_note,  
 nycmap_bldg_flag, missing_rpad_flag, conversion_exception_flag, value_reflected_out_flag, created_by,
 created_date, last_modified_by, last_modified_date, av_change, bw_change, effective_tax_year, bill_bbl_flag,
 globalid, shape) values (14,'3',2386,23,'3023860023',NULL,'',0,'','','','','',8,5,7,'','1','0',NULL,NULL,NULL,NULL,'sj',NULL,0,0,NULL,0,'{B1A315BB-500F-4A65-8EFA-135B2CA7B672}',ST_GeomFromText('POLYGON ((997160.793526873 198650.701378271, 997116.568246841 198558.634306192, 997137.613494858 198548.590658173, 997181.838774905 198640.657730266, 997160.793526873 198650.701378271))',2263));
insert into tax_lot_polygon
(objectid, boro, block, lot, bbl, community_district, regular_lot_indicator, number_lot_sides, condo_flag, reuc_flag,
 air_rights_flag, subterranean_flag, easement_flag, section_number, volume_number, page_number, lot_note,  
 nycmap_bldg_flag, missing_rpad_flag, conversion_exception_flag, value_reflected_out_flag, created_by,
 created_date, last_modified_by, last_modified_date, av_change, bw_change, effective_tax_year, bill_bbl_flag,
 globalid, shape) values (9,'3',2386,24,'3023860024',NULL,'',0,'','','','','',8,5,7,'','1','0',NULL,NULL,NULL,NULL,'sj',NULL,0,0,NULL,0,'{6FB6B8EE-B7B3-48F7-8C5B-DB9A7AB70099}',ST_GeomFromText('POLYGON ((997116.568246841 198558.634306192, 997160.793526873 198650.701378271, 997137.33394286 198661.897282288, 997093.108662814 198569.829954192, 997116.568246841 198558.634306192))',2263));
insert into tax_lot_polygon
(objectid, boro, block, lot, bbl, community_district, regular_lot_indicator, number_lot_sides, condo_flag, reuc_flag,
 air_rights_flag, subterranean_flag, easement_flag, section_number, volume_number, page_number, lot_note,  
 nycmap_bldg_flag, missing_rpad_flag, conversion_exception_flag, value_reflected_out_flag, created_by,
 created_date, last_modified_by, last_modified_date, av_change, bw_change, effective_tax_year, bill_bbl_flag,
 globalid, shape) values (5,'3',2386,25,'3023860025',NULL,'',0,'','','','','',8,5,7,'','1','0',NULL,NULL,NULL,NULL,'sj',NULL,0,0,NULL,0,'{A2C3D8FF-F6A5-41BF-9AE3-ABBED6131F83}',ST_GeomFromText('POLYGON ((997070.242742792 198580.742466211, 997093.108662814 198569.829954192, 997137.33394286 198661.897282288, 997114.468022838 198672.809794292, 997070.242742792 198580.742466211))',2263));
insert into tax_lot_polygon
(objectid, boro, block, lot, bbl, community_district, regular_lot_indicator, number_lot_sides, condo_flag, reuc_flag,
 air_rights_flag, subterranean_flag, easement_flag, section_number, volume_number, page_number, lot_note,  
 nycmap_bldg_flag, missing_rpad_flag, conversion_exception_flag, value_reflected_out_flag, created_by,
 created_date, last_modified_by, last_modified_date, av_change, bw_change, effective_tax_year, bill_bbl_flag,
 globalid, shape) values (8,'3',2386,26,'3023860026',NULL,'',0,'','','','','',8,5,7,'','1','0',NULL,NULL,NULL,NULL,'sj',NULL,0,0,NULL,0,'{C46EA24B-597A-4810-84CC-4E207A06BFD2}',ST_GeomFromText('POLYGON ((997114.468022838 198672.809794292, 997092.454838812 198683.315522298, 997048.229558781 198591.248194218, 997070.242742792 198580.742466211, 997114.468022838 198672.809794292))',2263));
insert into tax_lot_polygon
(objectid, boro, block, lot, bbl, community_district, regular_lot_indicator, number_lot_sides, condo_flag, reuc_flag,
 air_rights_flag, subterranean_flag, easement_flag, section_number, volume_number, page_number, lot_note,  
 nycmap_bldg_flag, missing_rpad_flag, conversion_exception_flag, value_reflected_out_flag, created_by,
 created_date, last_modified_by, last_modified_date, av_change, bw_change, effective_tax_year, bill_bbl_flag,
 globalid, shape) values (17,'3',2386,27,'3023860027',NULL,'',0,'','','','','',8,5,7,'','0','0',NULL,NULL,NULL,NULL,'sj',NULL,0,0,NULL,0,'{171B1B10-7C3E-4DCC-BE09-8E8904F81FE3}',ST_GeomFromText('POLYGON ((997092.454838812 198683.315522298, 997075.422646806 198691.443778306, 997031.197110757 198599.376450226, 997048.229558781 198591.248194218, 997092.454838812 198683.315522298))',2263));
insert into tax_lot_polygon
(objectid, boro, block, lot, bbl, community_district, regular_lot_indicator, number_lot_sides, condo_flag, reuc_flag,
 air_rights_flag, subterranean_flag, easement_flag, section_number, volume_number, page_number, lot_note,  
 nycmap_bldg_flag, missing_rpad_flag, conversion_exception_flag, value_reflected_out_flag, created_by,
 created_date, last_modified_by, last_modified_date, av_change, bw_change, effective_tax_year, bill_bbl_flag,
 globalid, shape) values (6,'3',2386,28,'3023860028',NULL,'I',0,'','','','','',8,5,7,'','1','0',NULL,NULL,NULL,NULL,'sj',NULL,0,0,NULL,0,'{9B23E723-5E5A-4651-9107-9AA59D620615}',ST_GeomFromText('POLYGON ((997075.422646806 198691.443778306, 997069.975478798 198694.043458313, 997061.543606788 198676.489794299, 997049.854902774 198682.068034306, 997014.06175074 198607.554370224, 997031.197110757 198599.376450226, 997075.422646806 198691.443778306))',2263));
insert into tax_lot_polygon
(objectid, boro, block, lot, bbl, community_district, regular_lot_indicator, number_lot_sides, condo_flag, reuc_flag,
 air_rights_flag, subterranean_flag, easement_flag, section_number, volume_number, page_number, lot_note,  
 nycmap_bldg_flag, missing_rpad_flag, conversion_exception_flag, value_reflected_out_flag, created_by,
 created_date, last_modified_by, last_modified_date, av_change, bw_change, effective_tax_year, bill_bbl_flag,
 globalid, shape) values (10,'3',2386,29,'3023860029',NULL,'',0,'','','','','',8,5,7,'','1','0',NULL,NULL,NULL,NULL,'sj',NULL,0,0,NULL,0,'{D1CD70D8-9066-4C20-B554-A19EDF1F1FED}',ST_GeomFromText('POLYGON ((997014.06175074 198607.554370224, 997049.854902774 198682.068034306, 997033.336502761 198689.951298311, 996997.543094725 198615.437634245, 997014.06175074 198607.554370224))',2263));
insert into tax_lot_polygon
(objectid, boro, block, lot, bbl, community_district, regular_lot_indicator, number_lot_sides, condo_flag, reuc_flag,
 air_rights_flag, subterranean_flag, easement_flag, section_number, volume_number, page_number, lot_note,  
 nycmap_bldg_flag, missing_rpad_flag, conversion_exception_flag, value_reflected_out_flag, created_by,
 created_date, last_modified_by, last_modified_date, av_change, bw_change, effective_tax_year, bill_bbl_flag,
 globalid, shape) values (1,'3',2386,129,'3023860129',NULL,'',0,'','','','','',8,5,7,'','0','0',NULL,NULL,NULL,NULL,'sj',NULL,0,0,NULL,0,'{D11DC106-BFC5-44C0-8856-F3572CC8F86F}',ST_GeomFromText('POLYGON ((997015.759542748 198698.339650318, 996979.966134712 198623.825986251, 996997.543094725 198615.437634245, 997033.336502761 198689.951298311, 997015.759542748 198698.339650318))',2263));
-- select 'insert into tax_lot_point
--(bbl,lot,air_rights_flag,condo_flag,reuc_flag,subterranean_flag,lot_area,shape)
--values
--(''' || bbl || ''',' || lot || ',NULL,NULL,NULL,NULL,' || lot_area || ',' || 'ST_GeomFromText(''' || mdsys.SDO_UTIL.TO_WKTGEOMETRY(shape) || ''',2263));'
--from 
--dof_taxmap.TAX_LOT_POINT
--where bbl like '302386%'
--order by bbl
insert into tax_lot_point
(bbl,lot,air_rights_flag,condo_flag,reuc_flag,subterranean_flag,lot_area,shape)
values
('3023860001',1,NULL,NULL,NULL,NULL,3605.3,ST_GeomFromText('POINT (996990.5150235873 198675.37824229896)',2263));
insert into tax_lot_point
(bbl,lot,air_rights_flag,condo_flag,reuc_flag,subterranean_flag,lot_area,shape)
values
('3023860002',2,NULL,NULL,NULL,NULL,2289.8,ST_GeomFromText('POINT (997051.6546752721 198715.31449832767)',2263));
insert into tax_lot_point
(bbl,lot,air_rights_flag,condo_flag,reuc_flag,subterranean_flag,lot_area,shape)
values
('3023860003',3,NULL,NULL,NULL,NULL,2586.6,ST_GeomFromText('POINT (997062.0803316794 198737.01817835122)',2263));
insert into tax_lot_point
(bbl,lot,air_rights_flag,condo_flag,reuc_flag,subterranean_flag,lot_area,shape)
values
('3023860004',4,NULL,NULL,NULL,NULL,5550,ST_GeomFromText('POINT (997079.4885068126 198773.26061038673)',2263));
insert into tax_lot_point
(bbl,lot,air_rights_flag,condo_flag,reuc_flag,subterranean_flag,lot_area,shape)
values
('3023860007',7,NULL,NULL,NULL,NULL,10185.1,ST_GeomFromText('POINT (997159.423491316 198708.3639703244)',2263));
insert into tax_lot_point
(bbl,lot,air_rights_flag,condo_flag,reuc_flag,subterranean_flag,lot_area,shape)
values
('3023860012',12,NULL,NULL,NULL,NULL,5429.8,ST_GeomFromText('POINT (997227.9361762502 198675.59814629704)',2263));
insert into tax_lot_point
(bbl,lot,air_rights_flag,condo_flag,reuc_flag,subterranean_flag,lot_area,shape)
values
('3023860014',14,NULL,NULL,NULL,NULL,4962.4,ST_GeomFromText('POINT (997273.6276593064 198653.83315426856)',2263));
insert into tax_lot_point
(bbl,lot,air_rights_flag,condo_flag,reuc_flag,subterranean_flag,lot_area,shape)
values
('3023860018',18,NULL,NULL,NULL,NULL,6517.7,ST_GeomFromText('POINT (997220.0705449865 198563.4424981922)',2263));
insert into tax_lot_point
(bbl,lot,air_rights_flag,condo_flag,reuc_flag,subterranean_flag,lot_area,shape)
values
('3023860021',21,NULL,NULL,NULL,NULL,3796.8,ST_GeomFromText('POINT (997178.0236266728 198588.07558621466)',2263));
insert into tax_lot_point
(bbl,lot,air_rights_flag,condo_flag,reuc_flag,subterranean_flag,lot_area,shape)
values
('3023860023',23,NULL,NULL,NULL,NULL,2381.8,ST_GeomFromText('POINT (997149.2035108677 198599.64601822197)',2263));
insert into tax_lot_point
(bbl,lot,air_rights_flag,condo_flag,reuc_flag,subterranean_flag,lot_area,shape)
values
('3023860024',24,NULL,NULL,NULL,NULL,2655,ST_GeomFromText('POINT (997126.9511293304 198610.26579423994)',2263));
insert into tax_lot_point
(bbl,lot,air_rights_flag,condo_flag,reuc_flag,subterranean_flag,lot_area,shape)
values
('3023860025',25,NULL,NULL,NULL,NULL,2587.8,ST_GeomFromText('POINT (997103.788342824 198621.31987424195)',2263));
insert into tax_lot_point
(bbl,lot,air_rights_flag,condo_flag,reuc_flag,subterranean_flag,lot_area,shape)
values
('3023860026',26,NULL,NULL,NULL,NULL,2491.3,ST_GeomFromText('POINT (997081.3487908063 198632.02899425477)',2263));
insert into tax_lot_point
(bbl,lot,air_rights_flag,condo_flag,reuc_flag,subterranean_flag,lot_area,shape)
values
('3023860027',27,NULL,NULL,NULL,NULL,1927.6,ST_GeomFromText('POINT (997061.8260331383 198641.34598626196)',2263));
insert into tax_lot_point
(bbl,lot,air_rights_flag,condo_flag,reuc_flag,subterranean_flag,lot_area,shape)
values
('3023860028',28,NULL,NULL,NULL,NULL,1687.1,ST_GeomFromText('POINT (997043.4023381708 198646.70995426923)',2263));
insert into tax_lot_point
(bbl,lot,air_rights_flag,condo_flag,reuc_flag,subterranean_flag,lot_area,shape)
values
('3023860029',29,NULL,NULL,NULL,NULL,1513,ST_GeomFromText('POINT (997023.6990559767 198648.7528342679)',2263));
insert into tax_lot_point
(bbl,lot,air_rights_flag,condo_flag,reuc_flag,subterranean_flag,lot_area,shape)
values
('3023860129',129,NULL,NULL,NULL,NULL,1610,ST_GeomFromText('POINT (997006.6513187364 198656.8886422813)',2263));
commit;
