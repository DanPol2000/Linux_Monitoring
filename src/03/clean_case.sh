#!/bin/bash

Parametr=$1
Date="$(cat ../02/logfile.log| awk -F'|' '{print $2}' | awk -F'_' '{print $3}')"
newDate=${Date: -7}

if [[ $Parametr =~ [^0-9] ]]; then
    echo "Error: Invalid parametr"
    exit 1
else
    case $Parametr in

    1)
        Location="$(cat ../02/logfile.log | awk -F'|' '{print $2}')"
        for file in $Location
        do
            rm -rf $file
        done
        # echo -n>../02/logfile.log
    ;;

    2)
        echo "Insert FROM >DATE< >TIME< Example: >YYYY-MM-DD HH:MM<"
        read srcDate srcTime
        echo "Insert FROM >DATE< >TIME< Example: >YYYY-MM-DD HH:MM<"
        read dstDate dstTime
        rm -r $(find / -newermt "$srcDate $srcTime" -not -newermt "$dstDate $dstTime+1" 2>/dev/null | grep $newDate | sort) 2>/dev/null
        # echo -n>../02/logfile.log
    ;;

    3)
        echo "Insert FROM >MASK< Example: >_DDMMYY<"
        read mask
        array=(~ /boot /cdrom /dev /etc /lib /lib32 /lib64 /libx32 /media /mnt /opt /proc /run /snap /srv /sys /tmp /usr /var /root /lost+found)
        for item in ${array[*]}
        do
            cd ~
            cd $item
            # sudo rm -rf $(find -type d -name "*${mask}")
            rm -rf $(find -type d -name "*${mask}")
        done
        # echo -n>../02/logfile.log
    ;;

    *)
    echo "Wrong value!"
    ;;
    esac
fi
