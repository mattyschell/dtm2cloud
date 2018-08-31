--This is the "edited" data on temp scratch postgres database
--will dump out as shp and toss over to an sde-like facsimile
begin;
-- brooklyn block 2386
-- on August 22 2018 lots 12 and 14 (3023860012,3023860014)
-- merged into 7 (3023860007)
-- I am extracting tax_block_polygon data from dof_dtm.TAX_BLOCK_POLYGON_0829SDO@geocdev. It doesnt change
insert into tax_block_polygon 
(objectid, boro, block, eop_overlap_flag, jagged_st_flag, created_by, created_date, last_modified_by, last_modified_date, section_number, volume_number, globalid, shape)
values 
(24092,'3',2386,0,0,NULL,NULL,'LTP',NULL,8,5,'{CB124D70-A02D-47FE-9EFA-3CC76A04F08C}',
ST_GeomFromText('POLYGON ((997273.095094979 198597.187394217, 997317.713591024 198689.552194312, 997274.004918978 198710.47891432, 997226.337718934 198733.30080235, 997137.007542864 198776.070210382, 997045.673910767 198819.79859443, 997021.915062755 198770.338114381, 997010.855094746 198747.313474357, 997001.063862726 198726.930498347, 996956.838582695 198634.863426253, 996979.966134712 198623.825986251, 996997.543094725 198615.437634245, 997014.06175074 198607.554370224, 997031.197110757 198599.376450226, 997048.229558781 198591.248194218, 997070.242742792 198580.742466211, 997093.108662814 198569.829954192, 997116.568246841 198558.634306192, 997137.613494858 198548.590658173, 997165.057462886 198535.493442163, 997228.635318935 198505.151298136, 997273.095094979 198597.187394217))',2263)
);
-- I am artisinally hand-crafting tax_lot_polygon data from live production into dof_dtm.TAX_LOT_POLYGON_TMPSDO@geocdev
insert into tax_lot_polygon
(objectid, boro, block, lot, bbl, community_district, regular_lot_indicator, number_lot_sides, condo_flag, reuc_flag,
 air_rights_flag, subterranean_flag, easement_flag, section_number, volume_number, page_number, lot_note,  
 nycmap_bldg_flag, missing_rpad_flag, conversion_exception_flag, value_reflected_out_flag, created_by,
 created_date, last_modified_by, last_modified_date, av_change, bw_change, effective_tax_year, bill_bbl_flag,
 globalid, shape)
 values
(1436970,'3',2386,7,'3023860007', NULL, NULL, 0,NULL,NULL,NULL,NULL,NULL,8,5,7,NULL,1,0,NULL,NULL,NULL,NULL,'sj',
 NULL,0,0,'2019 - 2020',0,'{A244A018-B4DB-4FDA-B7D4-EFFFC4D3D05D}',
 ST_GeomFromText('POLYGON ((997317.713591024 198689.552194312, 997274.004918978 198710.47891432, 997226.337718934 198733.30080235, 997137.007542864 198776.070210382, 997113.306038842 198726.722626343, 997102.24581483 198703.698242322, 997092.454838812 198683.315522298, 997114.468022838 198672.809794292, 997137.33394286 198661.897282288, 997160.793526873 198650.701378271, 997181.838774905 198640.657730266, 997221.492406935 198621.733698249, 997229.534646943 198617.895490244, 997273.095094979 198597.187394217, 997317.713591024 198689.552194312))',2263)
);
commit;

