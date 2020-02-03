#!/bin/sh

PERIOD=5
DIRPATH='/root/backup/mysql'
FILENAME=`date +%y%m%d%H%M`
ZIPFILENAME="${DIRPATH}/${FILENAME}.sql.gz"

mysqldump --opt --all-databases --events --default-character-set=binary -u menta --password="パスワード" | gzip > $ZIPFILENAME
sudo chmod 700 $ZIPFILENAME

OLDFILE=`date --date "$PERIOD days ago" +%y%m%d%H%M`
rm -f $DIRPATH/$OLDFILE.sql.gz

