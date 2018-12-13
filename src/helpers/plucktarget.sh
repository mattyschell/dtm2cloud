block=$1
boro=$2
justblock=$3
ECHO "----------------------------------------------------------" >> /d/matt_projects_data/dtm2cloud/main_data_postgres.sql
ECHO "-- Block $block edited data" >> /d/matt_projects_data/dtm2cloud/main_data_postgres.sql
ECHO "-- Description: Source: Separate records with duplicated BBL  " >> /d/matt_projects_data/dtm2cloud/main_data_postgres.sql
ECHO "--              Target: Single bbl multipoly tax_lot_polygon, duplicate bbl tax_lot_point" >> /d/matt_projects_data/dtm2cloud/main_data_postgres.sql
ECHO "--              ETL expected to do nothing" >> /d/matt_projects_data/dtm2cloud/main_data_postgres.sql
ECHO "----------------------------------------------------------" >> /d/matt_projects_data/dtm2cloud/main_data_postgres.sql
ECHO "-- block $block tax_block_polygon" >> /d/matt_projects_data/dtm2cloud/main_data_postgres.sql
grep "('$boro','$justblock'," /d/matt_projects_data/dtm2cloud/tax_block_polygon.sql >> /d/matt_projects_data/dtm2cloud/main_data_postgres.sql
ECHO "-- block $block tax_block_point" >> /d/matt_projects_data/dtm2cloud/main_data_postgres.sql
grep "('$boro','$justblock'," /d/matt_projects_data/dtm2cloud/tax_block_point.sql >> /d/matt_projects_data/dtm2cloud/main_data_postgres.sql
ECHO "-- block $block tax_lot_polygon" >> /d/matt_projects_data/dtm2cloud/main_data_postgres.sql
grep "','$block" /d/matt_projects_data/dtm2cloud/tax_lot_polygon.sql >> /d/matt_projects_data/dtm2cloud/main_data_postgres.sql
ECHO "-- block $block tax_lot_point" >> /d/matt_projects_data/dtm2cloud/main_data_postgres.sql
grep "('$block" /d/matt_projects_data/dtm2cloud/tax_lot_point.sql >> /d/matt_projects_data/dtm2cloud/main_data_postgres.sql
ECHO "-- block $block tax_lot_face" >> /d/matt_projects_data/dtm2cloud/main_data_postgres.sql
grep ",'$block" /d/matt_projects_data/dtm2cloud/tax_lot_face.sql >> /d/matt_projects_data/dtm2cloud/main_data_postgres.sql
ECHO "-- block $block lot_face_point" >> /d/matt_projects_data/dtm2cloud/main_data_postgres.sql
grep ",'$block" /d/matt_projects_data/dtm2cloud/lot_face_point.sql >> /d/matt_projects_data/dtm2cloud/main_data_postgres.sql