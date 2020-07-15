#!/bin/bash

#    Copyright (C) 2016  Oliver Faßbender
#    docker@intrepid.de
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see <http://www.gnu.org/licenses/>.

HOSTNAME=`hostname`

while true; do
  /usr/local/bin/mosquitto_pub -h $MQTTBROKER -p $MQTTPORT -i $HOSTNAME -q 1 -t $MQTTBASE/$HOSTNAME/CPUcore $MQTTPARAMETER -m "`echo "scale = 0 ; $(cat /sys/class/thermal/thermal_zone0/temp) / 1000" | bc -l `" &> /dev/null
  sleep 60
done

exit 1
