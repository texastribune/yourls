#!/usr/bin/env python

import csv
import re
import MySQLdb
from dateutil.parser import parse

host = ""
user = ""
password = ""
db = "yourls"
port = 3306

conn = MySQLdb.Connection(host=host, user=user, passwd=password, port=port, db=db)

cursor = conn.cursor()

with open("export.csv", "rb") as csvfile:
    reader = csv.reader(csvfile)
    next(reader, None)  # ignore header
    for row in reader:
        m = re.match("http://trib.it/(.*)", row[0])
        if m:
            print(m.group(1))
            short = m.group(1)
            date = parse(row[2])
            date_to_insert = date.strftime("%Y-%m-%d %H:%M:%s")
            title = row[3]
            long_url = row[4]
            clicks = row[5]
            cursor.execute(
                """INSERT INTO yourls_url VALUES (%s, %s, %s, %s, %s, %s)""",
                (short, long_url, title, date, "", clicks),
            )
            conn.commit()
        m = re.match("http://trib.it/(.*)", row[1])
        if m:
            print(m.group(1))
            short = m.group(1)
            date = parse(row[2])
            date_to_insert = date.strftime("%Y-%m-%d %H:%M:%s")
            title = row[3]
            long_url = row[4]
            clicks = row[5]
            cursor.execute(
                """INSERT INTO yourls_url VALUES (%s, %s, %s, %s, %s, %s)""",
                (short, long_url, title, date, "", clicks),
            )
            conn.commit()
