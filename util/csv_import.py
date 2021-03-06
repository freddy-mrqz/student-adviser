#!/usr/bin/env python

# Run with no args for usage instructions
#
# Notes:
#  - will probably insert duplicate records if you load the same file twice
#  - assumes that the number of fields in the header row is the same
#    as the number of columns in the rest of the file and in the database
#  - assumes the column order is the same in the file and in the database
#
# Speed: ~ 1s/MB
#

import sys
import MySQLdb
import csv

def main(user, db, table, csvfile):

    conn = getconn(user, db, passwd)
    cursor = conn.cursor()

    loadcsv(cursor, table, csvfile)

    cursor.close()
    conn.close()

def getconn(user="dev", db="courses", passwd="voyager"):
    conn = MySQLdb.connect(host = "localhost",
                           user = user,
                           passwd = "",
                           db = db)
    return conn

def nullify(L):
    """Convert empty strings in the given list to None."""

    # helper function
    def f(x):
        if(x == ""):
            return None
        else:
            return x

    return [f(x) for x in L]

def loadcsv(cursor, table, filename):

    """
    Open a csv file and load it into a sql table.
    Assumptions:
     - the first line in the file is a header
    """

    f = csv.reader(open(filename))

    header = f.next()
    numfields = len(header)

    query = buildInsertCmd(table, numfields)

    for line in f:
        vals = nullify(line)
        cursor.execute(query, vals)

    return

def buildInsertCmd(table, numfields):

    """
    Create a query string with the given table name and the right
    number of format placeholders.

    example:
    >>> buildInsertCmd("foo", 3)
    'insert into foo values (%s, %s, %s)'
    """
    assert(numfields > 0)
    placeholders = (numfields-1) * "%s, " + "%s"
    query = ("insert into %s" % table) + (" values (%s)" % placeholders)
    return query

if __name__ == '__main__':
    # commandline execution

    args = sys.argv[1:]
    if(len(args) < 4):
        print("error: arguments: user db table csvfile")
        sys.exit(1)

    main(*args)
