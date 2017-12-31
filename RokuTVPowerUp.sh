#!/bin/sh

RoKuTVIP="192.168.0.38"
ping -c 1 $RoKuTVIP
if [ "$?" = 0 ] ;then
        echo "Roku TV is reachable by IP address."
        curl -d '' "http://$RoKuTVIP:8060/keypress/Poweron"
        echo "Turning to Channel 26.1 for Chinese Evening News."
        sleep 5;curl -d '' "http://$RoKuTVIP:8060/launch/tvinput.dtv?ch=26.1"
else
        echo "Roku Tv is not reachable by Ip address. Need to send wakeonlan command to wakeup the TV."
        wakeonlan 5c:ad:76:11:4d:b2
        echo "Turning to Channel 26.1 for Chinese Evening News."
        sleep 5;curl -d '' "http://$RoKuTVIP:8060/launch/tvinput.dtv?ch=26.1"
fi

