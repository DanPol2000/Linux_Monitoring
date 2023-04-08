#!/bin/bash

case $parametr in

    1)
        for (( i=1; i < 6; i++ )); do
            sort -k 9 ../04/$i.log -o sort$i.log
        done
    ;;

    2)
        for (( a = 1; a < 6; a++ )); do
            awk '{print $1|"sort -u"}' ../04/$a.log > sort$a.log
        done
    ;;

    3)
        for (( a = 1; a < 6; a++ )); do
            awk '$9 ~ /^4|^5/' ../04/$a.log > sort$a.log
        done
    ;;

    4)
        for (( a = 1; a < 6; a++ )); do
            awk '$9 ~ /^4|^5/' ../04/$a.log > temp.log
            awk '{print $1|"sort -u"}' temp.log > sort$a.log
            rm temp.log
        done
    ;;
esac
