# 木の高さを求めるプログラム

# 入力を読み込む
n = gets.to_i
edges = []
(n-1).times do
  s, t, w = gets.split.map(&:to_i)
  edges << [s, t, w]
end

# 隣接リストを作成
graph = Array.new(n) { [] }
edges.each do |s, t, w|
  graph[s] << [t, w]
  graph[t] << [s, w]
end

# 木の高さを計算する関数
def calculate_height(graph, n)
  heights = Array.new(n, 0)
  
  # 各ノードについて
  (0...n).each do |start_node|
    # BFSで最も遠い葉を見つける
    visited = Array.new(n, false)
    queue = [[start_node, 0]]  # [ノード, 距離]
    visited[start_node] = true
    max_distance = 0
    
    while !queue.empty?
      node, distance = queue.shift
      
      # 葉ノードかどうかを確認（接続が1つ以下ならば葉、ただし開始ノードは除く）
      is_leaf = (node != start_node && graph[node].size <= 1) || 
                (graph[node].size == 0) ||
                (node == start_node && graph[node].size == 0)
      
      if is_leaf
        max_distance = [max_distance, distance].max
      end
      
      graph[node].each do |next_node, weight|
        if !visited[next_node]
          visited[next_node] = true
          queue << [next_node, distance + weight]
        end
      end
    end
    
    heights[start_node] = max_distance
  end
  
  return heights
end

# 木の高さを計算
heights = calculate_height(graph, n)

# 結果を出力
heights.each do |height|
  puts height
end
