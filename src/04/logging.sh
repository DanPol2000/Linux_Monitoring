#!/bin/bash

counter=1
day=$(date +%d)

for ((; counter < 6; counter++ )); do
    number_of_records=$(shuf -i 100-1000 -n1)
    for (( i = 0; i < number_of_records; i++ )); do
        echo -n "$(shuf -i 1-254 -n1).$(shuf -i 1-254 -n1).$(shuf -i 1-254 -n1).$(shuf -i 1-254 -n1)" >> $counter.log
        echo -n " - - " >> $counter.log
        echo -n "[$(date +%d)$(date +/%b/%Y:$(shuf -n1 -i 1-23):$(shuf -n1 -i 1-59):$(shuf -n1 -i 1-59)) +0000] " >> $counter.log
        echo -n "\"$(shuf -n1 methods) " >> $counter.log
        echo -n "$(shuf -n1 uri) " >> $counter.log
        echo -n "$(shuf -n1 protocol)\" " >> $counter.log
        echo -n "$(shuf -n1 codes) " >> $counter.log
        echo -n $RANDOM >> $counter.log
        echo -n " \"-\" " >> $counter.log
        echo "\"$(shuf -n1 agent)\"" >> $counter.log
    done
    let day=day-1
done

# 200 - OK
# 201 - Created
# 202 - Accepted
# 203 - Non-Authoritative Information (since HTTP/1.1)
# 204 - No Content
# 205 - Reset Content
# 400 - Bad Request
# 401 - Unauthorized (RFC 7235)
# 403 - Forbidden
# 404 - Not Found
# 405 - Method Not Allowed
# 408 - Request Timeout
# 500 - Internal Server Error
# 501 - Not Implemented
# 502 - Bad Gateway
# 503 - Service Unavailable
# 504 - Gateway Timeout
# 505 - HTTP Version Not Supported
