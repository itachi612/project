#!/bin/sh

file=../ex03/hh_positions.csv

{
    echo '"name","count"'
    awk -F, '
    BEGIN { 
        j = 0; m = 0; s = 0 
    }
    NR > 1 {
        if ($3 ~ /[Jj]unior/) j++
        if ($3 ~ /[Mm]iddle/) m++
        if ($3 ~ /[Ss]enior/) s++
    }
    END { 
        print "\"Junior\",\"" j "\"" 
        print "\"Middle\",\"" m "\""
        print "\"Senior\",\"" s "\""
    }
    ' "$file" | sort -t, -k2,2nr
} > hh_uniq_positions.csv
