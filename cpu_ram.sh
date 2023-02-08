#!/bin/bash
filename="01-mTest"
for i in {1..14}
do
    printf "Run %d:\n" $i >> $filename.txt
    sar 1 1 -P ALL >> $filename.txt
    sar -r 1 1 -P ALL >> $filename.txt
    echo "Loop $i"
done

