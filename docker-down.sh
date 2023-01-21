#!/bin/bash

current_dir=$(pwd)
list_file=$(ls)

current_dir=$(pwd)
parentdir="$(dirname "$current_dir")"

check=0

echo $list_file


echo "starting .."

cd CVE-2021-22205
docker-compose down
cd ..

cd CVE-2021-28073
docker-compose down
cd ..

cd CVE-2021-28164
docker-compose down
cd ..

cd CVE-2021-42013
docker-compose down
cd ..

cd CVE-2021-42342
docker-compose down
cd ..

echo "success"