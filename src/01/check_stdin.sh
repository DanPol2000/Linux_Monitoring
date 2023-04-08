#!/bin/bash

if [[ !(-d $Absolute_path) ]]; then
    echo "Error: Invalid path.Must be an absolute path"
    exit 1
fi


if [[ $Num_sub_folders =~ [^0-9] ]]; then
    echo "Error: Invalid number of subfolders"
    exit 1
else
    if [[ $Num_sub_folders -gt 100 || $Num_sub_folders -le 0 ]]; then
        echo "Error: Invalid number of folders"
        exit 1
    fi
fi


export numberFoldersNames=${#Folders_name}
if [[ (${#numberFoldersNames} -gt 7) ]]; then
    echo "Error: Invalid number of letters in folders names.Must be no more than 7"
    exit 1
else
    if [[ $Folders_name =~ [^A-Za-z] ]]; then
        echo "Error: Invalid arguments in folders name"
        exit 1
    fi
fi
    
   
if [[ $Num_files_infolders =~ [^0-9] ]]; then
    echo "Error: Invalid argument in number of files"
    exit 1
else
    if [[ $Num_files_infolders -gt 100 ]]; then
        echo "Error: Too much files"
        exit 1
    fi
fi

export  filename=$(echo $Fname_Fextention | awk -F. '{print $1}')
export  fileExt=$(echo $Fname_Fextention | awk -F. '{print $2}')
if [[ ${#filename} > 7 || ${#fileExt} > 3 ||\
    $filename =~ [^A-Za-z] || $fileExt =~ [^A-Za-z] ||\
    $fileExt == "" || ${#filename} < 1 ]]; then
    echo "Error: Invalid argument"
    exit 1
fi


export  filesize=$(echo $File_size | awk -F"Kb" '{print $1}')
if [[ ! ($File_size =~ Kb$) || ($filesize =~ [^0-9]) || ($filesize -gt 100) || ($filesize -le 0) ]]; then
    echo "Error: Invalid size"
    exit 1
fi

chmod +x generator.sh
./generator.sh
