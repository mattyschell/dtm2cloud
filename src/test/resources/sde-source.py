# arcpy.AlterField_management would be convenient but 10.2.1+ only
import sys
import os
print "starting {0} by importing arcpy".format(sys.argv[0])
import arcpy


class SdeTestFc(object):

    def __init__(self,
                 featureclassname,
                 sdetarget,
                 shpsource,
                 featuredataset = None):

        # cartesian join of all possible SDE paths, samples to remind matt.self
        # Tax_Block_Polygon
        self.name = featureclassname
        # C:\mystuff\myschema.sde
        self.sdeconn = os.path.normpath(sdetarget)
        # Cadastral
        if featuredataset is None:
            self.featuredataset = ""
        else:
            self.featuredataset = featuredataset
        # C:\dtm2cloud\src\test\resources\tax_block_polygon.shp
        self.shpsource = os.path.normpath(shpsource)
        # C:\mystuff\myschema.sde\Cadastral or repeat of sdeconn
        # C:\mystuff\myschema.sde
        self.sdepath = os.path.join(self.sdeconn,
                                    self.featuredataset)
        # C:\mystuff\myschema.sde\Cadastral\Tax_Block_Polygon
        self.sdetarget = os.path.join(self.sdepath,
                                      featureclassname)

    def loadtarget(self):

        arcpy.Delete_management(self.sdetarget)

        # avoid objectid_1 column generation
        arcpy.DeleteField_management(self.shpsource,"OBJECTID")

        arcpy.FeatureClassToFeatureClass_conversion(self.shpsource, 
                                                    self.sdepath,
                                                    self.name)

        self.field_remapping()

        if self.featuredataset == "":
            arcpy.RegisterAsVersioned_management(self.sdetarget)
        else:
            # first fc into an annoying feature dataset bucket sets the versioning
            arcpy.RegisterAsVersioned_management(self.sdepath)

    def field_remapping(self):
        pass

class TaxLotPolygon(SdeTestFc):

    def __init__(self,
                 featureclassname,
                 sdetarget,
                 shpsource,
                 featuredataset):
        
        SdeTestFc.__init__(self,
                           featureclassname,
                           sdetarget,
                           shpsource,
                           featuredataset)

    def field_remapping(self):

        # everything was beautiful 
        cols = {}

        cols = {'community_': {'colname': 'community_district', 'coltype' : 'SHORT'}}
        cols.update({'regular_lo': {'colname': 'regular_lot_indicator', 'coltype' : 'TEXT'}})        
        cols.update({'number_lot': {'colname': 'number_lot_sides', 'coltype' : 'SHORT'}})
        cols.update({'air_rights': {'colname': 'air_rights_flag', 'coltype' : 'TEXT'}})
        cols.update({'subterrane': {'colname': 'subterranean_flag', 'coltype' : 'TEXT'}})
        cols.update({'easement_f': {'colname': 'easement_flag', 'coltype' : 'TEXT'}})
        cols.update({'section_nu': {'colname': 'section_number', 'coltype' : 'SHORT'}})
        cols.update({'volume_num': {'colname': 'volume_number', 'coltype' : 'SHORT'}})
        cols.update({'page_numbe': {'colname': 'page_number', 'coltype' : 'TEXT'}})
        cols.update({'nycmap_bld': {'colname': 'nycmap_bldg_flag', 'coltype' : 'SHORT'}})
        cols.update({'missing_rp': {'colname': 'missing_rpad_flag', 'coltype' : 'SHORT'}})
        cols.update({'conversion': {'colname': 'conversion_exception_flag', 'coltype' : 'SHORT'}})
        cols.update({'value_refl': {'colname': 'value_reflected_out_flag', 'coltype' : 'SHORT'}})
        cols.update({'created_da': {'colname': 'created_date', 'coltype' : 'DATE'}})
        cols.update({'last_modif': {'colname': 'last_modified_by', 'coltype' : 'TEXT'}})
        cols.update({'last_mo_01': {'colname': 'last_modified_date', 'coltype' : 'DATE'}})
        cols.update({'effective_': {'colname': 'effective_tax_year', 'coltype' : 'TEXT'}})
        cols.update({'bill_bbl_f': {'colname': 'bill_bbl_flag', 'coltype' : 'SHORT'}})

        # and nothing hurt
        for key,val in cols.iteritems():

            arcpy.AddField_management(self.sdetarget,
                                      val['colname'],
                                      val['coltype'])

            arcpy.CalculateField_management(self.sdetarget,
                                            val['colname'],
                                            "!{0}!".format(key),
                                            "PYTHON")

            arcpy.DeleteField_management(self.sdetarget, 
                                         key)

class TaxBlockPolygon(SdeTestFc):

    def __init__(self,
                 featureclassname,
                 sdetarget,
                 shpsource,
                 featuredataset):
        
        SdeTestFc.__init__(self,
                           featureclassname,
                           sdetarget,
                           shpsource,
                           featuredataset)

    def field_remapping(self):

        # todo. so it goes
        pass


if __name__ == "__main__":

    if len(sys.argv) != 2:
        msg = "{0} requests 1 input, the sde file, instead received {1}".format(sys.argv[0],
                                                                                len(sys.argv))
        print msg                                                                        
        raise ValueError(msg)

    psrcsde = sys.argv[1]

    # path to scratch sde connection
    sdefile = os.path.normpath(sys.argv[1])
    cwd = os.path.dirname(os.path.realpath(__file__))

    print "attempting to delete " + str(os.path.join(sdefile,'Cadastral'))
    arcpy.Delete_management(os.path.join(sdefile,
                                         'Cadastral'))

    print "Creating Cadastral feature dataset in {0}".format(sdefile)
    arcpy.CreateFeatureDataset_management(sdefile, 
                                          "Cadastral", 
                                          os.path.join(cwd, "tax_block_polygon.prj"))

    # TAX_BLOCK_POLYGON
    tax_block_polygon = TaxBlockPolygon('Tax_Block_Polygon',
                                        sdefile,
                                        os.path.join(cwd, "tax_block_polygon.shp"),
                                        'Cadastral')

    tax_block_polygon.loadtarget()

    print "loaded and registered as versioned {0} in {1}".format("Tax_Block_Polygon",
                                                                 sdefile)

    # TAX_LOT_POLYGON
    tax_lot_polygon = TaxLotPolygon('Tax_Lot_Polygon',
                                    sdefile,
                                    os.path.join(cwd, "tax_lot_polygon.shp"),
                                    'Cadastral')

    tax_lot_polygon.loadtarget()

    print "loaded and registered as versioned {0} in {1}".format("Tax_Lot_Polygon",
                                                                 sdefile)