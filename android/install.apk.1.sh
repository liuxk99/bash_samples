#!/bin/bash

# samples for install apk

SRC_DIR="."
APK_NAME_1="app-debug.apk"
APK_NAME_2="app-debug-androidTest.apk"

s_apk1="$SRC_DIR/$APK_NAME_1"
s_apk2="$SRC_DIR/$APK_NAME_2"

DST_DIR="/data/local/tmp"

t_apk1="$DST_DIR/$APK_NAME_1"
t_apk2="$DST_DIR/$APK_NAME_2"

SERIAL="972-1e:5555"
eval_adb="adb -s $SERIAL"
eval_adb_shell="$eval_adb shell"

adb disconnect "$SERIAL"
adb connect "$SERIAL"

#eval "$eval_adb" shell getprop ro.build.version.sdk
#eval "$eval_adb_shell" ls -l /data/local/tmp

eval "$eval_adb" push "$s_apk1" "$t_apk1"
eval "$eval_adb" push "$s_apk2" "$t_apk2"
eval "$eval_adb_shell" pm uninstall com.le.tcauto.uitest
eval "$eval_adb_shell" pm uninstall com.le.tcauto.uitest.test

sdk=$(eval "$eval_adb_shell" getprop ro.build.version.sdk)
if [ "$sdk" -lt 23 ]; then
  echo "android sdk version less than 23 use install -r"
  eval "$eval_adb_shell" pm install -r "$t_apk1"
  eval "$eval_adb_shell" pm install -r "$t_apk2"
else
  eval "$eval_adb_shell" pm install -g -r "$t_apk1"
  eval "$eval_adb_shell" pm install -g -r "$t_apk2"
fi
