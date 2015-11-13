#!/bin/bash
[ -f ./data/hvd9130.csv ] ; rm ./data/hvd9130.csv
java -jar ePoller.jar &
echo $!
