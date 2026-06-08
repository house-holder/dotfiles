#!/bin/bash

WEEK=$(date +"%V")
DAY=$(date +"%j" | sed 's/^0*//')
YEAR=$(date +"%Y")
if [ $((YEAR % 4)) -eq 0 ] && ([ $((YEAR % 100)) -ne 0 ] || [ $((YEAR % 400)) -eq 0 ]); then
    TOTAL_DAYS=366
else
    TOTAL_DAYS=365
fi

echo -e "Week: $WEEK\nDay: $DAY/$TOTAL_DAYS"
