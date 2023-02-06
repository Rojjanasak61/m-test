#!/bin/bash
filename = "01-mTest"
for i in {1..10}
do
    start_time=$(date +%s.%N)
    printf "Run %d:\n" $i >> $filename.txt

    ./app.py "$1" & ./cpu_ram.sh $filename

    end_time=$(date +%s.%N)
    run_time=$(echo "$end_time - $start_time" | bc)
    printf "Execution time: %.9f seconds\n" $run_time >> $filename.txt
done