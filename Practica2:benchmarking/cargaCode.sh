#!/bin/bash
	

# Definir el arreglo carga
#carga=(30000 60000 90000 120000)
#carga= 30000 
# Bucle para ejecutar sysbench cpu con diferentes cargas 
	#for carga_valor in "${carga[@]}"; do
	for i in {1..15}; do
       # sysbench cpu --cpu-max-prime="$carga_valor" --threads=3 --time=0 --events="$carga_valor" run >> CARGA.txt
       sysbench cpu --cpu-max-prime=30000 --threads=1 --time=0 --events=30000 run >> CARGA.txt
        sleep 2
    done
   # echo "Ejecución 30000 completa" >> CPU.txt
    pkill -f code.sh
#done
#acabar la monitorizacion
  # Detener el script code.sh que ejecuta top
    


	
