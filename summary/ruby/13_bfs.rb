def breadth_first_search(graph, start_vertex)
  queue = [start_vertex]
  visited = {start_vertex => true}
  order_of_visit = []

  while queue.any?
    current_vertex = queue.shift
    order_of_visit << current_vertex

    graph[current_vertex].each do |neighbor|
      unless visited[neighbor]
        queue.push(neighbor)
        visited[neighbor] = true
      end
    end
  end

  order_of_visit
end

# Example usage:
graph = {
  'A' => ['B', 'C'],
  'B' => ['A', 'D', 'E'],
  'C' => ['A', 'F'],
  'D' => ['B'],
  'E' => ['B', 'F'],
  'F' => ['C', 'E']
}
puts breadth_first_search(graph, 'A').inspect
