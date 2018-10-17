
import unittest
import os
import subprocess

class TaxBlockTestCase(unittest.TestCase):

    @classmethod
    def setUpClass(self):

        # shared
        self.user = 'postgres'
        self.database = 'dtm'
        self.resourcepath = os.path.join(os.path.dirname(os.path.realpath(__file__)),
                                         'resources') 
        self.testsqlfile = os.path.join(self.resourcepath,
                                        'test.sql')
                                                        
    @classmethod
    def tearDownClass(self):
        pass
        # call to teardowndb-postgres.sql here


    def setUp(self):
        # call before each test
        # Will need something here to call test setup 
        #subprocess.Popen("/src/test/resources/postgres-source.sh")
        #subprocess.Popen("/src/test/resources/postgres-target.sh")
        #subprocess.Popen("./src/test/resources/sde-source.sh "C:\path\to\test_sde_schema@geocdev.sde"")
        pass

    def tearDown(self):
        #os.remove(self.testsqlfile)
        pass
    
    def test_area(self):

        # our test data includes block 302386
        # in which BBLs 3023860012 and 3023860014 merge into BBL 3023860007  
        # The merged area (sum of 3 inputs?) of 3023860007 should be 20577.3 
        # The thing to test is here
        #subprocess.Popen("fme.exe ./dtm_a_block_2_cloud.fmw 302386")
        
        # verify area using fme's SQL interface, psycopg2, or dumb simple psql scripts
        with open(self.testsqlfile,'w') as f:
            f.write("""select CASE WHEN a.lot_area = 20577.3 THEN 'thumbs up' ELSE 'thumbs down' end as sevenup from tax_lot_point a where a.bbl = '3023860007'""")

        psqlcmd = "psql -U {0} -d {1} -f {2}".format(self.user,
                                                     self.database,
                                                     self.testsqlfile)
                                                     
        subprocess.Popen(psqlcmd)

        # this stub prints thumbs up or thumbs down
        # but a better test would return the value to us and we'd do
        # self.assertEqual(returnedval, 20577.3)
        
if __name__ == '__main__':
    unittest.main()