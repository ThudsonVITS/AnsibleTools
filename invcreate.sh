#!/bin/bash
# creates an Ansible host file from a CIDR if hosts have port 22 open

read -r -ei 'xxx.xxx.xxx.xxx/xx' -p "Enter subnet to scan:" subnet
read -r -ei 'MyGroup' -p "Enter ansible group name:" invgroup
read -r -p "Are you sure? [Y/n]" response
response=${response,,} # tolower
if [[ $response =~ ^(yes|y| ) ]] || [[ -z $response ]]; then
nmap -p 22 --open -sV $subnet -oG - | awk -v invgroup="$invgroup" -v subnet="$subnet" 'BEGIN{print "["invgroup"]"} /Up$/{print $2}END{print " " }' >> inventory
fi
