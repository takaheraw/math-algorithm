#!/usr/bin/env ruby

# ダイクストラのアルゴリズムを実装
def dijkstra(graph, start)
  num_vertices = graph.length
  distances = Array.new(num_vertices, Float::INFINITY)
  distances[start] = 0
  visited = Array.new(num_vertices, false)
  
  num_vertices.times do
    # 未訪問の頂点の中で最短距離のものを選択
    u = -1
    (0...num_vertices).each do |i|
      if !visited[i] && (u == -1 || distances[i] < distances[u])
        u = i
      end
    end
    
    break if distances[u] == Float::INFINITY
    
    visited[u] = true
    
    # 隣接する頂点の距離を更新
    graph[u].each do |v, weight|
      if distances[u] + weight < distances[v]
        distances[v] = distances[u] + weight
      end
    end
  end
  
  distances
end

# 標準入力から一行ずつ読み込む
lines = []
while line = gets&.chomp
  break if line.empty?
  lines << line
end

# 入力がなければサンプル入力を使用
if lines.empty?
  lines = [
    "4 5 0",
    "0 1 1",
    "0 2 4",
    "1 2 2",
    "2 3 1",
    "1 3 5"
  ]
end

# 入力を解析
first_line = lines[0].split.map(&:to_i)
num_vertices = first_line[0]
num_edges = first_line[1]
source = first_line[2]

# グラフの初期化
graph = Array.new(num_vertices) { [] }

# エッジ情報を読み込む
(1..num_edges).each do |i|
  if i < lines.size
    s, t, d = lines[i].split.map(&:to_i)
    graph[s] ||= []
    graph[s] << [t, d]
  end
end

# ダイクストラのアルゴリズムを実行
results = dijkstra(graph, source)

# 結果を出力
results.each do |distance|
  if distance == Float::INFINITY
    puts "INF"
  else
    puts distance
  end
end
