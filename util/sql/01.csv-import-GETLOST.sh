#!/usr/bin/env bash

#ref.
# import from csv to mysql ref. http://stackoverflow.com/a/17071108/248616, http://stackoverflow.com/a/2508648/248616

#region params
  #get SCRIPT_HOME=executed script's path, containing folder, cd & pwd to get container path
  s=$BASH_SOURCE ; s=$(dirname "$s") ; s=$(cd "$s" && pwd) ; SCRIPT_HOME=$s
#endregion params

DB_USER='root'
DB_PSWD='root'
DB_NAME='yud_order_mining'

CSV_FILE_ORIGIN='~/Desktop/export-all-orders.csv'
CSV_FILE_ORIGIN='~/Desktop/small.csv'
CSV_FILE="$CSV_FILE_ORIGIN.temp"
shClone2Sed="cp -f $CSV_FILE_ORIGIN $CSV_FILE"

shRemoveRETChar="tr -d '\r' < $CSV_FILE_ORIGIN > $CSV_FILE"

sedSearchFor='Credit Card\n'
sedReplaceBy='Credit Card '
sedOption=':a;N;$!ba;'
shFixCreditCardValue="sed '${sedOption}s/$sedSearchFor/$sedReplaceBy/g' $CSV_FILE"



TABLENAME_LNFILE='~/Desktop/orders.csv'
shLnCSVFile="ln -fs $CSV_FILE $TABLENAME_LNFILE"

csvFile=$TABLENAME_LNFILE
opSepLine="--lines-terminated-by=\n\r"
opSepLine=""
opSepCol=" --fields-terminated-by=,"
shImport="mysqlimport --ignore-lines=1 $opSepLine $opSepCol --local -u $DB_USER -p$DB_PSWD $DB_NAME $csvFile"
#shCleanup="rm -rf $TABLENAME_LNFILE; rm -rf $CSV_FILE"
shCleanup="rm -rf $TABLENAME_LNFILE"

sh="
$shClone2Sed ;
$shRemoveRETChar ; $shFixCreditCardValue ;
$shLnCSVFile ; $shImport ;
$shCleanup ;
"

eval $sh

echo "
SUMMARY
db  : $DB_USER:$DB_PSWD@localhost/$DB_NAME
csv : $CSV_FILE

Ran commands
$sh
"