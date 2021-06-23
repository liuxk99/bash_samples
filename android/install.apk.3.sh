#!/bin/bash

# samples for install apk
pkg_name=$1
apk_path=$2
if [ ! -f "$apk_path" ]; then
  echo "$apk_path" dose not exist!
  exit 2
fi
apk_file=$(basename -- "$apk_path")

DST_DIR="/data/local/tmp"

t_apk="$DST_DIR/$apk_file"

SERIAL="972-1e:5555"

adb disconnect "$SERIAL"
adb connect "$SERIAL"

export ANDROID_SERIAL="$SERIAL"
pkg_num=$(adb shell pm list package "$pkg_name" |wc -l)
if [ "$pkg_num" -gt 0 ]; then
  adb uninstall "$pkg_name"
fi
adb push "$apk_path" "$t_apk"
sdk=$(adb shell getprop ro.build.version.sdk)
if [ "$sdk" -lt 23 ]; then
  echo "android sdk version less than 23 use install -r"
  adb shell pm install -r "$t_apk"
else
  adb shell pm install -g -r "$t_apk"
fi
