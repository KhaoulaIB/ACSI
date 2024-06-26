#!/bin/bash

for i in {1..3600}; do
    timestamp=$(date +"%Y/%m/%d %H:%M:%S")
    echo -n "$timestamp, " >> vmstat.txt
    vmstat -n 1 1 | awk 'NR>2 {print $4, $5, $6}' >> vmstat.txt
    sleep 2
done


python3 - <<EOF
import pandas as pd


def main():
    Memtotal = 10946416
    timestamp = []
    mem = []
    memused = []
    mempercent = []
    with open('vmstat.txt', 'r') as fichero:
        for linea in fichero:
            timestamp.append(linea[:19])  # Los primeros 19 caracteres son para el timestamp
            free_memory = int(linea[20:28])  # Los siguientes 8 caracteres son para la memoria libre
            mem.append(free_memory)
            memused.append(Memtotal - free_memory)  # Calcula la memoria utilizada
            mempercent.append(((Memtotal - free_memory) * 100) / Memtotal)  # Calcula el porcentaje de memoria utilizada

 

    data = {
        'Timestamp': timestamp,
        'Capacidad disponible': mem,
        'Capacidad utilizada': memused,  # Utiliza la memoria ajustada
        '% Memoria utilizada': mempercent
    }

    df = pd.DataFrame(data, columns=['Timestamp', 'Capacidad disponible', 'Capacidad utilizada', '% Memoria utilizada'])

    df.to_csv('monitorizacionMEM.csv', sep=';', index=False)


EOF

