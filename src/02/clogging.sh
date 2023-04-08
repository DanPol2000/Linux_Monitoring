#!/bin/bash

> logfile.log
files_recording_date="$(date +"%d%m%y")"
log_date="DATE = $(date +"%d.%m.%y")"

folder_name="$(compgen -d / | shuf -n1)"
folders_names=$Parametr1
lastLatterOfFoldersName=${Parametr1: -1}
fileNames=$filename
oldFileName=$fileNames
lastLatterOfFileName=${fileNames: -1}

if [[ ${#folders_names} -lt 5 ]]; then
    for (( i=${#folders_names}; i<5; i++ )); do
        folders_names+="$(echo $lastLatterOfFoldersName)"
    done
fi

countOfFolders=100
for (( i=1; i<=$countOfFolders; i++ )); do
    folder_name="$(compgen -d / | shuf -n1)"
    filesCounter="$(shuf -i 50-100 -n1)"
    if [[ $folder_name == "/bin" || $folder_name == "/sbin" ||\
        $folder_name == "/proc" || $folder_name == "/sys" ]]; then
        countOfFolders+="$(echo $countOfFolders+1)"
        continue
    fi

    # sudo mkdir "$folder_name/"$folders_names"_"$files_recording_date"" 2>/dev/null
    mkdir "$folder_name/"$folders_names"_"$files_recording_date"" 2>/dev/null
    for (( j=1; j<=${filesCounter}; j++)); do
        available="$(df -h / | awk '{print $4}' | tail -n1)"
        if [[ ${available: -1} == "M" ]]; then
            exit 1
        fi
        # sudo fallocate -l $filesize"M" ""$folder_name"/"$folders_names"_"$files_recording_date"/"$fileNames"."$fileextension"_"$files_recording_date"" 2>/dev/null
        fallocate -l $filesize"M" ""$folder_name"/"$folders_names"_"$files_recording_date"/"$fileNames"_"$files_recording_date"."$fileextension"" 2>/dev/null
        echo ""$log_date" | "$folder_name"/"$folders_names"_"$files_recording_date"/"$fileNames"."$fileextension"_"$files_recording_date" | Size of file = $filesize Mb.">>logfile.log
        fileNames+="$(echo $lastLatterOfFileName)"
    done
    echo ""$log_date" | "$folder_name/"$folders_names"_"$files_recording_date"" | folder.">>logfile.log
    fileNames=$oldFileName
    folders_names+="$(echo $lastLatterOfFoldersName)"
done
