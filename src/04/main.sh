#!/bin/bash

if [ $# != 0 ]; then
    echo "Error: Invalid parametr"
else
    chmod +x logging.sh
    ./logging.sh
fi
