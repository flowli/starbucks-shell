#!/bin/bash

URL="https://www.btopenzone.com:8443/freeToEndUserLogon"

echo -en "Logging into Starbucks WiFi (only works if already connected) ... "
wget -O /dev/null "$URL" 1>/dev/null 2>/dev/null
STATUS=$?
if [ $STATUS -ne 0 ]; then
	echo "failed :("
	exit $STATUS
fi
echo "success :)"
echo -en "Testing connection (please wait 5-10s) ... "
sleep 5
ping -c 1 -t 5 www.google.de 1>/dev/null 2>/dev/null
STATUS=$?
if [ $STATUS -ne 0 ]; then
	echo "failed :("
	exit $STATUS
fi
echo "success :)"
