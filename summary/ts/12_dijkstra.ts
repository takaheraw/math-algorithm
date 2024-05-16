function dijkstra(graph: Record<string, Record<string, number>>, source: string): Record<string, number> {
    const distances: Record<string, number> = {};
    for (const key in graph) {
        distances[key] = Infinity;
    }
    distances[source] = 0;

    const priorityQueue: string[] = [source];

    while (priorityQueue.length > 0) {
        let currentVertex = priorityQueue.reduce((minVertex, vertex) => {
            return distances[vertex] < distances[minVertex] ? vertex : minVertex;
        }, priorityQueue[0]);

        priorityQueue.splice(priorityQueue.indexOf(currentVertex), 1);

        for (const neighbor in graph[currentVertex]) {
            const weight = graph[currentVertex][neighbor];
            const newDistance = distances[currentVertex] + weight;
            if (newDistance < distances[neighbor]) {
                distances[neighbor] = newDistance;
                if (!priorityQueue.includes(neighbor)) {
                    priorityQueue.push(neighbor);
                }
            }
        }
    }

    return distances;
}

// Example usage:
const graph: Record<string, Record<string, number>> = {
    'A': {'B': 1, 'C': 4},
    'B': {'A': 1, 'C': 2, 'D': 5},
    'C': {'A': 4, 'B': 2, 'D': 1},
    'D': {'B': 5, 'C': 1}
};
console.log(dijkstra(graph, 'A'));
