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

adb disconnect "$SERIAL"
adb connect "$SERIAL"

export ANDROID_SERIAL="$SERIAL"
adb push $s_apk1 $t_apk1
adb push $s_apk2 $t_apk2
adb shell pm uninstall com.le.tcauto.uitest
adb shell pm uninstall com.le.tcauto.uitest.test

sdk=$(adb shell getprop ro.build.version.sdk)
if [ "$sdk" -lt 23 ]; then
  echo "android sdk version less than 23 use install -r"
  adb shell pm install -r "$t_apk1"
  adb shell pm install -r "$t_apk2"
else
  adb shell pm install -g -r "$t_apk1"
  adb shell pm install -g -r "$t_apk2"
fi
