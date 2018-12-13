## WIP Test Setup For This WIP Project

This directory contains resources for test setup.  Our goal is to create known, 
repeatable, "edited" source data in SDE and "unedited" data in PostreSQL and 
then turn the ETL loose to restore order.  

### Expectations:

1. A PostgreSQL instance with PostGIS on localhost with postgres superuser 
2. Python 2.7 with arcpy (ArcGIS 10.2+)
3. An sde connection file that points to an existing SDE geodatabase

#### 1. Create PostgreSQL Test DB and Scratch SDE Source Data

Create a PostGIS database "dtm" on localhost with users dtmwrite and dtmread. 
Also create source (legacy SDE) schema and "edited" data.  These are scratch 
datasets and the user credentials are hard coded in the script because this
is for testing only.

Execute from the top-level project directory in MinGW 
                   
```
$ ./src/test/resources/postgres-source.sh
```                                                                

Any postgres superuser password and local config that isn't standard should 
be externalized. For ex

```
$ export PGPORT=5433
$ export PGPASSWORD=BeMyDataBae!
$ ./src/test/resources/postgres-source.sh
```

#### 2. Create PostgreSQL Target Data            

Create the target DTM tables and "unedited" test data.  Use the dtm database 
and dtmwrite user we created in step 1.

```
./src/test/resources/postgres-target.sh
```

#### 3. Reverse-engineer SDE Source

Use the scratch PostGIS "edited" data from step 1 to reverse-engineer a legacy 
Oracle SDE source.  

```
./src/test/resources/sde-source.sh "C:\path\to\test_sde_schema@geocdev.sde"
```

   ex

```
./src/test/resources/sde-source.sh "C:\arcgisconnections\dof_dtm@geocdev.sde"
```
   