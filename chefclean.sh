#!/bin/bash

getem=`knife status --hide-healthy  | awk '{ print $6 }' | sed s'/.$//'`

for i in $getem; do
    `ssh -o 'StrictHostKeychecking=no' root\@$i chef-client`
done

echo "1"
exit 0
