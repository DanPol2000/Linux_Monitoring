#!/bin/bash

get_info() {
  filename="/var/www/html/index"
  > $filename

  cpu="$(cat /proc/loadavg | awk '{print $1}')" # показатель загрузки средний за 1 мин
  # mem_avail="$(free | grep Mem | awk '{print $4}')" # свободная оперативная память
  mem_avail="$(free | grep 'Память' | awk '{print $4}')"
  disk_avail="$(df /| grep / | awk '{print $4}')" # свободное место на диске

  fill_line_prometheus $filename "cpu" "CPU info 1 min" $cpu
  fill_line_prometheus $filename "mem_avail" "available RAM" $mem_avail
  fill_line_prometheus $filename "disk_avail" "free disk space" $disk_avail
}

fill_line_prometheus() { 
  # $1 - filename $2 - variable name $3 - comment $4 - value
  fname=$1
  var_name=$2
  var_comment=$3
  var_value=$4
  echo "# HELP $var_name $var_comment" >> $fname
  echo "# TYPE $var_name gauge" >> $fname
  echo "$var_name $var_value" >> $fname
}
