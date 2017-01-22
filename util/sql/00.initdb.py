#!/usr/bin/python

import os
SCRIPT_HOME=os.path.abspath(os.path.dirname(__file__))

#region import utility
import sys, os
UTIL_HOME='%s/..' % os.path.abspath(os.path.dirname(__file__))
APP_HOME='%s/..' % os.path.abspath(UTIL_HOME)
sys.path.insert(0, APP_HOME)
from util.common.run_bash import run_bash
#endregion import utility

#region params
DB_NAME = 'yud_order_mining'
MYSQL_DEBUG = False
connectionConfig = '{SCRIPT_HOME}/mysql-connection.LOCAL'.format(SCRIPT_HOME=SCRIPT_HOME)
scriptFile='{SCRIPT_HOME}/migration/00.create-schema.sql'.format(SCRIPT_HOME=SCRIPT_HOME)
#endregion params

#region prepare mysql command
mysqlCmd='mysql --defaults-extra-file={connectionConfig} {verbose}'.format(
  connectionConfig=connectionConfig,
  verbose='-v' if MYSQL_DEBUG else ''
)
#endregion prepare mysql command


sqlCreateSchema= '''
  DROP DATABASE IF EXISTS {DB_NAME};
  CREATE SCHEMA {DB_NAME} DEFAULT CHARACTER SET utf8;
'''.format(DB_NAME=DB_NAME)
shCreateSchema='{mysqlCmd} -e "{sqlCreateSchema}"'.format(mysqlCmd=mysqlCmd, sqlCreateSchema=sqlCreateSchema.replace('\n', ''))

shCreateTableNData='{mysqlCmd} {DB_NAME} < {scriptFile}'.format(mysqlCmd=mysqlCmd, DB_NAME=DB_NAME, scriptFile=scriptFile)

run_bash(shCreateSchema)
run_bash(shCreateTableNData)

print '''
Ran command
#create db schema
{shCreateSchema}

#create table & data
{shCreateTableNData}

DONE
'''.format(
  shCreateSchema=shCreateSchema,
  shCreateTableNData=shCreateTableNData
)

