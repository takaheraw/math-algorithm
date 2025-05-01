# 二部グラフの最大マッチングを求める（Ford-Fulkersonアルゴリズム）

class BipartiteMatching
  def initialize(num_x, num_y)
    @num_x = num_x
    @num_y = num_y
    @graph = Array.new(num_x) { [] }
    @matched = Array.new(num_y, -1)  # Y側の頂点がマッチしているX側の頂点を記録
  end

  # X側の頂点xとY側の頂点yの間に辺を追加
  def add_edge(x, y)
    @graph[x] << y
  end

  # 増加パスを見つける深さ優先探索
  def dfs(v, visited)
    @graph[v].each do |u|
      next if visited[u]
      visited[u] = true
      
      # まだマッチングされていないか、マッチング先の頂点が他のマッチングを見つけられる場合
      if @matched[u] == -1 || dfs(@matched[u], visited)
        @matched[u] = v
        return true
      end
    end
    false
  end

  # 最大マッチングのサイズを求める
  def max_matching
    matching_count = 0
    
    (0...@num_x).each do |v|
      # 各頂点から増加パスを探索
      visited = Array.new(@num_y, false)
      matching_count += 1 if dfs(v, visited)
    end
    
    matching_count
  end
end

# 入力の読み込み
nx, ny, m = gets.split.map(&:to_i)
matcher = BipartiteMatching.new(nx, ny)

m.times do
  x, y = gets.split.map(&:to_i)
  matcher.add_edge(x, y)
end

# 最大マッチングを計算して出力
puts matcher.max_matching
