#!/bin/sh

n=$(cat .counter)
n=$(expr $n + 1)

echo $n
echo $n >.counter
