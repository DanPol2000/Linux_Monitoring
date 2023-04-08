#!/bin/bash

if [[ ($Parametr1 =~ [0-9]) || ($Parametr1 =~ [^A-Za-z]) ||\
    (${#Parametr1} -gt 7) ]]; then
    echo "Error: Invalid folder name"
    exit 1
fi

export filename="$(echo $Parametr1 | awk -F. '{print $1}')"
export fileextension="$(echo $Parametr2 | awk -F. '{print $2}')"
if [[ ${#filename} > 7 || ${#fileextension} > 3 ||\
    $filename =~ [^A-Za-z] || $fileextension =~ [^A-Za-z] ||\
    ($fileextension == "") || ${#filename} < 1 ]]; then
    echo "Error: Invalid files name"
    exit 1
fi

export filesize=$(echo $Parametr3 | awk -F"Mb" '{print $1}')
if [[ !($Parametr3 =~ Mb$) || ($filesize =~ [^0-9]) || ($filesize -gt 100) || ($filesize -le 0) ]]; then
    echo "Error: Invalid size"
    exit 1
fi

chmod +x clogging.sh
./clogging.sh
