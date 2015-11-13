#!/bin/bash
# sto_collection.sh
#  Script to stop collecting snmp data from decoder.
#
# check the flag file if collection process is already started.

if [ -f ./start_flag ] ; then
  echo Stopping ...
  echo "" > ./stop_flag
# clean up just in case the system rebooted without stopping collecton.
  rm ./start_flag
else
  echo Nothing to stop...
fi

