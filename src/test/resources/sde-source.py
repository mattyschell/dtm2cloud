# arcpy.AlterField_management would be convenient but 10.2.1+ only
# instead rely on grouchy field mappings in arcpy.FeatureClassToFeatureClass_conversion
import sys
import os
print "starting {0} by importing arcpy".format(sys.argv[0])
import arcpy

def field_matting(featureclass,
                  stupidshortfield,
                  realfield,
                  stupidesritype):

    arcpy.AddField_management(featureclass,
                              realfield,
                              stupidesritype)
    arcpy.CalculateField_management(featureclass,
                                    realfield,
                                    "!{0}!".format(stupidshortfield),
                                    "PYTHON")
    arcpy.DeleteField_management(featureclass, 
                                 stupidshortfield)

# path to scratch sde connection
sdefile = os.path.normpath(sys.argv[1])
cwd = os.path.dirname(os.path.realpath(__file__))
# TAX_BLOCK_POINT
arcpy.Delete_management(os.path.join(sdefile,"TAX_BLOCK_POINT"))
# caller should have placed a shape next to us in this directory
arcpy.FeatureClassToFeatureClass_conversion(os.path.join(cwd, "tax_block_point.shp"), 
                                            sdefile,
                                            "TAX_BLOCK_POINT")
arcpy.RegisterAsVersioned_management(os.path.join(sdefile,"TAX_BLOCK_POINT"))
print "loaded and registered as versioned {0} in {1}".format("TAX_BLOCK_POINT",
                                                             sdefile)
# TAX_LOT_POINT
arcpy.Delete_management(os.path.join(sdefile,"TAX_LOT_POINT"))
arcpy.FeatureClassToFeatureClass_conversion(os.path.join(cwd, "tax_lot_point.shp"), 
                                            sdefile,
                                            "TAX_LOT_POINT")
field_matting(os.path.join(sdefile,"TAX_LOT_POINT"),
              'AIR_RIGHTS',
              'AIR_RIGHTS_FLAG',
              'TEXT')
field_matting(os.path.join(sdefile,"TAX_LOT_POINT"),
              'SUBTERRANE',
              'SUBTERRANEAN_FLAG',
              'TEXT')
arcpy.RegisterAsVersioned_management(os.path.join(sdefile,"TAX_LOT_POINT"))
print "loaded and registered as versioned {0} in {1}".format("TAX_LOT_POINT",
                                                             sdefile)
print "goodbye from {0}".format(sys.argv[0]) 