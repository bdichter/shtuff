#!/bin/bash

while read -r line; do
    echo "showing node $line ..."
    knife node show $line > results.txt
    
done < nodeshow.txt
