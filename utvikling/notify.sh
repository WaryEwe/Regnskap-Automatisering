#!/bin/bash
USER="olav"  
ANTALL_DAGER=80
DATO=$(date +%s)

SIST_PASSORD_ENDRET=$(chage -l $USER | grep "Last password change" | awk -F": " '{print $2}')
SORTER_PASSORD=$(date -d "$SIST_PASSORD_ENDRET" +%s)


SIST_ENDRET=$(( (CURRENT_DATE - LAST_PASSWD_CHANGE_EPOCH) / 86400 ))

if [ $SIST_ENDRET -ge $ANTALL_DAGER ]; then
    echo "Passordet ditt har ikke blitt endret på $SIST_ENDRET dager. Du må endre passordet nå"
    DISPLAY=:0 notify-send "Hello!" "This is a message." 
fi
