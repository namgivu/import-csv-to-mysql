#!/usr/bin/env bash

#region params
  #get SCRIPT_HOME=executed script's path, containing folder, cd & pwd to get container path
  s=$BASH_SOURCE ; s=$(dirname "$s") ; s=$(cd "$s" && pwd) ; SCRIPT_HOME=$s
#endregion params

DB_USER='root'
DB_PSWD='root'
DB_NAME='yud_order_mining'

CSV_FILE='~/Desktop/export-all-orders.csv'

TABLENAME_LNFILE='~/Desktop/orders.csv'
shLnCSVFile="ln -s $CSV_FILE $TABLENAME_LNFILE"

csvFile=$TABLENAME_LNFILE
shImport="mysqlimport --ignore-lines=1 --fields-terminated-by=, --local -u $DB_USER -p$DB_PSWD $DB_NAME $csvFile"

sh="$shLnCSVFile ; $shImport" #import from csv to mysql ref. http://stackoverflow.com/a/17071108/248616, http://stackoverflow.com/a/2508648/248616

echo "
db  : $DB_USER:$DB_PSWD@localhost/$DB_NAME
csv : $CSV_FILE

Commands to run
$sh
"