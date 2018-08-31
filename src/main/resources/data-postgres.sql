--This is the "unedited" data on target postgres
begin;
-- brooklyn block 2386
-- on August 22 2018 lots 12 and 14 (3023860012,3023860014)
-- merged into 7 (3023860007)
-- I am extracting tax_block_point data from dof_dtm.TAX_BLOCK_POINT_0830SDO@geocdev
insert into tax_block_point 
(boro, block, shape)
values 
('3', 2386, ST_GeomFromText('POINT (997137.184843644 198662.384221137)',2263));
-- I am extracting tax_lot_point data from dof_dtm.TAX_LOT_POINT_0830SDO@geocdev (truncated cols)
insert into tax_lot_point
(bbl,lot,air_rights_flag,condo_flag,reuc_flag,subterranean_flag,lot_area,shape)
values
('3023860007',7,NULL,NULL,NULL,NULL,20577.3,ST_GeomFromText('POINT (997205.17388089 198686.628923297)',2263));
commit;

