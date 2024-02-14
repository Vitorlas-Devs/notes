#!/bin/sh

error=0

if ! echo $1 | grep -qE '^[0-9]+$' || [ $# -ne 1 ] || [ $1 -lt 1 ]; then
  echo "Usage: $0 <size>"
  exit 1
fi

for i in $(seq 1 $1); do
  for s in $(seq $1 -1 $(($i + 1))); do
    printf "  "
  done
  for j in $(seq 1 $(($i * 2))); do
    printf "x "
  done
  echo
done

for i in $(seq $1 -1 1); do
  for s in $(seq $1 -1 $(($i + 1))); do
    printf "  "
  done
  for j in $(seq 1 $(($i * 2))); do
    printf "x "
  done
  echo
done

# #!/bin/bash

# error=0

# if ! [[ $1 =~ ^[0-9]+$ ]] || [ $# -ne 1 ] || [ $1 -lt 1 ]; then
#   echo "Usage: $0 <size>"
#   exit 1
# fi

# for ((i = 1; i <= $1; i++)); do
#   for ((s = $1; s > i; s--)); do
#     echo -n "  "
#   done
#   for ((j = 1; j <= i * 2; j++)); do
#     echo -n "x "
#   done
#   echo
# done

# for ((i = $1; i > 0; i--)); do
#   for ((s = $1; s > i; s--)); do
#     echo -n "  "
#   done
#   for ((j = 1; j <= i * 2; j++)); do
#     echo -n "x "
#   done
#   echo
# done
