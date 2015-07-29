#!/bin/bash

# will read file, delete node, delete client from chef, skip dialogs

while read -r line; do
    echo "deleting $line ..."
    knife node delete $line --yes
    knife client delete $line --yes
    
done < nodes.txt
