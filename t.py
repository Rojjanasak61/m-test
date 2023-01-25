import psutil
import time
start_time = time.time()

while True:
    cpu_percent = psutil.cpu_percent(interval=1, percpu=True)
    for i in range(len(cpu_percent)):
        if cpu_percent[i] < 60 or cpu_percent[i] > 80:
            time.sleep(0.1)
    if time.time() - start_time > 10:  # เช็คเวลาว่าครบ 10 วินาทีหรือยัง
        break  # หยุดการทำงานของโปรแกรม
    time.sleep(1)
