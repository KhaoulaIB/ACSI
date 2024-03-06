import pandas as pd

def main():
    # Lee el archivo de texto
    with open('vmstat.txt', 'r') as file:
        lines = file.readlines()

    # Divide las líneas en columnas
    data = [line.strip().split() for line in lines]

    # Separa los datos de timestamp
    timestamps = [row[0] for row in data]
    values = [row[1:] for row in data]

    # Convierte los datos en un DataFrame de pandas
    df = pd.DataFrame(values, columns=["Capacidad disponible", "Capacidad utilizada", "% Memoria utilizada"])

    # Agrega la columna de timestamps al DataFrame
    df.insert(0, "Timestamp", timestamps)

    # Guarda el DataFrame en un archivo CSV
    df.to_csv('vmstatDepurado.csv', sep=';', index=False)

if __name__ == '__main__':
    main()

