function breadthFirstSearch(graph: Record<string, string[]>, startVertex: string): string[] {
    const queue: string[] = [startVertex];
    const visited: Record<string, boolean> = { [startVertex]: true };
    const orderOfVisit: string[] = [];

    while (queue.length > 0) {
        const currentVertex = queue.shift()!;
        orderOfVisit.push(currentVertex);

        graph[currentVertex].forEach(neighbor => {
            if (!visited[neighbor]) {
                queue.push(neighbor);
                visited[neighbor] = true;
            }
        });
    }

    return orderOfVisit;
}

// Example usage:
const graph: Record<string, string[]> = {
    'A': ['B', 'C'],
    'B': ['A', 'D', 'E'],
    'C': ['A', 'F'],
    'D': ['B'],
    'E': ['B', 'F'],
    'F': ['C', 'E']
};
console.log(breadthFirstSearch(graph, 'A'));
