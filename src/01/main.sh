#!/bin/bash

if [[ $# == 6 ]]; then
    export Absolute_path=$1
    export Num_sub_folders=$2
    export Folders_name=$3
    export Num_files_infolders=$4
    export Fname_Fextention=$5
    export File_size=$6
    chmod +x check_stdin.sh
    ./check_stdin.sh
else
    echo "Error: Invalid number of parametres"
fi
