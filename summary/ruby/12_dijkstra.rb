def dijkstra(graph, source)
  distances = Hash.new(Float::INFINITY)
  distances[source] = 0

  priority_queue = [source]
  
  while priority_queue.any?
    current_vertex = priority_queue.min_by { |vertex| distances[vertex] }
    priority_queue.delete(current_vertex)
    
    graph[current_vertex].each do |neighbor, weight|
      new_distance = distances[current_vertex] + weight
      if new_distance < distances[neighbor]
        distances[neighbor] = new_distance
        priority_queue.push(neighbor)
      end
    end
  end
  
  distances
end

# Example usage:
graph = {
  'A' => {'B' => 1, 'C' => 4},
  'B' => {'A' => 1, 'C' => 2, 'D' => 5},
  'C' => {'A' => 4, 'B' => 2, 'D' => 1},
  'D' => {'B' => 5, 'C' => 1}
}
puts dijkstra(graph, 'A')
