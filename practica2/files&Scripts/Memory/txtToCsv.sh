python3 - <<EOF
import csv

# Abre el archivo de entrada en modo de lectura
with open('vmstat.txt', 'r') as infile:
    # Lee las líneas del archivo
    lines = infile.readlines()

# Procesa las líneas para eliminar comas en la columna de Timestamp y dividir las otras columnas
	MemoriaTotal = 10946740
processed_lines = []
for line in lines:
    # Extrae los datos de la columna Timestamp
    timestamp = line[0:19].replace(',', '')  # Selecciona el rango deseado y elimina las comas
    # Las demás columnas se dividen utilizando el espacio como delimitador
    other_columns = line[20:].strip().split()
    processed_lines.append([timestamp] + other_columns)

# Abre un archivo CSV para escribir los datos
with open('vmstat.csv', 'w', newline='') as outfile:
    # Crea un escritor CSV con separador ;
    writer = csv.writer(outfile, delimiter=';')
    
    # Escribe la cabecera del CSV
    writer.writerow(['Timestamp', 'Capacidad disponible', 'Capacidad utilizada', '% Memoria utilizada'])
    
    # Escribe las líneas procesadas en el archivo CSV
    writer.writerows(processed_lines)

print("Archivo CSV creado exitosamente.")

EOF
