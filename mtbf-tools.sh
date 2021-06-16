#!/bin/bash

# Usage info
show_usage() {
  cat <<EOF
Usage: ${0##*/} [-h]
 <--ip-or-host=IP-OR-HOST>
 <--result-dir=DIR>
 <--device-dir=DIR>
 <--properties-file=FILE>
 [--caselist=FILE]
 [--loop-count=NUM(20)]

启动对某个设备的MTBF测试。
    -h                      显示帮助信息后退出；
    --ip-or-host=IP-OR-HOST 必选，被测试设备的IP地址；
    --result-dir=DIR        必选，测试数据容器目录；
    --device-dir=DIR        必选，测试设备所对应的目录，同一批测试设备名字应该不同；
    --properties-file=FILE  必选，测试设备所对应的属性文件，同一批测试设备所用的属性（如：用户名密码）应该不同；
    --caselist=FILE         可选，描述测试用例以及重复次数的配置文件，caselist2.0_CIBN_NoCamera.txt,用户可以指定一个文件，如果没有指定，将在运行时候提示用户选择。
    --loop-count=NUM(20)    可选，每个设备执行caselist的轮数，默认为20轮；

例子：对于AmlT972平台的F50电视产品，Host为972-1e的设备(F50_1)进行测试，
./mtbf-tools.sh --ip-or-host=972-1e \
 --result-dir=../AmlT972-20210616 \
 --device-dir=F50_1 \
 --properties-file=device1 \
 --caselist-file=caselist2.0_CIBN_NoCamera.txt \
 --loop-count=20

EOF
}

# initialize
ip_or_host=
result_dir=
device_dir=
properties_file=
caselist_file=
loop_count=20

# parse options and arguments
while :; do
  case $1 in
  -h | -\? | --help)
    show_usage # Display a usage synopsis.
    exit
    ;;
  # device ip address
  --ip-or-host=?*)
    ip_or_host=${1#*=}
    ;;
  # result directory
  --result-dir=?*)
    result_dir=${1#*=}
    ;;
  # device directory
  --device-dir=?*)
    device_dir=${1#*=}
    ;;
  # properties file
  --properties-file=?*)
    properties_file=${1#*=}
    ;;
  # properties file
  --caselist-file=?*)
    caselist_file=${1#*=}
    ;;
  # loop count
  --loop-count=?*)
    loop_count=${1#*=}
    ;;
  --file=) # Handle the case of an empty --file=
    die 'ERROR: "--file" requires a non-empty option argument.'
    ;;
  -?*)
    printf 'WARN: Unknown option (ignored): %s\n' "$1" >&2
    ;;
  *) # Default case: No more options, so break out of the loop.
    break ;;
  esac

  shift
done

if [ "$ip_or_host" ] &&
  [ "$result_dir" ] &&
  [ "$device_dir" ] &&
  [ "$properties_file" ] &&
  [ "$caselist_file" ]; then
  echo ip or host="$ip_or_host"
  echo result path="$result_dir/$device_dir"
  echo properties="$properties_file"
  echo caselist="$caselist_file"
  echo loop count="$loop_count"
else
  show_usage
fi

# show_usage
