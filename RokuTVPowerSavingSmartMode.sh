#!/bin/bash

motion_detection(){ #Motion Dection Function
currentTime=$(date +%H%M%S)
motionTime=$(sed -n 1p motion_detected_time.txt) #Reading a text file geneated by Motion library
timeDif=$(($currentTime-$motionTime))

echo "Curren Time: " $currentTime
echo "Motion detected time: "  $motionTime

echo "Time Difference: "$timeDif

if [ $timeDif -gt 1500 ]; #motion doesn't detect within 15 minutes, power off the Roku TV
then
 echo 'No Motion detected within 15 minutes, powering off the Roku TV';
 curl -d '' "http://$RoKuTVIP:8060/keypress/PowerOff"

fi
}

RoKuTVIP="192.168.0.38"
ping -c 1 $RoKuTVIP
if [ "$?" = 0 ] ;then
        echo "Roku TV is reachable by IP address."
                motion_detection
else
        echo "Roku Tv is not reachable by Ip address."
fi



