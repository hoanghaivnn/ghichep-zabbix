#! bin/sh 
#
# thiet lap bien can thiet
timebackup="$(date +%H%M%S)"
now="$(date +'%d_%m_%Y_%H_%M_%S')"
filename="db_backup_$now".gz
backupfolder="/backup/"
fullbackupfile="$backupfolder/$filename"
logfile="$backupfolder/"backup_log_"$now".txt
echo "mysqldump started at $now" >> "$logfile"
mysqldump --user=root --password=zabbix --default-character-set=utf8 zabbix | gzip > "$fullbackupfile"
echo "Backup finished at $(date +'%d-%m-%Y %H:%M:%S')" >> "$logfile"
chown myuser "$fullbackupfile"
chown myuser "$logfile"
echo "file permission changed" >> "$logfile"
echo "*****************" >> "$logfile"
exit 0

