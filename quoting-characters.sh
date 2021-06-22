#!/bin/bash

# Quoting characters
# https://tldp.org/LDP/Bash-Beginners-Guide/html/sect_03_03.html
date=20021226
echo $date
echo \$date
echo '$date'
echo "$date"
echo "`date`"
echo "I'd say: \"Go for it!\""
echo "\\"
echo '\'
#echo "\"
