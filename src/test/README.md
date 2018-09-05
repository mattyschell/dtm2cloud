## WIP Test Setup For This WIP Project

This directory contains resources for test setup.  Tend to your tests like a garden.

### Hand-wavy outline: Create Known State Test Data in Postgis and Oracle SDE

1. PostgreSQL Scratch Source 

    Creates a postgis database "dtmtest" on localhost with source (legacy SDE) schema and "edited" data.  This is a scratch dataset.

2. PostgreSQL Target

   Creates the target DTM schema and known state "unedited" test data.

3. SDE Source

   Uses the scratch postgis schema and "edited" data from step 1 to reverse-engineer the legacy Oracle SDE source.  

### Expectations:

1. A PostgreSQL database running on localhost with "postgres" superuser 
2. Python 2.7 with arcpy (ArcGIS 10.2+)
3. An sde connection file that points to an existing SDE geodatabase

#### 1. PostgreSQL Scratch Source  

    Execute from the top-level project directory in MinGW 
                   
   ./src/test/resources/postgres-source.sh                                                                

   or if your postgres superuser requires a password

   ./src/test/resources/postgres-source.sh optionalpasswordhere

### 2. PostgreSQL Target             

    ./src/test/resources/postgres-target.sh  

   or if your postgres superuser requires a password

   ./src/test/resources/postgres-target.sh optionalpasswordhere

#### 3. SDE Source

   ./src/test/resources/sde-source.sh "C:\path\to\test_sde_schema@geocdev.sde"

   ex

   ./src/test/resources/sde-source.sh "c:\matt_projects\database_utils\arcgisconnections\dof_dtm@geocdev.sde"





