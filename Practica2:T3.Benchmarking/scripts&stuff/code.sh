#!/bin/bash

for i in {1..4000}; do
	#top -b -n 1 | grep -i# -E "Cpu\(s\)|MiB Mem" 
top -b -n 1 | grep -i  "Cpu(s)" >> CPU.txt & vmstat -n 1 1 | grep -v -e "--io--" -e "free" | awk '{print $4}' >> vmstat.txt
 
    sleep 2
done
