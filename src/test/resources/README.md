## WIP Test Setup For This WIP Project

This directory contains resources for test setup.  Tend to your test setup like a garden.

### Create Identical Test Data in Postgis and Oracle SDE

Execute from the top-level project directory in MinGW 

1. Creates a postgis database "dtmtest" on localhost with currently defined DTM schema and known state testing data.
2. Uses the postgis schema and data to create and populate equivalent data in SDE 

#### Postgres Setup 

   ./src/test/resources/postgres.sh  

   or if your postgres superuser requires a password

   ./src/test/resources/postgres.sh optionalpasswordhere
    
#### SDE Setup

   ./src/test/resources/sde.sh "C:\path\to\test_sde_schema@geocdev.sde"

   ex

   ./src/test/resources/sde.sh "c:\matt_projects\database_utils\arcgisconnections\dof_dtm@geocdev.sde"

### Expectations:

1. A postgres database running on localhost with "postgres" superuser 
2. Python 2.7 with arcpy 
3. Access to an sde connection file that points to an existing geodatabase

Some of the above are choices and can be changed.  Some we are kinda stuck with.




