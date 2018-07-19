# unlike postgres, afaik SDE schema and data must (for non-heroic levels of effort)
# be created from an existing ESRI-supported template
# this script will use the EZ setup postgres database to download 
# shps that will be the source schema and data for the test SDE database
# which ironically is the reverse of the ETL we are testing
rm resources/tax_block.*
pgsql2shp -f "resources/tax_block" -h localhost -u postgres dtmtest "tax_block"
# load SDE dataset 
python resources/schema-data-sde.py
# tidy up temp files
rm resources/tax_block.*
