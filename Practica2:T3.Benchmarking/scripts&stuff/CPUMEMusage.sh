#!/bin/bash
python3 - <<EOF
import pandas as pd

def main():
   
    CPU_id = []

    memTotal = 11113568     
   
    free_mem = []


    with open('CPU.txt', 'r') as fichero:
        for linea in fichero:
            CPU_id.append(round(100 - float(linea[35:41].replace(',', '.')), 1))
           
    with open('vmstat.txt', 'r') as fichero:
        for linea in fichero:
            free_mem.append((memTotal-(float(linea.replace(',', '.'))))*100/memTotal)

    # Crear DataFrame para datos de CPU
    cpu_data = {'% CPU (global)': CPU_id}
    df_cpu = pd.DataFrame(cpu_data)

    # Crear DataFrame para datos de memoria
    memory_data = {'%Mem': free_mem}
    df_memory = pd.DataFrame(memory_data)

    # Escribir los datos en archivos CSV
    df_cpu.to_csv('200kcpu.csv', sep=';', index=False)
    df_memory.to_csv('120kmem.csv', sep=';', index=False)

if __name__ == '__main__':
    main()
EOF

