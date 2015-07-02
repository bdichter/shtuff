#!/bin/bash

some_directory="/tmp1"

if cd $some_directory; then
    ls
else
    echo "Could not change directory! Aborting." 1>&2
    exit 1
fi
