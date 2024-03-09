#!/bin/bash

for i in {1..1800}; do
    timestamp=$(date +"%Y/%m/%d %H:%M:%S")
    echo -n "$timestamp, " >> CPU.txt
    top -b -n 1 | grep -i "Cpu(s)" >> CPU.txt
    sleep 2
done

# Llamar al script de Python desde aquí
python3 - <<EOF
import pandas as pd


def main():
    timestamps = []
    CPUus = []
    CPUsy = []
    CPUid = []

    with open('CPU.txt', 'r') as fichero:
        for linea in fichero:
            
            # Agregar el timestamp a la lista de timestamps
            timestamps.append(linea[0:19].replace(',', '.'))

            # Obtener los valores de % CPU (global), % CPU (user) y % CPU (system) de las posiciones indicadas
            CPUus.append(float(linea[30:35].replace(',', '.')))
            CPUsy.append(float(linea[39:44].replace(',', '.')))
            CPUid.append(round(100 - float(linea[57:62].replace(',', '.')), 1))

    # Crear un DataFrame de pandas con los datos recopilados
    data = {'Timestamp': timestamps,
            '% CPU (global)': CPUid, '% CPU (user)': CPUus, '% CPU (system)': CPUsy}

    df = pd.DataFrame(data, columns=['Timestamp', '% CPU (global)', '% CPU (user)', '% CPU (system)'])

    # Escribir los datos en un nuevo archivo monitorizacionCPU.csv
    df.to_csv('monitorizacionCPU.csv', sep=';', index=False)

if __name__ == '__main__':
    main()
EOF

