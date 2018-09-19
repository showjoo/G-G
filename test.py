import datetime

import sqlite3

# a=datetime.datetime(2018, 4, 3, 4, 34, 41, 907292)
# b=datetime.datetime.now() 

# print (b-a).seconds/3600
now=datetime.datetime.now()


s=datetime.datetime.strptime('2018-10-21 01:20', "%Y-%m-%d %H:%M")
print type(s)
# num=6

# for num in range(6,50):
# 	conn = sqlite3.connect('db.sqlite3')
# 	print "Opened database successfully";
# 	c = conn.cursor()
# 	query='''

# 	insert into blog_parking values (?,?,?,?);

# 	'''
# 	c.execute(query,[None,num,0,now])
# 	conn.commit()
# 	conn.close()