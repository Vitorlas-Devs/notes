#!/bin/bash

error=0

# substract numbers from arguments (with sed), if we get an empty string (-z), then the argument was a number
for i in $@; do # $@ is the list of arguments
    if [ -z $(echo $i | sed 's/[0-9]//g') ]; then
        continue
    else
        error=1
        break
    fi
done

if [ $# -ne 2 ] || [ $error -eq 1 ] || [ $1 -lt 1 ] || [ $2 -lt 1 ]; then
    echo "$0: Usage: <number of lines> <number of columns>"
    exit 1
fi

for i in $(seq 1 $1); do
    for j in $(seq 1 $(($2 - 1))); do
        if [ $j -eq 1 ] || [ $i -eq 1 ] || [ $i -eq $1 ]; then
            echo -n "+"
        else
            echo -n "-"
        fi
    done
    echo "+"
done
