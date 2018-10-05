-- get sdo to dev. "Ever true"
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
truncate table lot_face_point;
insert into lot_face_point 
(shape, tax_lot_face_type, bbl, length, approx_length_flag, angle, delta_x, delta_y, boro, block, lot)
SELECT
shape, tax_lot_face_type, bbl, length, approx_length_flag, angle, delta_x, delta_y, boro, block, lot
from lot_face_pointtmp;
commit;
delete from user_sdo_geom_metadata
where table_name IN ('TAX_LOT_POINTTMP','TAX_BLOCK_POINTTMP','LOT_FACE_POINTTMP');
drop table TAX_LOT_POINTTMP;
drop table TAX_BLOCK_POINTTMP;
drop table LOT_FACE_POINTTMP;
delete from user_sdo_geom_metadata
where table_name IN ('TAX_LOT_POINTTMP','TAX_BLOCK_POINTTMP','LOT_FACE_POINTTMP');