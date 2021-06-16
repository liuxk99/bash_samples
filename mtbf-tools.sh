#!/bin/bash

# Usage info
show_usage() {
  cat <<EOF
Usage: ${0##*/} [-h]
 <--ip-address=IP_ADDR>
 <--result-dir=DIR>
 <--device-dir=DIR>
 <--properties-file=FILE>
 [--caselist=FILE]
 [--loop-count=NUM(20)]

启动对某个设备的MTBF测试。
    -h                      显示帮助信息后退出；
    --ip-address=IP_ADDR    必选，被测试设备的IP地址；
    --result-dir=DIR        必选，测试数据容器目录；
    --device-dir=DIR        必选，测试设备所对应的目录，同一批测试设备名字应该不同；
    --properties-file=FILE  必选，测试设备所对应的属性文件，同一批测试设备所用的属性（如：用户名密码）应该不同；
    --caselist=FILE         可选，描述测试用例以及重复次数的配置文件，caselist2.0_CIBN_NoCamera.txt,用户可以指定一个文件，如果没有指定，将在运行时候提示用户选择。
    --loop-count=NUM(20)    可选，每个设备执行caselist的轮数，默认为20轮；
EOF
}

show_usage
