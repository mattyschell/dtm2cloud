-- Reminder context: We are taking a snapshot of production and dropping it into dev
--    to use as a consistent, repeatable, testing source
--    Before running this fella we have run snapshot.py, bringing DOF-edited data from 
--    production to dev
-- Next we would like to get legacy ETL targets from production dropped into dev
--    so that 1) dev version of the application isn't totally out of whack and
--    2) when comparing legacy ETL to modern ETL we are comparing comparable sets of data
-- I am not gonna script this, the FME license does not include an oracle spatial writer
--   and gdal or oracle pl/sql dependencies are overkill
--Get sdo to dev somehow.  Follow your heart
--ogr2ogr -f OCI OCI:DOF_TAXMAP/iluvlarryellison247@GEOCDEV.DOITT.NYCNET OCI:dof_taxmap/iluvlarryellison247@geocprd.doitt.nycnet:TAX_LOT_POINT -nln TAX_LOT_POINTTMP -lco SRID=41088 -lco INDEX=FALSE -lco GEOMETRY_NAME=SHAPE -lco DIM=2 -progress
--ogr2ogr -f OCI OCI:DOF_TAXMAP/iluvlarryellison247@GEOCDEV.DOITT.NYCNET OCI:dof_taxmap/iluvlarryellison247@geocprd.doitt.nycnet:TAX_BLOCK_POINT -nln TAX_BLOCK_POINTTMP -lco SRID=41088 -lco INDEX=FALSE -lco GEOMETRY_NAME=SHAPE -lco DIM=2 -progress
--ogr2ogr -f OCI OCI:DOF_TAXMAP/iluvlarryellison247@GEOCDEV.DOITT.NYCNET OCI:dof_taxmap/iluvlarryellison247@geocprd.doitt.nycnet:LOT_FACE_POINT -nln LOT_FACE_POINTTMP -lco SRID=41088 -lco INDEX=FALSE -lco GEOMETRY_NAME=SHAPE -lco DIM=2 -progress
--
truncate table tax_lot_point;
insert into tax_lot_point 
(bbl, lot, air_rights_flag, condo_flag, reuc_flag, subterranean_flag, shape, lot_area)
select bbl, lot, air_rights_flag, condo_flag, reuc_flag, subterranean_flag, shape, lot_area
from TAX_LOT_POINTTMP;
commit;
truncate table TAX_BLOCK_POINT;
insert into tax_block_point 
(boro, block, shape)
select boro, block, shape 
from TAX_BLOCK_POINTTMP;
commit;
drop index LOT_FACE_POINT_SPATIAL_IDX;
truncate table lot_face_point;
--on dev, likely UNDO tablespace overflow here
--ORA-30036: unable to extend segment by 2 in undo tablespace 'UNDOTBS'
--ORA-06512: at "MDSYS.SDO_IDX", line 12
insert into lot_face_point 
(shape, tax_lot_face_type, bbl, length, approx_length_flag, angle, delta_x, delta_y, boro, block, lot)
SELECT
shape, tax_lot_face_type, bbl, length, approx_length_flag, angle, delta_x, delta_y, boro, block, lot
from lot_face_pointtmp
where mod(ogr_fid, 2) = 0;
commit;
insert into lot_face_point 
(shape, tax_lot_face_type, bbl, length, approx_length_flag, angle, delta_x, delta_y, boro, block, lot)
SELECT
shape, tax_lot_face_type, bbl, length, approx_length_flag, angle, delta_x, delta_y, boro, block, lot
from lot_face_pointtmp
where mod(ogr_fid, 2) <> 0;
commit;
create index LOT_FACE_POINT_SPATIAL_IDX on lot_face_point (shape) INDEXTYPE IS MDSYS.SPATIAL_INDEX; 
delete from user_sdo_geom_metadata
where table_name IN ('TAX_LOT_POINTTMP','TAX_BLOCK_POINTTMP','LOT_FACE_POINTTMP');
drop table TAX_LOT_POINTTMP;
drop table TAX_BLOCK_POINTTMP;
drop table LOT_FACE_POINTTMP;
delete from user_sdo_geom_metadata
where table_name IN ('TAX_LOT_POINTTMP','TAX_BLOCK_POINTTMP','LOT_FACE_POINTTMP');