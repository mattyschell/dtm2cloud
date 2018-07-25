# unlike postgres, afaik SDE schema and data must (for non-heroic levels of effort)
# be created from an existing ESRI-supported template
# this script will use the EZ setup postgres database (from postgres.sh)
# to download shps that will be the source schema and data for the test 
# SDE database. This also means we are on a windows OS here
# This setup ironically is the reverse of the ETL we are testing
# mingw cant access T and .sde files shouldnt be in git
# so caller must pass a path to a .sde file
# call from top level dtm2cloud like
# ./src/test/resources/sde.sh "c:\matt_projects\database_utils\arcgisconnections\dof_dtm@geocdev.sde"
sdeconn=$1
# remove shps in case of unexpected outcome 
rm resources/tax_block.*
# lovely shp creation from postgis
pgsql2shp -f "src/main/resources/tax_block" -h localhost -u postgres dtmtest "tax_block"
# not so lovely load SDE dataset 
python src/main/resources/schema-data-sde.py $sdeconn
# tidy up temp files
rm src/main/resources/tax_block.*
printf "exiting from sde.sh"
