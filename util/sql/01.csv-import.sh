#!/usr/bin/env bash

#region params
  #get SCRIPT_HOME=executed script's path, containing folder, cd & pwd to get container path
  s=$BASH_SOURCE ; s=$(dirname "$s") ; s=$(cd "$s" && pwd) ; SCRIPT_HOME=$s
#endregion params

DB_USER='root'
DB_PSWD='root'
DB_NAME='yud_order_mining'

CSV_FILE='~/Desktop/export-all-orders.csv'
CSV_FILE='~/Desktop/small.csv'
ORDER_TABLENAME='orders'

mysql="mysql -u $DB_USER -p$DB_PSWD $DB_NAME"
sudo='sudo -H'

sql="SHOW VARIABLES LIKE 'secure_file_priv';";
shWhereCanRun="$mysql -e \"$sql\" " #should be /var/lib/mysql-files

file_priv='/var/lib/mysql-files'
shCopy2Priv="$sudo cp -f $CSV_FILE $file_priv/"

sql="LOAD DATA INFILE '$CSV_FILE' INTO TABLE $ORDER_TABLENAME";
shLoadData="$sudo $mysql -e \"$sql\" "

sql="select * from orders limit 4;";
shAftermath="$mysql -e '$sql'"

sh="
  $shWhereCanRun ; $shCopy2Priv ;
  $shLoadData ;
  $shAftermath ;
" #import from csv to mysql ref. http://stackoverflow.com/a/17071108/248616, http://stackoverflow.com/a/2508648/248616

eval $sh

echo "
db  : $DB_USER:$DB_PSWD@localhost/$DB_NAME
csv : $CSV_FILE

Ran commands
$sh
"