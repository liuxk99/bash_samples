#!/bin/bash

# Sample for expansions and eval
host="972-1e"
SERIAL="$host:5555"
eval_adb="adb -s $SERIAL"
eval_adb_shell="$eval_adb shell"

adb disconnect "$SERIAL"
adb connect "$SERIAL"
eval "$eval_adb" shell getprop ro.build.version.sdk
eval "$eval_adb_shell" ls -l /data/local/tmp

sdk=$(eval "$eval_adb" shell getprop ro.build.version.sdk)
echo "sdk: $sdk"