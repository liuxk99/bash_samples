#!/bin/bash

## define it
distro=("redhat" "debian" "gentoo")

## get length of $distro array
len=${#distro[@]}

## Use bash for loop
for (( i=0; i<len; i++ ))
do
   echo "${distro[$i]}"
done
