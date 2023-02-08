#!/bin/bash
filename="02-mTestCPU"
for i in {1..10}
do
    printf "Run %d:\n" $i >> $filename.txt
    sar 1 1 -P ALL >> $filename.txt
    echo "Loop $i"
done
