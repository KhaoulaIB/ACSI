import re
import csv

def main():
    # Abrir el archivo de entrada
    with open('CARGA.txt', 'r') as file:
        data = file.read()

    # Encontrar todos los valores de events per second usando expresiones regulares
    events_per_second = re.findall(r'events per second:\s+([\d.]+)', data)

    # Escribir los valores en un archivo CSV
    with open('salida.csv', 'w', newline='') as csvfile:
        writer = csv.writer(csvfile)
        writer.writerow(['Events per Second'])
        for eps in events_per_second:
            writer.writerow([eps])

if __name__ == '__main__':
    main()

