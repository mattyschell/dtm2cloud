import arcpy
import os
import sys
import time

# Reminder context: We are taking a snapshot of production and dropping it into dev
#    to use as a consistent, repeatable, testing source
# see __main__ for usage copy paste

# NA: Targets of the lgacy ETL in same schema
#    LOT_FACE_POINT
#    TAX_BLOCK_POINT
#    TAX_LOT_POINT

feature_dataset = "Cadastral"

feature_supports = ['Polygon_Face_Relationship',
                    'Possession_Hook_Topology',
                    'Tax_Lot_Topology']

feature_classes = ['Boundary',
                   'Lot_Face_Possession_Hooks',
                   'Misc_Text',
                   'Possession_Hooks',
                   'Tax_Block_Polygon',
                   'Tax_Lot_Centroid',
                   'Tax_Lot_Face',
                   'Tax_Lot_Polygon']

entwined_tables = ['Condo_Units',
                   'REUC_Lots',
                   'Condo',
                   'Conversion_Log',
                   'Subterranean_Lots',
                   'Air_Rights_Holders',
                   'Conversion_Exceptions',
                   'Air_Rights_Lots',
                   'Air_Rights_Condos']

other_relationships = ['Condo_Condo_Unit_Relationship',
                       'Condo_Air_Rights_Relationship',
                       'Air_Rights_Lots_Holders_Relationship']

data_tables = ['AIR_LABEL',
               'CONDO_LABEL',
               'SUB_LABEL']


def target_delete(target_sde,
                  target_object,
                  target_featuredataset = None):

    if target_featuredataset is None:
        target_fd = ""
    else:
        target_fd = target_featuredataset

    target_full = os.path.join(target_sde,
                               target_fd,
                               target_object)

    if arcpy.Exists(target_full):
        print "deleting {0}".format(target_full)
        arcpy.Delete_management(target_full)
    else:
        print "not deleting {0}, doesnt exist".format(target_full)


def prepare_target(tsde):

    # try the full Cadastral feature dataset first
    # let ESRI clean up his own mess
    # and then poop out some errors
    # probably errors related to topology dirty area internal tables

    try:
       target_delete(tsde,
                     feature_dataset)
    except:
        print "ESRI errored deleting {0}, gonna continue anyway".format(feature_dataset)

    # then anything that remains 
    # probably nothing here
    for fs in feature_supports:

        target_delete(tsde,
                      fs,
                      feature_dataset)

    # probably nothing here
    for fc in feature_classes:

        target_delete(tsde,
                      fc,
                      feature_dataset)

    # most likely deletes here
    for orel in other_relationships:

        target_delete(tsde,
                      orel)

    # very likely deletes here
    for et in entwined_tables:

        target_delete(tsde,
                      et)

    # delete yes, totally certain, I know what Im doing here 
    for dt in data_tables:

        target_delete(tsde,
                      dt)


def selectcountstar(adataset):

    # this is the way the world ends
    result = arcpy.GetCount_management(adataset)
    return int(result.getOutput(0))


def qa_target(fromsde,
              tosde):

    # compare counts between (most likely) prod and dev

    retval = 0
    kountables = feature_classes + entwined_tables + data_tables

    for kt in kountables:

        if selectcountstar(os.path.join(fromsde, kt)) != selectcountstar(os.path.join(tosde, kt)):

            retval = 1
            print "record count for {0} doesnt appear to be match".format(kt)
            print "source is {0}".format(selectcountstar(os.path.join(fromsde, kt)))
            print "sourtargetce is {0}".format(selectcountstar(os.path.join(tosde, kt)))
       
        else:
            
            print "record count for {0} looks good".format(kt)

    return retval


def snapshotfunc(source_sde,
                 target_sde):

    # all the deletes here
    prepare_target(target_sde)

    source_fd = os.path.join(source_sde,
                             feature_dataset)

    target_fd = os.path.join(target_sde,
                             feature_dataset)

    print "copying {0} to {1}".format(source_fd,
                                      target_fd)

    # all but the data tables are caught in this feature dataset web
    arcpy.Copy_management(source_fd, 
                          target_fd)

    for dt in data_tables:

        source_dt = os.path.join(source_sde,
                                 dt)

        target_dt = os.path.join(target_sde,
                                 dt)

        print "copying {0} to {1}".format(source_dt,
                                          target_dt)

        arcpy.Copy_management(source_dt, 
                              target_dt)

    print "registering as versioned {0}".format(feature_dataset)

    arcpy.RegisterAsVersioned_management(os.path.join(target_sde,
                                                      feature_dataset))

    allgrantableobjects = feature_classes + entwined_tables + data_tables

    for copiedobject in allgrantableobjects:

        print "granting privs on {0}".format(copiedobject)

        arcpy.ChangePrivileges_management(os.path.join(target_sde, copiedobject) , "DOITT_DTM_VIEWER", "GRANT","")
        arcpy.ChangePrivileges_management(os.path.join(target_sde, copiedobject) , "TAXMAP_VIEWER", "GRANT","")
        arcpy.ChangePrivileges_management(os.path.join(target_sde, copiedobject) , "DOF_READONLY", "GRANT","")
        arcpy.ChangePrivileges_management(os.path.join(target_sde, copiedobject) , "DOF_TAXMAP_EDITOR", "GRANT","GRANT")
        arcpy.ChangePrivileges_management(os.path.join(target_sde, copiedobject) , "DCP_MAP_EDITOR", "GRANT","GRANT")

    exitcode = qa_target(source_sde,
                         target_sde)

    return exitcode


if __name__ == "__main__":

    #sourcesde = "C:/matt_projects/database_utils/arcgisconnections/dof_taxmap@geocprd (dof_taxmap).sde"
    #targetsde = "C:/matt_projects/database_utils/arcgisconnections/dof_taxmap@geocdev (dof_taxmap).sde"
    # > snapshot.py 
    #      "C:/matt_projects/database_utils/arcgisconnections/dof_taxmap@geocprd (dof_taxmap).sde"
    #      "C:/matt_projects/database_utils/arcgisconnections/dof_taxmap@geocdev (dof_taxmap).sde"
    #      > logs/prod_dev_20181004.log 

    if len(sys.argv) != 3:
        msg = "{0} requests 2 inputs, the source and target sde files, instead received {1}".format(sys.argv[0],
                                                                                                    len(sys.argv))
        print msg                                                                        
        raise ValueError(msg)
    
    else:

        # The nutty motto of the Central Park Squirrel Census is "Ever True"
        print '"EVER TRUE" {0} begins at {1} on {2}'.format(sys.argv[0]
                                                           ,time.strftime("%H:%M:%S") 
                                                           ,time.strftime("%Y%m%d"))

        print "Snapshotting from {0} to {1}".format(sys.argv[1]
                                                   ,sys.argv[2])

    sourceconn = sys.argv[1]
    targetconn = sys.argv[2]

    qacode = snapshotfunc(sourceconn,
                          targetconn)

    print '"EVER TRUE", {0} has finished at {1} on {2}'.format(sys.argv[0]
                                                              ,time.strftime("%H:%M:%S") 
                                                              ,time.strftime("%Y%m%d"))

    print "exiting with code {0}".format(qacode)
    sys.exit(qacode)

    
