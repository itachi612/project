#!/bin/sh

file="../ex01/hh.csv"

head -n 1 $file > hh_sorted.csv
tail -n +2 $file | sort -t ',' -k2,2 -k1,1n >> hh_sorted.csv

