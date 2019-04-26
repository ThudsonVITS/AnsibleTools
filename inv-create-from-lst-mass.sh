#!/bin/bash

declare -A arr
arr+=(
["somenet"]=xxx.xxx.xxx./xx
)

for KEY in "${!arr[@]}"; do
masscan -sS -p 22 ${arr[$KEY]} -oG - --rate 100 | awk -v key="$KEY" -v KEY="$KEY" 'BEGIN{print "["KEY"]"} / 22\/open/{print $2}END{print " " }' >> inventory


done

