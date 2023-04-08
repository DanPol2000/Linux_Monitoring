#!/bin/bash

START=$(date +%s%N)
TIMES=$(date +%H:%M)

if [[ $# == 3 ]]; then
    export Parametr1=$1
    export Parametr2=$2
    export Parametr3=$3
    
    chmod +x check_stdin.sh
    ./check_stdin.sh

    END=$(date +%s%N)
    DIFF=$((($END - $START)/10000000))
    TIMEE=$(date +%H:%M)
    echo "Start time: $TIMES"
    echo "End time: $TIMEE"
    echo "Script working $DIFF ms"

    echo "">>logfile.log
    echo "Start time: $TIMES" >>logfile.log
    echo "End time: $TIMEE" >>logfile.log
    echo "Script working $DIFF ms" >>logfile.log
else
    echo "Error: Invalid number of parametres"
fi
