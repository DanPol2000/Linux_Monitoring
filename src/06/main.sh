#!/bin/bash

if [[ $# != 0 ]]; then 
    echo "Error: Invalid number of parametr"
else
    chmod +x run.sh
    ./run.sh
fi
