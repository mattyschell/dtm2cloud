# This script will use the EZ setup scratch PostgreSQL database to
# download shps that will be the source schema and data for the test SDE database
# Requres we are on a windows OS for arcpy unfortunately
# This setup is the reverse of the ETL we are testing
# mingw cant access T and .sde files shouldnt be in git so caller must pass a path to a .sde file
# call from top level dtm2cloud like
# ./src/test/resources/sde-source.sh "c:\matt_projects\database_utils\arcgisconnections\dof_dtm@geocdev.sde"
sdeconn=$1
printf "sde-source.sh is downloading source data and uploading to sde"
# remove shps in case of unexpected outcome 
rm src/test/resources/tax_block_polygon.*
rm src/test/resources/tax_lot_polygon.*
rm src/test/resources/tax_lot_face.*
# lovely test data load and shp creation from postgis
pgsql2shp -f "src/test/resources/tax_block_polygon" -h localhost -u dtmread dtm "tax_block_polygon_scratch"
pgsql2shp -f "src/test/resources/tax_lot_polygon" -h localhost -u dtmread dtm "tax_lot_polygon_scratch"
pgsql2shp -f "src/test/resources/tax_lot_face" -h localhost -u dtmread dtm "tax_lot_face_scratch"
# not so lovely load SDE dataset 
python src/test/resources/sde-source.py $sdeconn
# tidy up temp files
rm src/test/resources/tax_block_polygon.*
rm src/test/resources/tax_lot_polygon.*
rm src/test/resources/tax_lot_face.*
printf "exiting from sde-source.sh"
