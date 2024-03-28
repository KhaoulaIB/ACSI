#!/bin/bash
	

# Definir el arreglo carga
carga=( 30000 60000 90000 120000)

#carga= 30000 
# Bucle para ejecutar sysbench cpu con diferentes cargas 
	for carga_valor in "${carga[@]}"; do
	for i in {1..15}; do
       sysbench cpu --cpu-max-prime="$carga_valor" --threads=2 --time=0 --events="$carga_valor" run >> CARGA.txt
       
        sleep 2
    done
   echo "Ejecución $i completa" >> CPU.txt
    
done
	pkill -f code.sh
#acabar la monitorizacion
  # Detener el script code.sh que ejecuta top
    


	
