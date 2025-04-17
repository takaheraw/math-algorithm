# Bellman-Ford algorithm for Single Source Shortest Path with negative edges

def bellman_ford(num_vertices, edges, source)
  # Initialize distances from source to all vertices as infinite
  distances = Array.new(num_vertices, Float::INFINITY)
  distances[source] = 0

  # Relax all edges |V| - 1 times
  (num_vertices - 1).times do
    edges.each do |u, v, weight|
      if distances[u] != Float::INFINITY && distances[u] + weight < distances[v]
        distances[v] = distances[u] + weight
      end
    end
  end

  # Check for negative-weight cycles
  edges.each do |u, v, weight|
    if distances[u] != Float::INFINITY && distances[u] + weight < distances[v]
      return "NEGATIVE CYCLE"
    end
  end

  # Return the distances
  distances.map { |d| d == Float::INFINITY ? "INF" : d }
end

# Read input
v, e, r = gets.split.map(&:to_i)
edges = []

e.times do
  s, t, d = gets.split.map(&:to_i)
  edges << [s, t, d]
end

# Compute shortest paths
result = bellman_ford(v, edges, r)

# Print result
if result.is_a?(String)
  puts result
else
  result.each { |distance| puts distance }
end
