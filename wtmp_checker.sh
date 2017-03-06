#!/bin/bash

#
# Description: Checks date of wtmp and gz files and lines in wtmp
#              Checks btmp for bad logins
#              Warning: this script merely reads from ls command and outputs on screen!
#

host=`cat /var/cache/zabbix/zabbix_hostname`
name=`cat /var/cache/zabbix/zabbix_name`
echo ""
echo "Hostname here is $host"
echo "Name here is $name"


# Are there any entries for current month? Previous month?
# grep month, count lines in file
last_count=`last | grep $wtmp_date | wc -l`
if [ "$last_count" -lt 1 ] ; then
        echo "Something may be wrong with wtmp or no one has logged into this box for a long time."
        else echo "There are $last_count entries in the current wtmp log."
fi

# check if there are any bad logins, count
# depending on frequency, this may alert too often
lastb_count=`lastb | wc -l`
if [ "$lastb_count" -gt 2 ] ; then
        echo "Hey, there may be some bad logins here."
        echo ""
        else echo "There are $lastb_count entries in the current btmp log; seems ok."
        echo ""
fi


# print current wtmp log file date
wtmp_date=`ls -las /var/log/wtmp | awk '{ print $7 }'`
echo ""
echo "The wtmp log was last updated in $wtmp_date"

# print current gz file date
wtmpz_date=`ls -las /var/log/wtmp.1.gz | awk '{ print $7 }'`
echo "The previous wtmp log was rotated in $wtmpz_date"

case $wtmpz_date in
        $wtmp_date | Mar)
                echo "The wtmp log and gz file seem to be current"
                echo ""
                ;;
        $wtmp_date | Feb)
                echo "The wtmp log and gz file seem to be current"
                echo ""
                ;;
        $wtmp_date | Jan)
                echo "The wtmp log and gz file seem to be current"
                echo ""
                ;;
       $wtmp_date | Dec)
                echo "The wtmp log and gz file seem to be current"
                echo ""
                ;;
       $wtmp_date | Nov)
                echo "The wtmp log and gz file seem to be current"
                echo ""
                ;;
       $wtmp_date | Oct)
                echo "The wtmp log and gz file seem to be current"
                echo ""
                ;;
       $wtmp_date | Sep)
                echo "The wtmp log and gz file seem to be current"
                echo ""
                ;;
       $wtmp_date | Aug)
                echo "The wtmp log and gz file seem to be current"
                echo ""
                ;;
       $wtmp_date | Jul)
                echo "The wtmp log and gz file seem to be current"
                echo ""
                ;;
       $wtmp_date | Jun)
                echo "The wtmp log and gz file seem to be current"
                echo ""
                ;;
       $wtmp_date | May)
                echo "The wtmp log and gz file seem to be current"
                echo ""
                ;;
        *)
                echo "The wtmp log and/or the gz file do not seem to be current"
                echo ""
                ;;
esac


