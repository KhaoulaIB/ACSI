#!/bin/bash

for i in {1..1440}; do
    timestamp=$(date +"%Y/%m/%d %H:%M:%S")
    echo -n "$timestamp, " >> vmstat.txt
    vmstat -n 1 1 | awk 'NR>2 {print $4, $5, $6}' >> vmstat.txt
    sleep 5
done
python3 - <<EOF
import csv


# Abre el archivo de entrada en modo de lectura
with open('vmstat.txt', 'r') as infile:
    # Lee las líneas del archivo
    lines = infile.readlines()

# Procesa las líneas para eliminar comas en la columna de Timestamp
processed_lines = [line.replace(',', '') for line in lines]

# Abre un archivo CSV para escribir los datos
with open('vmstat.csv', 'w', newline='') as outfile:
    # Crea un escritor CSV con separador ;
    writer = csv.writer(outfile, delimiter=';')
    
    # Escribe la cabecera del CSV
    writer.writerow(['Timestamp', 'Capacidad disponible', 'Capacidad utilizada', '% Memoria utilizada'])
    
    # Itera sobre las líneas procesadas
    for line in processed_lines:
        # Divide la línea en columnas
        columns = line.strip().split()
        
        # Escribe las columnas en el archivo CSV
        writer.writerow(columns)

print("Archivo CSV creado exitosamente.")


EOF

