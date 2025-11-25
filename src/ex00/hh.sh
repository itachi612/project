#!/bin/sh

vac="$1"

if [ $# -eq 0 ]; then
    echo "Не переданы аргументы"
    exit 1
fi

URL="https://api.hh.ru/vacancies"
rm -f hh.json

curl -G "$URL" --data-urlencode "text=$vac" \
               --data-urlencode "search_field=name" \
               --data-urlencode "page=0" \
               --data-urlencode "per_page=20" \
               | jq . > hh.json




