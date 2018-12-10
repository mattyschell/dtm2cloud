block=$1
boro=$2
justblock=$3
ECHO "----------------------------------------------------------" >> /d/matt_projects_data/dtm2cloud/test_data_postgres.sql
ECHO "-- block $block edited data" >> /d/matt_projects_data/dtm2cloud/test_data_postgres.sql
ECHO "-- Description: Duplicate BBL in source. ETL expected to do nothing" >> /d/matt_projects_data/dtm2cloud/test_data_postgres.sql
ECHO "----------------------------------------------------------" >> /d/matt_projects_data/dtm2cloud/test_data_postgres.sql
ECHO "-- block $block tax_block_polygon" >> /d/matt_projects_data/dtm2cloud/test_data_postgres.sql
grep "('$boro','$justblock'," /d/matt_projects_data/dtm2cloud/tax_block_polygon_scratch.sql >> /d/matt_projects_data/dtm2cloud/test_data_postgres.sql
ECHO "-- block $block tax_lot_polygon" >> /d/matt_projects_data/dtm2cloud/test_data_postgres.sql
grep "','$block" /d/matt_projects_data/dtm2cloud/tax_lot_polygon_scratch.sql >> /d/matt_projects_data/dtm2cloud/test_data_postgres.sql
ECHO "-- block $block tax_lot_face" >> /d/matt_projects_data/dtm2cloud/test_data_postgres.sql 
grep "'$boro','$justblock'" /d/matt_projects_data/dtm2cloud/tax_lot_face_scratch.sql >> /d/matt_projects_data/dtm2cloud/test_data_postgres.sql