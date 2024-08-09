def breadth_first_search(graph, start_vertex):
    queue = [start_vertex]
    visited = {start_vertex: True}
    order_of_visit = []

    while queue:
        current_vertex = queue.pop(0)
        order_of_visit.append(current_vertex)

        for neighbor in graph[current_vertex]:
            if neighbor not in visited:
                queue.append(neighbor)
                visited[neighbor] = True

    return order_of_visit

# Example usage:
graph = {
    'A': ['B', 'C'],
    'B': ['A', 'D', 'E'],
    'C': ['A', 'F'],
    'D': ['B'],
    'E': ['B', 'F'],
    'F': ['C', 'E']
}
print(breadth_first_search(graph, 'A'))
