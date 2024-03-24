#!/bin/bash

for i in {1..1200}; do
	top -b -n 1 | grep -i -E "Cpu\(s\)|MiB Mem" >> CPU.txt

    sleep 2
done
