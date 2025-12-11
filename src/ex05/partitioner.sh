#!/bin/sh

file=../ex03/hh_positions.csv


awk -F, '
BEGIN { FS = "," }

NR == 1 {
    header = $0
    next
}

{
    gsub(/"/, "", $2) 
    split($2, array, "T")
    date = array[1]
    filename = date ".csv"
    
    if (!created[filename]) {
        print header > filename
        created[filename] = 1
    }
    
    print $0 > filename
}' $file