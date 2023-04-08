#!/bin/bash

> logfile.log
foldname=$Folders_name
last_letter_foldname=${Folders_name: -1}
fileName=$filename
old_fname=$fileName
last_letter_filename=${fileName: -1}
Date="$(date +"%d%m%y")"
logDate="DATE = $(date +"%d.%m.%y")"

if [[ ${#foldname} -lt 4 ]]; then
    for (( i=${#foldname}; i<4; i++ )); do
        foldname+="$(echo $last_letter_foldname)"
    done
fi

for (( i=1; i<=$Num_sub_folders; i++ )); do
    # sudo mkdir "$Absolute_path/"$foldname"_"$Date""
    mkdir "$Absolute_path/"$foldname"_"$Date""
    for (( j=1; j<=$Num_files_infolders; j++)); do
        available="$(df -h / | awk '{print $4}' | tail -n1)"
        if [[ ${available: -1} == "M" ]]; then
            exit 1
        fi
        # sudo fallocate -l $filesize ""$Absolute_path"/"$foldname"_"$Date"/"$fileName"."$fileExt"_"$Date""
        fallocate -l $filesize ""$Absolute_path"/"$foldname"_"$Date"/"$fileName"_"$Date"."$fileExt""
        echo ""$logDate" | "$Absolute_path"/"$foldname"_"$Date"/"$fileName"."$fileExt"_"$Date" | Size of file = $filesize Kb.">>logfile.log
        fileName+="$(echo $last_letter_filename)"
    done
    echo ""$log_date" | "$Absolute_path/"$foldname"_"$Date"" | folder.">>logfile.log
    fileName=$old_fname
    foldname+="$(echo $last_letter_foldname)"
done
