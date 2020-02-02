#!bin/sh

umask 077

period=31

dirpath='/root/backup/mysql'

filename=`date +%y%m%d%H%M`

mysqldump --opt --all-databases --events --default-character-set=binary -u menta --password=“パスワード” | gzip > $dirpath/$filename.sql.gz

oldfile=`date --date "$period days ago" +%y%m%d`
rm -f $dirpath/$oldfile.sql.gz
