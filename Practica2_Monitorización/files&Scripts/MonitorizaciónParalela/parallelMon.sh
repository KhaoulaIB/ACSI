#!/bin/bash

	bash infoG.sh & bash GetMemoryInfo.sh

#programa para combinar la información de los dos ficheros .csv de monitorizacionMEM.csv y monitorizacionCPU.csv

python3 - <<EOF
import pandas as pd


# Especificar el delimitador al cargar los datos de los archivos CSV
df_cpu = pd.read_csv("monitorizacionCPU.csv", delimiter=';')
df_mem = pd.read_csv("monitorizacionMEM.csv", delimiter=';')

# Seleccionar las columnas requeridas de cada DataFrame
df_cpu_selected = df_cpu[['Timestamp', '% CPU (global)']]
df_mem_selected = df_mem[['Capacidad utilizada', '% Memoria utilizada']]

# Cambiar los nombres de las columnas
df_cpu_selected = df_cpu_selected.rename(columns={'% CPU (global)': '% global CPU'})
df_mem_selected = df_mem_selected.rename(columns={ 'Capacidad utilizada': 'Capacidad de memoria utilizada'})

# Fusionar los DataFrames
df_merged = pd.concat([df_cpu_selected, df_mem_selected], axis=1)

# Guardar el DataFrame fusionado en un nuevo archivo CSV
df_merged.to_csv("salida.csv", sep=';', index=False)

print("Archivo 'salida.csv' generado exitosamente.")


EOF
 
