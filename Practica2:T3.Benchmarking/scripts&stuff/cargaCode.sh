#!/bin/bash
	

# Definir el arreglo carga
#carga=(6 5 4 3 2 1)

#carga= 30000 
# Bucle para ejecutar sysbench cpu con diferentes cargas 
	#for carga_valor in "${carga[@]}"; do
	for i in {1..10}; do
       sysbench cpu --cpu-max-prime=200000 --threads=2 --time=0 --events=200000 run >> CARGAthreads2.txt
       
       
        sleep 2
    done
   #echo "Ejecución $i threads completa" >> CPU.txt
  #   echo "Ejecución $i threads completa" >> vmstat.txt
    
#done
	pkill -f code.sh
#acabar la monitorizacion
  # Detener el script code.sh que ejecuta top
    


	
