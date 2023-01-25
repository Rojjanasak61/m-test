#!/bin/bash

for i in {1..10}
do
    start_time=$(date +%s.%N)
    start_cpu=$(grep 'cpu' /proc/stat | awk '{usage=($2+$4)*100/($2+$4+$5)} END                                                                                                              {print usage}')
    start_mem=$(free -m | awk '/^Mem:/{print $3}')

    python3 app.py $1
    stress --cpu 8 --timeout 10s --cpu-load 40-60

    end_time=$(date +%s.%N)
    end_cpu=$(grep 'cpu' /proc/stat | awk '{usage=($2+$4)*100/($2+$4+$5)} END                                                                                                              {print usage}')
    end_mem=$(free -m | awk '/^Mem:/{print $3}')
    run_time=$(echo "$end_time - $start_time" | bc)
    run_cpu=$(echo "$end_cpu - $start_cpu" | bc)
    run_mem=$(echo "$end_mem - $start_mem" | bc)
    echo "Run $i:" >> result.txt
    echo "Execution time: $run_time seconds" >> result.txt
    echo "CPU usage: $run_cpu %" >> result.txt
    echo "Memory usage: $run_mem MB" >> result.txt
done