#!/bin/sh
# Filename: update_hosts.sh
# Description: Update lastest mvps hosts

ETC_HOSTS=/etc/hosts
MVPS_HOSTS=/tmp/hosts.txt
MVPS_URL="http://winhelp2002.mvps.org/hosts.txt"

if wget ${MVPS_URL} -O /tmp/hosts.txt 1>/dev/null 2>&1 ; then
        #dos2unix $MVPS_HOSTS
        sed -i 's/\r$//' $MVPS_HOSTS
        sed -i '/This MVPS HOSTS file is a free download from/,$d' $ETC_HOSTS
        cat $MVPS_HOSTS >> $ETC_HOSTS
        echo "/etc/hosts updated"
else
        echo "/etc/hosts not updated"
        exit 1
fi