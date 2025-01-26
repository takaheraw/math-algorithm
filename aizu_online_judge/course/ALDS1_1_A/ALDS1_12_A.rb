def minimum_spanning_tree(n, adjacency_matrix)
  # プライム法を実装
  visited = Array.new(n, false)
  min_edge = Array.new(n, Float::INFINITY)
  min_edge[0] = 0
  total_weight = 0

  n.times do
    u = -1

    # 訪問されていない頂点の中から最小の重みを持つ頂点を選ぶ
    n.times do |i|
      if !visited[i] && (u == -1 || min_edge[i] < min_edge[u])
        u = i
      end
    end

    # 選んだ頂点を訪問済みにする
    visited[u] = true
    total_weight += min_edge[u]

    # 選んだ頂点から隣接する頂点の最小重みを更新
    n.times do |v|
      weight = adjacency_matrix[u][v]
      if weight != -1 && !visited[v] && weight < min_edge[v]
        min_edge[v] = weight
      end
    end
  end

  total_weight
end

# 入力の読み込み
n = gets.to_i
adjacency_matrix = []
n.times do
  adjacency_matrix << gets.split.map(&:to_i)
end

# MSTの総重量を計算して出力
puts minimum_spanning_tree(n, adjacency_matrix)
