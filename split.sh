#!/bin/bash

string="10.58.80.118,10.58.80.120,10.58.80.122"
IFS=',' read -r -a ip_addr_array <<< "$string"

i=0
for element in "${ip_addr_array[@]}"
do
  i=$((i+1))
  echo "$i:""$element"
done