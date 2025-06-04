def solve_chinese_postman
  # 入力を読み取る
  v, e = gets.split.map(&:to_i)
  
  # グラフを隣接リスト形式で構築
  graph = Array.new(v) { [] }
  total_weight = 0
  
  e.times do
    s, t, d = gets.split.map(&:to_i)
    graph[s] << [t, d]
    graph[t] << [s, d]
    total_weight += d
  end
  
  # 各頂点の次数を計算
  degrees = Array.new(v, 0)
  v.times do |i|
    degrees[i] = graph[i].size
  end
  
  # 次数が奇数の頂点を見つける
  odd_vertices = []
  v.times do |i|
    odd_vertices << i if degrees[i].odd?
  end
  
  # すべての頂点の次数が偶数の場合、すべての辺の重みの合計が答え
  if odd_vertices.empty?
    puts total_weight
    return
  end
  
  # 全ペア最短距離を計算（Floyd-Warshall法）
  dist = Array.new(v) { Array.new(v, Float::INFINITY) }
  
  # 初期化
  v.times do |i|
    dist[i][i] = 0
    graph[i].each do |neighbor, weight|
      dist[i][neighbor] = [dist[i][neighbor], weight].min
    end
  end
  
  # Floyd-Warshall
  v.times do |k|
    v.times do |i|
      v.times do |j|
        if dist[i][k] + dist[k][j] < dist[i][j]
          dist[i][j] = dist[i][k] + dist[k][j]
        end
      end
    end
  end
  
  # 奇数次数頂点間の最小重み完全マッチングを求める
  odd_count = odd_vertices.size
  min_matching_cost = find_min_matching(odd_vertices, dist)
  
  puts total_weight + min_matching_cost
end

def find_min_matching(odd_vertices, dist)
  n = odd_vertices.size
  return 0 if n == 0
  
  # 動的プログラミングで最小重み完全マッチングを求める
  # dp[mask] = マスクで表される頂点集合の最小マッチングコスト
  dp = Array.new(1 << n, Float::INFINITY)
  dp[0] = 0
  
  (1 << n).times do |mask|
    next if dp[mask] == Float::INFINITY
    
    # マスクで表される集合で、まだマッチングされていない最初の頂点を見つける
    first = -1
    n.times do |i|
      if (mask & (1 << i)) == 0
        first = i
        break
      end
    end
    
    next if first == -1
    
    # firstとペアにする頂点を選ぶ
    (first + 1).upto(n - 1) do |second|
      next if (mask & (1 << second)) != 0
      
      new_mask = mask | (1 << first) | (1 << second)
      cost = dist[odd_vertices[first]][odd_vertices[second]]
      dp[new_mask] = [dp[new_mask], dp[mask] + cost].min
    end
  end
  
  dp[(1 << n) - 1]
end

solve_chinese_postman
