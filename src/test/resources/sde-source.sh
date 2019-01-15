# This script will use the EZ setup scratch PostgreSQL database to
# download shps that will be the source schema and data for the test SDE database
# Requres we are on a windows OS for arcpy unfortunately
# This setup is the reverse of the ETL we are testing
# mingw cant access T and .sde files shouldnt be in git so caller must pass a 
#   path to a .sde file
# call from top level dtm2cloud like
# ./src/test/resources/sde-source.sh "c:\matt_projects\database_utils\arcgisconnections\dof_dtm@geocdev.sde"
sdeconn=$1
printf "sde-source.sh is downloading source data and uploading to sde\n"
# remove shps in case of unexpected outcome 
# too confusing, get rid of this for now
# rm src/test/resources/tax_block_polygon.*
# rm src/test/resources/tax_lot_polygon.*
# rm src/test/resources/tax_lot_face.*
# rm src/test/resources/v_boro_block_changes.*
# lovely test data load and shp creation from postgis
OGPGPASSWORD=$PGPASSWORD
export PGPASSWORD=PostgisIsMyDataBae!
printf "starting download of tax_block_polygon_scratch to tax_block_polygon.shp\n"
pgsql2shp -f "src/test/resources/tax_block_polygon" -h localhost -u dtmwrite dtm "tax_block_polygon_scratch"
printf "finished download to tax_block_polygon.shp\n"
printf "starting download of tax_lot_polygon_scratch to tax_lot_polygon.shp\n"
pgsql2shp -f "src/test/resources/tax_lot_polygon" -h localhost -u dtmwrite dtm "tax_lot_polygon_scratch"
printf "finished download to tax_block_polygon.shp\n"
printf "starting download of tax_lot_face_scratch to tax_lot_face.shp\n"
pgsql2shp -f "src/test/resources/tax_lot_face" -h localhost -u dtmwrite dtm "tax_lot_face_scratch"
printf "finished download to tax_lot_face.shp\n"
printf "starting download of v_boro_block_changes_scratch to v_boro_block_changes.shp\n"
pgsql2shp -f "src/test/resources/v_boro_block_changes" -h localhost -u dtmwrite dtm "v_boro_block_changes_scratch"
printf "finished download to v_boro_block_changes.shp\n"
# reset users pwd if exists
export PGPASSWORD=$OGPGPASSWORD
# not so lovely load SDE dataset 
# includes some that aren't SDE-registered
printf "calling sde-source.py\n"
python src/test/resources/sde-source.py $sdeconn
printf "finished call to sde-source python script\n"
# tidy up temp shapefiles
rm src/test/resources/tax_block_polygon.*
rm src/test/resources/tax_lot_polygon.*
rm src/test/resources/tax_lot_face.*
rm src/test/resources/v_boro_block_changes.*
printf "exiting from sde-source.sh"
