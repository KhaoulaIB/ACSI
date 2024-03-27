#!/bin/bash
	

# Definir el arreglo carga
# Bucle para ejecutar sysbench cpu con diferentes cargas 
	#for carga_valor in "${carga[@]}"; do
	for i in {1..15}; do
       sysbench cpu --cpu-max-prime="$carga_valor" --threads=5 --time=0 --events=200000 run >> CARGA.txt
       
       
        sleep 2
    done
   #echo "Ejecución $i threads completa" >> CPU.txt
  #   echo "Ejecución $i threads completa" >> vmstat.txt
    
#done
	pkill -f code.sh
#acabar la monitorizacion
  # Detener el script code.sh que ejecuta top
    


	
