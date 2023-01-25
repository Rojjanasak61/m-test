#!/bin/bash

for i in {1..10}
do
    start_time=$(date +%s.%N)
    start_cpu=$(grep 'cpu' /proc/stat)
    start_mem=$(free -m)

    python3 app.py $1

    end_time=$(date +%s.%N)
    end_cpu=$(grep 'cpu' /proc/stat)
    end_mem=$(free -m)
    run_time=$(echo "$end_time - $start_time" | bc)
    echo "Run $i:" >> result.txt
    echo "Execution time: $run_time seconds" >> result.txt
    echo "Start CPU | User | Nice | System | Idle | Iowait | Irq | Softirq | Steal | Guest | Guest_nice \n $start_cpu" >> result.txt
    echo "End CPU   | User | Nice | System | Idle | Iowait | Irq | Softirq | Steal | Guest | Guest_nice \n $end_cpu" >> result.txt
    echo "Start MEM | total | used | free | shared \n $start_mem" >> result.txt
    echo "End MEM   | total | used | free | shared \n $end_mem" >> result.txt
done