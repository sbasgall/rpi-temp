Raspberry Pi temperature emittor for prometheus pushgateway

This use case does not require pushgateway, an alternative approach would be to use the textfile collector.
This allows for the collection of temperature observations without having to modify or depend on anything other than pushgateway.

sudo docker run http://prom.host:port

sudo docker run https://192.168.100.10:9090

The collection script is based on: https://raspberrypi.stackexchange.com/questions/9105/raspberry-pi-onboard-temp-sensors-in-raspbianwheezy

I don't know the quality of the temperature readings.

For VCHI initialization to succeed the container must be run in privileged mode.
