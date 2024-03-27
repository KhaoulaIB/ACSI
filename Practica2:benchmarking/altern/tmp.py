import re
import csv

def main():
    # Abrir el archivo de entrada
    with open('CARGA.txt', 'r') as file:
        data = file.read()

    # Encontrar todos los valores de events per second y total time usando expresiones regulares
    events_per_second = re.findall(r'events per second:\s+([\d.]+)', data)
    total_times = re.findall(r'total time:\s+([\d.]+)s', data)

    # Escribir los valores en archivos CSV
    with open('events_per_second.csv', 'w', newline='') as events_csvfile:
        writer = csv.writer(events_csvfile)
        writer.writerow(['Events per Second'])
        for eps in events_per_second:
            writer.writerow([eps])

    with open('tiempoRespuesta.csv', 'w', newline='') as time_csvfile:
        writer = csv.writer(time_csvfile)
        writer.writerow(['Total Time (s)'])
        for time in total_times:
            writer.writerow([time])

if __name__ == '__main__':
    main()
