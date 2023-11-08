#!/bin/bash

secret_number=$(expr $RANDOM % 100 + 1)
i=1

echo "[ GUESSING GAME ]"
echo "Guess a number between 1 and 100"

while true; do
    echo -n "$i. guess: "
    read n
    ((i++)) # this is C style incrementation

    if [ $n -gt $secret_number ]; then
        echo -n "Too big"
    elif [ $n -lt $secret_number ]; then
        echo -n "Too smol"
    else
        echo -n "LET'S GOOOOO"
        break
    fi
    echo
done
