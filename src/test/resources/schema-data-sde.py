import arcpy
import sys
import os
# boo
sdefile = "dof_dtm@geocdev.sde"
cwd = os.path.dirname(os.path.realpath(__file__))
arcpy.Delete_management(os.path.join(cwd, sdefile, 
                        "TAX_BLOCK"))
arcpy.FeatureClassToFeatureClass_conversion(os.path.join(cwd, "tax_block.shp"), 
                                            os.path.join(cwd, sdefile),
                                            "TAX_BLOCK")
arcpy.RegisterAsVersioned_management(os.path.join(cwd, sdefile,"TAX_BLOCK"))
print "loaded and registered as versioned {0} in {1}".format("TAX_BLOCK",
                                                             sdefile)
print "done with {0}".format(sys.argv[0]) 