#!/bin/sh
cpuTemp0=$(cat /sys/class/thermal/thermal_zone0/temp)
cpuTemp1=$(($cpuTemp0/1000))
cpuTemp2=$(($cpuTemp0/100))
cpuTempM=$(($cpuTemp2 % $cpuTemp1))

CPU_TEMP="$cpuTemp1"."$cpuTempM"
GPU_STRING=$(/opt/vc/bin/vcgencmd measure_temp)
GPU_TEMP="$(echo $GPU_STRING | sed 's|[^0-9.]||g')"
#        "$(echo $OUTPUT | sed -E 's/temp=([0-9]+.[0-9]).*/\1/')"
echo "cpu $CPU_TEMP" | curl --data-binary @- "$1/metrics/job/pi_temperature"
echo "gpu $GPU_TEMP" | curl --data-binary @- "$1/metrics/job/pi_temperature"
