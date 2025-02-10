n = gets.to_i

# グラフの隣接リストを構築する
graph = Array.new(n + 1) { [] }
n.times do
  input = gets.split.map(&:to_i)
  u = input[0]
  k = input[1]
  graph[u] = input[2..-1]
end

# BFSの実装
def bfs(graph, start)
  distances = Array.new(graph.size, -1) # 初期値は全て-1
  queue = []

  distances[start] = 0
  queue << start

  until queue.empty?
    current = queue.shift

    graph[current].each do |neighbor|
      next if distances[neighbor] != -1 # 既に訪問済み

      distances[neighbor] = distances[current] + 1
      queue << neighbor
    end
  end

  distances
end

# 頂点1からの最短距離を計算する
distances = bfs(graph, 1)

# 結果を出力する
(1..n).each do |i|
  puts "#{i} #{distances[i]}"
end
