#!/bin/bash

while read -r line; do
    eval $line

done < testerout.txt


