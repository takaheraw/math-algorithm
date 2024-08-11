import numpy as np
from typing import List, Tuple

def k_means(data: List[List[float]], k: int, max_iterations: int = 100) -> Tuple[List[List[float]], List[List[int]]]:
    data = np.array(data)
    n_samples, n_features = data.shape
    
    # Randomly initialize centroids
    centroids = data[np.random.choice(n_samples, k, replace=False)]
    
    for _ in range(max_iterations):
        # Assign each point to the nearest centroid
        distances = np.sqrt(((data - centroids[:, np.newaxis])**2).sum(axis=2))
        labels = np.argmin(distances, axis=0)
        
        # Update centroids
        new_centroids = np.array([data[labels == i].mean(axis=0) for i in range(k)])
        
        # Check for convergence
        if np.all(centroids == new_centroids):
            break
        
        centroids = new_centroids
    
    # Get clusters
    clusters = [data[labels == i].tolist() for i in range(k)]
    
    return centroids.tolist(), clusters

# Example usage
if __name__ == "__main__":
    data = [[1, 2], [1, 4], [1, 0], [10, 2], [10, 4], [10, 0]]
    k = 2
    centroids, clusters = k_means(data, k)
    
    for i, (centroid, cluster) in enumerate(zip(centroids, clusters)):
        print(f"Cluster {i + 1}:")
        print(f"  Centroid: {centroid}")
        print(f"  Points: {cluster}")
