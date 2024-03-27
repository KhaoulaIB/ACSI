
import re

def main():
    # Abrir el archivo de entrada
    with open('CARGA.txt', 'r') as file:
        data = file.read()

    eventspSsecond = re.findall(r'events per second:\s+([\d.]+)', data)

    total_times = re.findall(r'total time:\s+([\d.]+)s', data)

    # Escribir los valores de events/s en un archivo de texto
    with open('events_per_second.txt', 'w') as events_file:
        for eps in eventspSsecond:
            events_file.write(eps + '\n')

    # Escribir los valores de total time en un archivo de texto
    with open('tiempoRespuesta.txt', 'w') as time_file:
        for time in total_times:
            time_file.write(time + '\n')

if __name__ == '__main__':
    main()
