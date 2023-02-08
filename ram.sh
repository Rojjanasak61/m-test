#!/bin/bash
filename="03-mTestRAM"
for i in {1..10}
do
    printf "Data %d:\n" $i >> $filename.txt
    sar -r 1 1 -P ALL >> $filename.txt
    echo "Loop $i"
done


