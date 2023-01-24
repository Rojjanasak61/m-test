#!/bin/bash
start_time=$(date +%s.%N)

python3 app.py $1&
pid=$!

echo "Resource usage of app.py: " >> results.txt
echo "PID USER PR NI VIRT RES SHR S %CPU TIME+ COMMAND" >> results.txt
top -b -n1 -p $pid | grep $pid >> results.txt

end_time=$(date +%s.%N)
run_time=$(echo "$end_time - $start_time" | bc)
echo "execution time $i: $run_time seconds" >> results.txt
