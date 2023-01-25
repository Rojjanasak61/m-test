#!/bin/bash

python3 t.py &  # รันโปรแกรม python ใน background
pid=$!  # เก็บ pid ของโปรแกรม

# เริ่มตั้งแต่เวลา 0 ถึง 10 วินาที
for i in {0..10}; do
    echo "Time: $i seconds"
    echo "CPU usage: $(grep 'cpu ' /proc/stat | awk '{usage=($2+$4)*100/($2+$4+$5)} END {print usage "%"}')"
    echo "RAM usage: $(free | grep Mem | awk '{print $3/$2 * 100.0}')%"
    sleep 1
done

kill $pid  # ปิดโปรแกรม python
