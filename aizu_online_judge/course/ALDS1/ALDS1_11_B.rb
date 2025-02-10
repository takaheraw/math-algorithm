n = gets.to_i

graph = Array.new(n + 1) { [] }
n.times do
  input = gets.split.map(&:to_i)
  u = input[0]
  k = input[1]
  graph[u] = input[2..]
end

time = 0
discovered = Array.new(n + 1, 0)
finished = Array.new(n + 1, 0)
visited = Array.new(n + 1, false)

def dfs(vertex, graph, visited, discovered, finished, time)
  visited[vertex] = true
  time += 1
  discovered[vertex] = time

  graph[vertex].each do |neighbor|
    next if visited[neighbor]
    time = dfs(neighbor, graph, visited, discovered, finished, time)
  end

  time += 1
  finished[vertex] = time
  time
end

(1..n).each do |i|
  time = dfs(i, graph, visited, discovered, finished, time) unless visited[i]
end

(1..n).each do |i|
  puts "#{i} #{discovered[i]} #{finished[i]}"
end
