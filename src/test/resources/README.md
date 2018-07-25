## WIP Test Setup For This WIP Project

This directory contains resources for test setup.  Tend to your test setup like a garden.

### Create Identical Test Data in Postgis and Oracle SDE

Execute from the top-level project directory in MinGW 

   ./src/test/resources/postgres.sh   

   ./src/test/resources/sde.sh "C:\path\to\test_sde_schema@geocdev.sde"
   ex
   ./src/test/resources/sde.sh "c:\matt_projects\database_utils\arcgisconnections\dof_dtm@geocdev.sde"

1. Creates a postgis database "dtmtest" on localhost with currently defined DTM schema and known state testing data.
2. Uses the postgis schema and data to create and populate equivalent data in SDE 

Expectations:

1. A postgres database running on localhost with "postgres" superuser and no password
2. Python 2.7 with arcpy 
3. Access to an sde connection file that points to an existing geodatabase

Some of the above are choices and can be changed.  Some we are kinda stuck with.




