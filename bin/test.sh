#!/bin/bash

log="test.log"
echo "`date` start on `hostname` in `pwd` " >> $log
echo "CMD: $*" >> $log
echo "sample output" > "output.txt"
echo "`date` end." >> $log
