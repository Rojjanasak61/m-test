#!/bin/bash
for i in {0..10}; do
    echo "Time: $i seconds">> resource_usage.txt
    echo "CPU usage: $(grep 'cpu ' /proc/stat | awk '{usage=($2+$4)*100/($2+$4+$5)} END {print usage "%"}')">> resource_usage.txt
    echo "RAM usage: $(free | grep Mem | awk '{print $3/$2 * 100.0}')%">> resource_usage.txt
    sleep 2
done