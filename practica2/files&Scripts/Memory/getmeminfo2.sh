#!/bin/bash

for i in {1..2}; do
    timestamp=$(date +"%Y/%m/%d %H:%M:%S")
    echo -n "$timestamp, " >> vtp.txt
    vmstat -n 1 1 | awk 'NR>2 {print $4}' >> vtp.txt
    sleep 5
done
python3 - <<EOF
import pandas as pd


def main():
    Memtotal = 10946740
    timestamp = []
 
    mem = []
    memused = []
    mempercent = []
    with open('vtp.txt', 'r') as fichero:
        linea = fichero.readline()
        linea = fichero.readline()
        linea = fichero.readline()
        while (linea != ""):
            mem.append(int(linea))
            memused.append(int(total-int(linea)))
            mempercent.append(float(((total-int(linea))*100)/total))
            timestamp.append(time)
            time += seconds
            linea = fichero.readline()

    data = {'Timestamp': timestamp,
            'Capacidad disponible': mem, 'Capacidad utilizada': memused, '% Memoria utilizada': mempercent}

    df = pd.DataFrame(
        data, columns=['Timestamp', 'Capacidad disponible', 'Capacidad utilizada', '% Memoria utilizada'])

    df.to_csv('monitorizacionMEM.csv', sep=';', index=False)


if __name__ == '__main__':
    main()

EOF

