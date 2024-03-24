#!/bin/bash
python3 - <<EOF
import pandas as pd

def main():
   
    CPU_id = []

    memTotal = 10946424     
    free_mem = []


    with open('CPU.txt', 'r') as fichero:
        for i, linea in enumerate(fichero):
            if i % 2 == 0:  # Si el índice es par, procesar datos de CPU
              
                CPU_id.append(round(100 - float(linea[35:41].replace(',', '.')), 1))
            else:  # Si el índice es impar, procesar datos de memoria
               
                free_mem.append((memTotal-(float(linea[28:35].replace(',', '.')))*1048)*100/memTotal)
         

    # Crear DataFrame para datos de CPU
    cpu_data = {'% CPU (global)': CPU_id}
    df_cpu = pd.DataFrame(cpu_data)

    # Crear DataFrame para datos de memoria
    memory_data = {'%Mem': free_mem}
    df_memory = pd.DataFrame(memory_data)

    # Escribir los datos en archivos CSV
    df_cpu.to_csv('90kcpuprime.csv', sep=';', index=False)
    df_memory.to_csv('90Kmemprime.csv', sep=';', index=False)

if __name__ == '__main__':
    main()
EOF

