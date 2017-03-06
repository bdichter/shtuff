#!/bin/bash

if [ -f last.txt ]; then
   ` rm last.txt`
    else `touch last.txt`
fi

#`echo " " > last.txt`

nodes=`knife status --hide-healthy  | awk '{ print $5 }' | sed s'/.$//'`

for i in $nodes; do
    `ssh root@\$i cat /var/cache/amazon-route53/ctmsp_hostname >> last.txt && last >> last.txt`
done

echo "1"
exit 0
