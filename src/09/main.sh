#!/bin/bash

source ./functions.sh

if [[ $# == 0 ]]
then
  while true
  do
    get_info
    sleep 3;
  done
fi
