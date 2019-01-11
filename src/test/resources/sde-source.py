# arcpy.AlterField_management would be convenient but 10.2.1+ only
import sys
import os
print "starting {0} by importing arcpy".format(sys.argv[0])
import arcpy
import fcmutils


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

    def loadtarget(self,
                   keyword=None,
                   register='Y'):

        arcpy.Delete_management(self.sdetarget)

        # avoid objectid_1 column generation
        arcpy.DeleteField_management(self.shpsource,"OBJECTID")

        if keyword is None:

            arcpy.FeatureClassToFeatureClass_conversion(self.shpsource, 
                                                        self.sdepath,
                                                        self.name)
        
        else:

            arcpy.FeatureClassToFeatureClass_conversion(self.shpsource, 
                                                        self.sdepath,
                                                        self.name,
                                                        config_keyword=keyword)

        self.field_remapping()

        if register == 'Y':

            if self.featuredataset == "":
                arcpy.RegisterAsVersioned_management(self.sdetarget)
            else:
                # first fc into an annoying feature dataset bucket sets the versioning
                arcpy.RegisterAsVersioned_management(self.sdepath)

    def field_remapping(self):

        #subclasses return fields to redefine as necessary
        pass

    def _field_remapping(self,
                         cols):

        # called from subclasses with specific columns
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

        self._field_remapping(cols)
        

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

        # and nothing hurt
        cols = {}

        cols = {'eop_overla': {'colname': 'eop_overlap_flag', 'coltype' : 'TEXT'}}
        cols.update({'jagged_st_': {'colname': 'jagged_st_flag', 'coltype' : 'TEXT'}})        
        cols.update({'created_da': {'colname': 'created_date', 'coltype' : 'DATE'}})
        cols.update({'last_modif': {'colname': 'last_modified_by', 'coltype' : 'TEXT'}})
        cols.update({'last_mo_01': {'colname': 'last_modified_date', 'coltype' : 'DATE'}})
        cols.update({'section_nu': {'colname': 'section_number', 'coltype' : 'DOUBLE'}})
        cols.update({'volume_num': {'colname': 'volume_number', 'coltype' : 'DOUBLE'}})

        self._field_remapping(cols)


class TaxLotFace(SdeTestFc):

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

        # must language always be a donkey?
        # why not a braying gemstone,
        # a topaz ocean
        # whose lettered waves approach
        # obediently then shatter
        # on the shore
        oceanofshpcolumns = {}

        oceanofshpcolumns = {'tax_lot_fa': {'colname': 'tax_lot_face_type', 'coltype' : 'DOUBLE'}}
        oceanofshpcolumns.update({'lot_face_l': {'colname': 'lot_face_length', 'coltype' : 'DOUBLE'}})       
        oceanofshpcolumns.update({'lot_fac_01': {'colname': 'lot_face_length_error', 'coltype' : 'DOUBLE'}})
        oceanofshpcolumns.update({'created_da': {'colname': 'created_date', 'coltype' : 'DATE'}})
        oceanofshpcolumns.update({'last_modif': {'colname': 'last_modified_by', 'coltype' : 'TEXT'}})
        oceanofshpcolumns.update({'last_mo_01': {'colname': 'last_modified_date', 'coltype' : 'DATE'}})
        oceanofshpcolumns.update({'approx_len': {'colname': 'approx_length_flag', 'coltype' : 'DOUBLE'}})

        self._field_remapping(oceanofshpcolumns)

class VBoroBlockChanges(SdeTestFc):

    def __init__(self,
                 featureclassname,
                 sdetarget,
                 shpsource):
        
        SdeTestFc.__init__(self,
                           featureclassname,
                           sdetarget,
                           shpsource,
                           None)

    def field_remapping(self):

        oceanofshpcolumns = {}

        oceanofshpcolumns = {'change_dat': {'colname': 'change_date', 'coltype' : 'DATE'}}

        self._field_remapping(oceanofshpcolumns)

if __name__ == "__main__":

    if len(sys.argv) != 2:
        msg = "I {0} request but 1 input, the sde file, instead I have been given {1} inputs".format(sys.argv[0]
                                                                                                    ,(len(sys.argv) - 1))
        print msg                                                                        
        raise ValueError(msg)

    psrcsde = sys.argv[1]

    # path to scratch sde connection
    sdefile = os.path.normpath(sys.argv[1])
    cwd = os.path.dirname(os.path.realpath(__file__))


    print "attempting to delete " + str(os.path.join(sdefile,'Cadastral'))
    arcpy.Delete_management(os.path.join(sdefile
                                        ,'Cadastral'))

    print "attempting to delete " + str(os.path.join(sdefile,'V_BORO_BLOCK_CHANGES'))
    arcpy.Delete_management(os.path.join(sdefile
                                        ,'V_BORO_BLOCK_CHANGES'))

    print "Creating Cadastral feature dataset in {0}".format(sdefile)
    arcpy.CreateFeatureDataset_management(sdefile
                                         ,"Cadastral" 
                                         ,os.path.join(cwd, "tax_block_polygon.prj"))

    # TAX_BLOCK_POLYGON
    tax_block_polygon = TaxBlockPolygon('Tax_Block_Polygon'
                                       ,sdefile
                                       ,os.path.join(cwd, "tax_block_polygon.shp")
                                       ,'Cadastral')

    tax_block_polygon.loadtarget()

    print "loaded and registered as versioned {0} in {1}".format("Tax_Block_Polygon"
                                                                ,sdefile)

    # TAX_LOT_POLYGON
    tax_lot_polygon = TaxLotPolygon('Tax_Lot_Polygon'
                                   ,sdefile
                                   ,os.path.join(cwd, "tax_lot_polygon.shp")
                                   ,'Cadastral')

    tax_lot_polygon.loadtarget()

    print "loaded and registered as versioned {0} in {1}".format("Tax_Lot_Polygon"
                                                                ,sdefile)

    # TAX_LOT_FACE
    tax_lot_face = TaxLotFace('Tax_Lot_Face'
                             ,sdefile
                             ,os.path.join(cwd, "tax_lot_face.shp")
                             ,'Cadastral')

    tax_lot_face.loadtarget()

    # V_BORO_BLOCK_CHANGES
    # not actually an ESRI fc in real DTM. It's a view
    # this is a shortcut to help testing
    v_boro_block_changes = VBoroBlockChanges('V_BORO_BLOCK_CHANGES'
                                            ,sdefile
                                            ,os.path.join(cwd, "v_boro_block_changes.shp"))

    v_boro_block_changes.loadtarget('SDO_GEOMETRY',
                                    'N')

    print "loaded {0} in {1}".format("V_BORO_BLOCK_CHANGES"
                                     ,sdefile)

    # Labeling tables, not registered, not from shapefiles. w00t
    sqlfile = os.path.join(cwd, "schema-oracle.sql")

    # compile (oops) is best for anonymous pl/sql block
    sdereturn = fcmutils.compilesqlfile(sdefile
                                       ,sqlfile)

    if sdereturn:
        print "created {0} in {1}".format("CONDO_UNITS,AIR_LABEL,CONDO_LABEL,SUB_LABEL"
                                          ,sdefile)
    else:
        print "error creating {0} in {1}".format("CONDO_UNITS,AIR_LABEL,CONDO_LABEL,SUB_LABEL"
                                                 ,sdefile)