import sys
import os
print "starting {0} by importing arcpy".format(sys.argv[0])
import arcpy
# path to scratch sde connection
sdefile = os.path.normpath(sys.argv[1])
cwd = os.path.dirname(os.path.realpath(__file__))
# TAX BLOCK
arcpy.Delete_management(os.path.join(sdefile,"TAX_BLOCK"))
# caller should have placed a shape next to us in this directory
arcpy.FeatureClassToFeatureClass_conversion(os.path.join(cwd, "tax_block.shp"), 
                                            sdefile,
                                            "TAX_BLOCK")
# version. perhaps more in future
arcpy.RegisterAsVersioned_management(os.path.join(sdefile,"TAX_BLOCK"))
print "loaded and registered as versioned {0} in {1}".format("TAX_BLOCK",
                                                             sdefile)
# more SDE layers go here
print "goodbye from {0}".format(sys.argv[0]) 