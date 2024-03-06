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
        # Eliminar comas y guardar el contenido en un nuevo archivo temporal
        with open('vtp_temp.txt', 'w') as temp_file:
            for linea in fichero:
                linea_sin_comas = linea.replace(',', '')  # Elimina las comas
                temp_file.write(linea_sin_comas)

    # Continuar con la lectura del archivo temporal sin comas
    with open('vtp_temp.txt', 'r') as fichero:
        for linea in fichero:
            parts = linea.strip().split(' ')
            timestamp.append(parts[0])  # Guarda el timestamp
            free_memory = int(parts[1])  # Guarda la memoria libre
            mem.append(free_memory)
            memused.append(Memtotal - free_memory)  # Calcula la memoria utilizada
            mempercent.append(((Memtotal - free_memory) * 100) / Memtotal)  # Calcula el porcentaje de memoria utilizada

    # Ajuste de la columna Capacidad utilizada
    memused_adjusted = [mem_used - 100 for mem_used in memused]

    data = {
        'Timestamp': timestamp,
        'Capacidad disponible': mem,
        'Capacidad utilizada': memused_adjusted,  # Utiliza la memoria ajustada
        '% Memoria utilizada': mempercent
    }

    df = pd.DataFrame(data, columns=['Timestamp', 'Capacidad disponible', 'Capacidad utilizada', '% Memoria utilizada'])

    df.to_csv('monitorizacionMEM.csv', sep=';', index=False)


if __name__ == '__main__':
    main()


EOF

