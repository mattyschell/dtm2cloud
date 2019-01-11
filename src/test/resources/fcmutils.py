# mschell! 20161130
# 20190110 copied over from featureclassmaintenance like a fool

import arcpy


def timer(start, end):
    hours, rem = divmod(end-start, 3600)
    minutes, seconds = divmod(rem, 60)
    return "{:0>2}:{:0>2}:{:05.2f}".format(int(hours),int(minutes),seconds)


def execute_immediate(sde,
                      sql):

    try:

        sde_conn = arcpy.ArcSDESQLExecute(sde)

    except:

        print arcpy.GetMessages()
        raise

    try:

        sde_return = sde_conn.execute(sql)

    except:

        print "sql fail " + sql
        raise

    del sde_conn
    return sde_return


def selectavalue(sde,
                 sql):

    sdereturn = execute_immediate(sde,
                                  sql)

    if not isinstance(sdereturn, list) and sdereturn is None:
        raise ValueError('Returned NULL from {0}'.format(sql))
    if not isinstance(sdereturn, list):
        return sdereturn
    else:
        raise ValueError('Did not return single value on {0}'.format(sql))

def selectacolumn(sde,
                  sql):

    sdereturn = execute_immediate(sde,
                                  sql)

    output = []

    if isinstance(sdereturn, bool) and sdereturn:

        return output

    elif isinstance(sdereturn, basestring):

        # just one value
        # be consistent and return a
        output = [sdereturn]
        return output

    elif isinstance(sdereturn, (int, long, float, complex)):

        # just one value
        # be consistent and return a
        output = [sdereturn]
        return output

    elif isinstance(sdereturn, list):

        # list of lists, but we only have one column
        for val in sdereturn:
            output.append(val[0])

        return output

    elif sdereturn is None:

        # just returned null

        output = [None]

        return output

    else:

        raise ValueError('Unknown return type from ' + sql)


def compiledbcode(sde,
                  codeblock,
                  databasetype='oracle'):

    if databasetype != 'oracle':

        raise ValueError('Larry Ellison says: "Add other databases. You matter. You are supported. You are believed"')

    elif databasetype == 'oracle':

        sdereturn = execute_immediate(sde,
                                      codeblock)

        if not sdereturn:
            raise ValueError('compilation failed')

        return sdereturn


def compilesqlfile(sde,
                   pathtofile):

        # common practice in SQL*Plus world is to have a single file
        # with all the pl/sql procs, funcions, and pacakges separated by /s
        # then "execute as script" or throw into sqlplus.  This does not translate to ArcSDESQLExecute
        # we must think of each call to sde ArcSDESQLExecute like
        # BEGIN
        # EXECUTE IMMEDIATE 'CREATE OR REPLACE THISPKG ... END THISPKG;';
        # END;

        # parse individual compilation units
        sql = open(pathtofile, "r").read()

        compilationunits = sql.split("\n/")

        for unit in compilationunits:

            if len(unit) > 0:

                retval = compiledbcode(sde,
                                       unit)

                if not retval:
                    raise ValueError('compile fail')

        # should all be Trues
        return retval


def get_duplicates(sde,
                   table,
                   column):

    sql = 'SELECT ' + column + ' FROM ' + table + ' t ' \
        + 'GROUP BY t.' + column + ' ' \
        + 'HAVING COUNT(t.' + column + ') > 1 ' \
        + 'ORDER BY t.' + column + ' '

    return selectacolumn(sde,
                         sql)

