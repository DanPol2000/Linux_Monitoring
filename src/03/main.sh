#!/bin/bash

if [[ $# != 1 ]]; then
    echo "Error: Invalid number of parametres"
else
    chmod +x clean_case.sh
    ./clean_case.sh $1
fi
