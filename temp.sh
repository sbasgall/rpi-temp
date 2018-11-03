#!/bin/sh
cpuTemp0=$(cat /sys/class/thermal/thermal_zone0/temp)
cpuTemp1=$(($cpuTemp0/1000))
cpuTemp2=$(($cpuTemp0/100))
cpuTempM=$(($cpuTemp2 % $cpuTemp1))

CPU_TEMP="$cpuTemp1"."$cpuTempM"
GPU_STRING=$(/opt/vc/bin/vcgencmd measure_temp)
GPU_TEMP="$(echo $GPU_STRING | sed 's|[^0-9.]||g')"
#        "$(echo $OUTPUT | sed -E 's/temp=([0-9]+.[0-9]).*/\1/')"

cat <<EOF | curl --data-binary @- http://192.168.1.8:9091/metrics/job/rpi_temperature/instance/$HOSTNAME
  # TYPE rpi_temperature gauge
  # HELP rpi_temperature Just an example.
  rpi_temperature{label="cpu"} $CPU_TEMP
  rpi_temperature{label="gpu"} $GPU_TEMP
EOF
