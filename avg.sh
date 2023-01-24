#!/bin/bash
for i in {1..10}
do
    start_time=$(date +%s.%N)

    python3 app.py &
    pid=$!

    echo "Resource usage of app.py: " >> results.txt
    echo "PID USER PR NI VIRT RES SHR S %CPU TIME+ COMMAND" >> results.txt
    top -b -n1 -p $pid | grep $pid >> results.txt

    end_time=$(date +%s.%N)
    run_time=$(echo "$end_time - $start_time" | bc)
    execution_time+=($run_time)
    echo "execution time $i: $run_time seconds" >> results.txt
done