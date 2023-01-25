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
    printf "Run %d:\n" $i >> 01-mTest.txt
    printf "Execution time: %.9f seconds\n" $run_time >> 01-mTest.txt
    printf "Start CPU | User | Nice | System | Idle | Iowait | Irq | Softirq | Steal | Guest | Guest_nice\n%s\n" "$start_cpu" >> 01-mTest.txt
    printf "End CPU | User | Nice | System | Idle | Iowait | Irq | Softirq | Steal | Guest | Guest_nice\n%s\n" "$end_cpu" >> 01-mTest.txt
    printf "Start MEM \n%s\n" "$start_mem" >> 01-mTest.txt
    printf "End MEM \n%s\n" "$end_mem" >> 01-mTest.txt
done