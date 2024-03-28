#!/bin/bash

for i in {1..4000}; do
top -b -n 1 | grep -i -E "Cpu\(s\)|MiB Mem" 
 
    sleep 2
done
