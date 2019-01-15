block=$1
boro=$2
justblock=$3
ECHO "----------------------------------------------------------" > /d/matt_projects_data/dtm2cloud/geocstg/main_data_postgres.sql
ECHO "-- Block $block unedited data" >> /d/matt_projects_data/dtm2cloud/geocstg/main_data_postgres.sql
ECHO "-- Description: XXXXXXXXXXX  " >> /d/matt_projects_data/dtm2cloud/geocstg/main_data_postgres.sql
ECHO "----------------------------------------------------------" >> /d/matt_projects_data/dtm2cloud/geocstg/main_data_postgres.sql
ECHO "-- block $block tax_block_polygon" >> /d/matt_projects_data/dtm2cloud/geocstg/main_data_postgres.sql
grep "('$boro','$justblock'," /d/matt_projects_data/dtm2cloud/geocstg/tax_block_polygon.sql >> /d/matt_projects_data/dtm2cloud/geocstg/main_data_postgres.sql
ECHO "-- block $block tax_block_point" >> /d/matt_projects_data/dtm2cloud/geocstg/main_data_postgres.sql
grep "('$boro','$justblock'," /d/matt_projects_data/dtm2cloud/geocstg/tax_block_point.sql >> /d/matt_projects_data/dtm2cloud/geocstg/main_data_postgres.sql
ECHO "-- block $block tax_lot_polygon" >> /d/matt_projects_data/dtm2cloud/geocstg/main_data_postgres.sql
grep "','$block" /d/matt_projects_data/dtm2cloud/geocstg/tax_lot_polygon.sql >> /d/matt_projects_data/dtm2cloud/geocstg/main_data_postgres.sql
ECHO "-- block $block tax_lot_point" >> /d/matt_projects_data/dtm2cloud/geocstg/main_data_postgres.sql
grep "('$block" /d/matt_projects_data/dtm2cloud/geocstg/tax_lot_point.sql >> /d/matt_projects_data/dtm2cloud/geocstg/main_data_postgres.sql
ECHO "-- block $block tax_lot_face" >> /d/matt_projects_data/dtm2cloud/geocstg/main_data_postgres.sql
grep ",'$block" /d/matt_projects_data/dtm2cloud/geocstg/tax_lot_face.sql >> /d/matt_projects_data/dtm2cloud/geocstg/main_data_postgres.sql
ECHO "-- block $block lot_face_point" >> /d/matt_projects_data/dtm2cloud/geocstg/main_data_postgres.sql
grep ",'$block" /d/matt_projects_data/dtm2cloud/geocstg/lot_face_point.sql >> /d/matt_projects_data/dtm2cloud/geocstg/main_data_postgres.sql