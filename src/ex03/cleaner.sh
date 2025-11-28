#!/bin/sh 

file=../ex02/hh_sorted.csv

awk '
BEGIN{
    FS = ",";
    OFS = ",";
}
{
    if (NR == 1){
        print $0;
        next;
    }

    name = $3;
    for(i = 4; i < NF-1; i++) {
        name = name "," $i;
    }
    
    gsub(/"/, "", name);

    if (match(name, /([Jj]unior|[Mm]iddle|[Ss]enior)(\/([Jj]unior|[Mm]iddle|[Ss]enior))*/)) {
        result = substr(name, RSTART, RLENGTH);
    } else {
        result = "-";
    }
    
    # Пересобираем строку вместо очистки полей
    print $1 "," $2 ",\"" result "\"," $(NF-1) "," $NF;
}
' "$file" > hh_positions.csv