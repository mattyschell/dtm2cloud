## WIP Test Setup For This WIP Project

This directory contains resources for test setup.  Our goal is to create "edited" source data in SDE and "unedited" data in PostgreSQL and then turn the ETL loose to restore order.

### Hand-wavy outline: Create Known State Test Data in Postgis and Oracle SDE

1. Create PostgreSQL Scratch Source 

    Provisions a postgis database "dtm" on localhost with source (legacy SDE) schema and "edited" data.  These are scratch datasets.

2. Create PostgreSQL Target

   Creates the target DTM tables and some known state "unedited" test data.

3. Reverse-engineer SDE Source

   Uses the scratch postgis schema and "edited" data from step 1 to reverse-engineer a legacy Oracle SDE source.  

### Expectations:

1. A PostgreSQL database running on localhost with "postgres" superuser 
2. Python 2.7 with arcpy (ArcGIS 10.2+)
3. An sde connection file that points to an existing SDE geodatabase

#### 1. Create PostgreSQL Test DB and Scratch SDE Source Data

    Execute from the top-level project directory in MinGW 
                   
   ./src/test/resources/postgres-source.sh                                                                

   or if your postgres superuser requires a password

   ./src/test/resources/postgres-source.sh optionalpasswordhere

### 2. Create PostgreSQL Target Data            

    ./src/test/resources/postgres-target.sh  

    NA superuser password. We leverage the dtmwrite user created in step 1.   

#### 3. Reverse-engineer SDE Source

   ./src/test/resources/sde-source.sh "C:\path\to\test_sde_schema@geocdev.sde"

   ex

   ./src/test/resources/sde-source.sh "c:\matt_projects\database_utils\arcgisconnections\dof_dtm@geocdev.sde"
   