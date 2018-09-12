import arcpy
import os
import sys

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

def target_delete(target_sde,
                  target_object,
                  target_featuredataset = None):

    if target_featuredataset is None:
        target_fd = ""

    target_full = os.path.join(target_sde,
                               target_fd,
                               target_object)

    if arcpy.Exists(target_full):
        print "deleting {0}".format(target_full)
        arcpy.Delete_management(target_full)
    else:
        print "not deleting {0}, doesnt exist".format(target_full)




if __name__ == "__main__":

    if len(sys.argv) != 3:
        msg = "{0} requests 2 inputs, the source and target sde files, instead received {1}".format(sys.argv[0],
                                                                                                    len(sys.argv))
        print msg                                                                        
        raise ValueError(msg)

    #sourcesde = "C:/matt_projects/database_utils/arcgisconnections/dof_taxmap@geocprd (dof_taxmap).sde"
    #targetsde = "C:/matt_projects/database_utils/arcgisconnections/dof_taxmap@geocdev (dof_taxmap).sde"

    source_sde = sys.argv[1]
    target_sde = sys.argv[2]

    for fs in feature_supports:

        target_delete(target_sde,
                      feature_dataset,
                      fs)

    for fc in feature_classes:

        target_delete(target_sde,
                      feature_dataset,
                      fc)

    for orel in other_relationships:

        target_delete(target_sde,
                      orel)

    for et in entwined_tables:

        target_delete(target_sde,
                      et)

    target_delete(target_sde,
                  feature_dataset)

    source_fd = os.path.join(source_sde,
                            feature_dataset)

    target_fd = os.path.join(target_sde,
                            feature_dataset)

    print "copying {0} to {1}".format(source_fd,
                                    target_fd)
    arcpy.Copy_management(source_fd, 
                        target_fd)

    arcpy.RegisterAsVersioned_management(os.path.join(target_sde,
                                                      feature_dataset))

    allgrantableobjects = feature_classes + entwined_tables 

    for copiedobject in allgrantableobjects:
        arcpy.ChangePrivileges_management(os.path.join(target_sde, copiedobject) , "DOITT_DTM_VIEWER", "GRANT","")
        arcpy.ChangePrivileges_management(os.path.join(target_sde, copiedobject) , "TAXMAP_VIEWER", "GRANT","")
        arcpy.ChangePrivileges_management(os.path.join(target_sde, copiedobject) , "DOF_READONLY", "GRANT","")
        arcpy.ChangePrivileges_management(os.path.join(target_sde, copiedobject) , "DOF_TAXMAP_EDITOR", "GRANT","GRANT")
        arcpy.ChangePrivileges_management(os.path.join(target_sde, copiedobject) , "DCP_MAP_EDITOR", "GRANT","GRANT")
    