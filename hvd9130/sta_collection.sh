#!/bin/bash
# sta_collection.sh
#  Script to start collecting snmp data from decoder.
#
# check the flag file if collection process is already started.

if [ -f ./start_flag ] ; then
 echo Already Started. 
 exit 0
fi
# initialize the output file
if [ -f $1 ] ; then
# date-stamp it if there is an old one exist.
  mv $1 $1.`date +%F-%T`
fi
echo "" > $1

# Create a start flag if there is none, 
# if there is a stop flag, change it to start.
if [ -f ./stop_flag ] ; then
  mv ./stop_flag ./start_flag
else
  echo "" > ./start_flag
fi
echo Starting...
# Clear packet count
./clearcounter.sh

while [ ! -f ./stop_flag ] ;
do 
	./getsnmp.sh >> $1
	echo "" >> $1
	sleep 2
done
if [ -f ./start_flag ]; then 
rm ./start_flag
fi
