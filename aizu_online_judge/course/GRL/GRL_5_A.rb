# 木の直径を求めるプログラム
# 方法: 任意のノードから最も遠いノードを見つけ、そのノードから最も遠いノードまでの距離が直径

# グラフを表現するクラス
class Graph
  def initialize(n)
    @n = n
    @adj_list = Array.new(n) { [] }
  end

  # 無向グラフなので両方向にエッジを追加
  def add_edge(u, v, w)
    @adj_list[u] << [v, w]
    @adj_list[v] << [u, w]
  end

  # ノードsからの最長距離と最も遠いノードを見つける
  def bfs(s)
    # 距離の初期化（-1は未訪問を示す）
    distance = Array.new(@n, -1)
    distance[s] = 0
    
    # キューを使った幅優先探索
    queue = [s]
    while !queue.empty?
      u = queue.shift
      
      @adj_list[u].each do |v, w|
        if distance[v] == -1
          distance[v] = distance[u] + w
          queue << v
        end
      end
    end
    
    # 最も遠いノードとその距離を返す
    farthest_node = distance.each_with_index.max_by { |dist, _| dist }[1]
    [farthest_node, distance[farthest_node]]
  end

  # 木の直径を求める
  def find_diameter
    # 任意のノード（ここでは0）から最も遠いノードを見つける
    farthest_node, _ = bfs(0)
    
    # その最も遠いノードから再度探索して最長距離を求める
    _, diameter = bfs(farthest_node)
    
    diameter
  end
end

# 入力を読み込み
n = gets.to_i
tree = Graph.new(n)

(n - 1).times do
  s, t, w = gets.split.map(&:to_i)
  tree.add_edge(s, t, w)
end

# 木の直径を出力
puts tree.find_diameter
