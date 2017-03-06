#!/bin/bash

while read -r line; do
    echo $line |sed 's/.$/ \"ls -l"/' |sed 's/.*=//' |sed 's/^.//' >> testerout.txt
    
done < tester.txt

