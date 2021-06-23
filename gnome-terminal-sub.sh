#!/bin/bash

# sleep random seconds
seconds=$(( RANDOM % 3 + 3 ))
echo "sleep $seconds(s)"
sleep $seconds
