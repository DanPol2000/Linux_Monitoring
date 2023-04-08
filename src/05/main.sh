#!/bin/bash

if [[ $# != 1 || $1 =~ [^1-4] ]]; then
    echo "Error: Invalid number of parametr"
else
    export parametr=$1
    chmod +x monitoring.sh
    ./monitoring.sh
fi
