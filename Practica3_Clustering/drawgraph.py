import pandas as pd
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import Axes3D

# Cargar el archivo Excel
file_path = 'clustering_1.xlsx'
data = pd.read_excel(file_path)

# Nombres de las columnas
x_attr = 'ProcessTime'
y_attr = 'QueueTime'
z_attr = 'SendTime'

# Crear la figura y el eje 3D
fig = plt.figure(figsize=(10, 6))
ax = fig.add_subplot(111, projection='3d')

# Colores para cada columna
colors = {'ProcessTime': 'blue', 'QueueTime': 'green', 'SendTime': 'red'}

# Graficar los datos
for attr, color in colors.items():
    ax.scatter(data[x_attr], data[y_attr], data[z_attr], c=color, label=attr)

# Etiquetas y título
ax.set_xlabel(x_attr)
ax.set_ylabel(y_attr)
ax.set_zlabel(z_attr)
ax.set_title('Datos en 3D')
ax.legend()



# Mostrar la gráfica
plt.savefig('graficaInicial.png')

