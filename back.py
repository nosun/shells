#!/usr/bin/python
# -*- coding: UTF-8 -*-
import time
import datetime
import subprocess
def DUMP(host, user, passwd,dir,database):
    now = datetime.datetime.now().strftime("%Y-%m-%d")
    command = 'mysqldump -u%s -p%s -h %s %s |gzip > /data/backup/database/%s/%s_%s.gz' %(user,passwd,host,database,dir,now,database)
    subprocess.call(command, shell=True)
    command2 = 'find /data/backup/database/%s/* -type f -mtime +3 -exec rm -f {} \;' %(dir)
    subprocess.call(command, shell=True)
def run():
    for line in open('host.list'):
        line = line.strip('\n')
        host,user,passwd,dir,database= line.split(':')
        DUMP(host, user, passwd, dir, database)


if __name__ == '__main__':
    run()
