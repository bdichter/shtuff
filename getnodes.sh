#!/bin/bash
#getnodes.sh

#declare -a cmd
cmd=`knife status --hide-healthy  | awk '{ print $1 }' | grep -o -w '\w\{4,\}'`
#cmd=`knife status --hide-healthy  | awk '{ print $1 }' | sed s'/.$//' | grep -o -w '\w\{4,\}'`
#cmd1=`knife status --hide-healthy  | awk '{ print $4 }' | sed s'/.$//'`
#echo $cmd[1]
echo "$cmd"

#hours=`echo $cmd | awk '{ print $1 }'`

#for n in $(cmd); do
#    size=$(#cmd)
#    echo "Length of column  is ${size}"
#done

#iaws=`echo $cmd | awk '{ print $2 }'`

#if [ "$size" <= "4" ]; then
#    echo "$cmd"
#fi

#echo "$cmd" > nodesgot.txt
