#!/bin/bash
# read a text file of URLs, curl each line, derive and evaluate header response.
# because, reasons. And, too lazy to do it manually.

while read LINE; do 
  # curl each line, no progress bar. awk derive header response code from output.
  myurl=`curl -s -I $LINE |awk '/HTTP/ { print $2 }'`
    
  # evaluate header response code. 301 is good, anything else not good.
  if [ "$myurl" == "301" ] || [ "$myurl" == "302" ]; then
    echo "$LINE redirect was a SUCCESS"    
  else
    echo "redirect has FAILED"
  fi

done < curls.txt

echo "That's all folks!"
