import pandas as pd
import matplotlib.pyplot as plt
import arff
# Leer el archivo .arff y cargarlo en un DataFrame
def load_arff(file_path):
    with open(file_path, 'r') as f:
        arff_data = arff.load(f)
    return pd.DataFrame(arff_data['data'], columns=[attr[0] for attr in arff_data['attributes']])

#file_path = 'processtimeQueueTime.arff' 
file_path = '3clasesManhatten.arff' 

# Cargar datos
data = load_arff(file_path)

centroids = {
    'cluster0': [0.0001, 0.0003],
    'cluster1': [0.0001, 0.0148],
    'cluster2': [0.0001, 0.0015]    
}

# Nombres de los atributos
x_attr = 'sendtime'
y_attr = 'queuetime'

# Colores para cada cluster
# Colores para cada cluster
colors = {'cluster0': 'green', 'cluster1': 'blue', 'cluster2': 'red' }
colors2 = {'cluster0': 'blue', 'cluster1': 'red', 'cluster2': 'green' }

# Crear la figura
plt.figure(figsize=(10, 6))
for cluster in centroids.keys():
    cluster_data = data[data['Cluster'] == cluster]
    plt.scatter(cluster_data[x_attr], cluster_data[y_attr], c=colors[cluster], label=f'{cluster}')

# Graficar cada centroid
for cluster, (x, y) in centroids.items():
    plt.scatter(x, y, label=f'Centroide {cluster}', s=200, marker='x', c=colors2[cluster], linewidth=2)
plt.xlabel(x_attr)
plt.ylabel(y_attr)
plt.title(f' {x_attr} vs {y_attr}')
plt.legend()
plt.grid(True)

plt.savefig('Manhatten3-QT-ST.png')


