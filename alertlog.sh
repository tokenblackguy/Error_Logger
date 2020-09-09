#!/bin/bash

#Change variables before you do anything!
#Do not change the variable names as PATH.

MAIL=mail_address
LOGFILEPATH=path_for_monitor
SYSLOG=/var/log/syslog


tail "$SYSLOG" > "$LOGFILEPATH"


ALERT="$(egrep --color=always $@ -wi 'error|critical|warning'  "$LOGFILEPATH")"


if [ -z "$ALERT" ]
then
      echo "\$ALERT is NULL"
      #cat $LOGFILEPATH | mail -s 'NO ERRORS' $MAIL
else
      echo "\$ALERT is NOT NULL"
      echo $ALERT | mail -s 'ERRORS' $MAIL
fi

echo > $LOGFILEPATH
