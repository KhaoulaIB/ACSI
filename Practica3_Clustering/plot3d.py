import pandas as pd
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import Axes3D  # Importar herramienta para gráficas 3D
import arff

def load_arff(file_path):
    with open(file_path, 'r') as f:
        arff_data = arff.load(f)
    return pd.DataFrame(arff_data['data'], columns=[attr[0] for attr in arff_data['attributes']])

# Archivo .arff de ejemplo
file_path = 'grafica1.arff'  # Reemplaza esto con la ruta a tu archivo .arff

# Cargar datos
data = load_arff(file_path)

# Coordenadas de los centroides (extraídas del resultado de WEKA)
centroids = {
    'cluster0': [0.0024, 0.0013, 0.0001],
    'cluster1': [0.0041, 0.0185, 0.0001],
    'cluster2': [0.0021, 0.0026, 0.0001],

}

# Nombres de los atributos
x_attr = 'processtime'
y_attr = 'queuetime'
z_attr = 'sendtime'

# Colores para cada cluster
colors = {'cluster0': 'red', 'cluster1': 'green', 'cluster2': 'blue'}
colors2 = {'cluster0': 'green', 'cluster1': 'red', 'cluster2': 'blue'}

# Crear la figura y el eje 3D
fig = plt.figure(figsize=(14, 8))
ax = fig.add_subplot(111, projection='3d')
for cluster in centroids.keys():
    cluster_data = data[data['Cluster'] == cluster]
    ax.scatter(cluster_data[x_attr], cluster_data[y_attr], cluster_data[z_attr], c=colors2[cluster], label=f'{cluster}')

# Graficar cada centroid
for cluster, (x, y, z) in centroids.items():
    ax.scatter(x, y, z, label=f'Centroide {cluster}', s=200, marker='x', c='black')  # Cambiar color a negro

# Etiquetas y título
ax.set_xlabel(x_attr)
ax.set_ylabel(y_attr)
ax.set_zlabel(z_attr)
ax.set_title(f'Centroides en {x_attr}, {y_attr} y {z_attr}')
ax.legend()

# Guardar la gráfica como imagen
plt.savefig('3d3clases.png')

