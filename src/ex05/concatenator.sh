#!/bin/bash



files=$(find . -name "****-**-**" | sort)
first_file=1

for file in $files; do
    if [ $first_file -eq 1 ]; then
        cat "$file"
        first_file=0
    else
        tail -n +2 "$file"
    fi
done > result.csv





