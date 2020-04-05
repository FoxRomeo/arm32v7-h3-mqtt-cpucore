# arm32v7-h3-mqtt-cpulipo
Sends the CPUcore temperature of a Allwinner H3 (like NanopPi Neo) via MQTT to a broker every minute

    Copyright (C) 2016-2020  Oliver Faßbender
	docker@intrepid.de

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.


Dockerfile to create a container for ARM32v7 CPU
ends the CPUcore temperature of a Allwinner H3 (like NanopPi Neo) via MQTT to a broker every minute
(to be used in OpenHAB for example)

create environment file containing:
MQTTBROKER=<hostname of your broker>
MQTTPORT=1883
MQTTBASE=<MQTT Base Path>
MQTTPARAMETER=<other Parameters or empty>

start with:
docker run -d --restart=unless-stopped --name arm32v7-h3-mqtt-cpulipo -h <container-hostname> --env-file <path-to-env-file> intrepidde/arm32v7-h3-mqtt-cpulipo:latest
or
docker run -d --restart=unless-stopped --name arm32v7-h3-mqtt-cpulipo --uts="host" --env-file <path-to-env-file> intrepidde/arm32v7-h3-mqtt-cpulipo:latest

Add "-v <local path>:<container path>" to command line (example: "-v /etc/ssl/certs:/etc/ssl/certs"),
in env file MQTTPARAMETER="--cafile /etc/ssl/certs/<your ca-file> --tls-version tlsv1.1"
and change port to 8883

based on: arm32v7/debian:latest using mosquitto_pub


