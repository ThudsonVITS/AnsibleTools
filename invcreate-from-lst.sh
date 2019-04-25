#!/bin/bash

declare -A arr

arr+=( ["test1"]=x.x.x.x/xx
["test2"]=x.x.x.x/xx
)

for KEY in "${!arr[@]}"; do
nmap -p 22 --open -P0 -sV ${arr[$KEY]} -oG - | awk -v key="$KEY" -v KEY="$KEY" 'BEGIN{print "["KEY"]"} /Up$/{print $2}END{print " " }' >> inventory


done

