function kMeans(data: number[][], k: number): Record<string, number[][]> {
    // Initialize centroids by randomly selecting 'k' points from the data
    let centroids = data.sort(() => 0.5 - Math.random()).slice(0, k);
    let clusters: Record<string, number[][]>;

    while (true) {
        // Assign each point to the closest centroid
        clusters = data.reduce((acc: Record<string, number[][]>, point) => {
            const closestCentroid = centroids.reduce((prev, curr) => 
                (euclideanDistance(point, prev) < euclideanDistance(point, curr) ? prev : curr), centroids[0]);
            const key = JSON.stringify(closestCentroid);
            if (!acc[key]) {
                acc[key] = [];
            }
            acc[key].push(point);
            return acc;
        }, {});

        // Recalculate centroids
        const newCentroids = Object.values(clusters).map(cluster => 
            cluster.reduce((acc, point) => acc.map((sum, idx) => sum + point[idx]), new Array(cluster[0].length).fill(0))
                .map(sum => sum / cluster.length)
        );

        // Check for convergence
        if (JSON.stringify(newCentroids) === JSON.stringify(centroids)) {
            break;
        }

        centroids = newCentroids;
    }

    return clusters;
}

function euclideanDistance(point1: number[], point2: number[]): number {
    return Math.sqrt(point1.reduce((sum, value, idx) => sum + (value - point2[idx]) ** 2, 0));
}

// Example usage:
const data = [[1, 2], [1, 4], [1, 0], [10, 2], [10, 4], [10, 0]];
const k = 2;
const clusters = kMeans(data, k);
Object.entries(clusters).forEach(([centroid, points], index) => {
    console.log(`Cluster ${index + 1}: Centroid -> ${centroid}, Points -> ${JSON.stringify(points)}`);
});
