# Range Query on a Tree II

# ノード構造の定義
class Node
  attr_accessor :id, :parent, :children, :weight
  
  def initialize(id)
    @id = id
    @parent = nil
    @children = []
    @weight = 0
  end
end

# 入力の読み取り
n = gets.to_i

# ノードの初期化
nodes = Array.new(n) { |i| Node.new(i) }

# 子ノード情報の読み取りと親子関係の設定
n.times do |i|
  info = gets.split.map(&:to_i)
  k = info[0]
  
  k.times do |j|
    child_id = info[j + 1]
    nodes[i].children << child_id
    nodes[child_id].parent = i
  end
end

# クエリ数の読み取り
q = gets.to_i

# 各クエリの処理
q.times do
  query = gets.split.map(&:to_i)
  type = query[0]
  
  if type == 0
    # add(v, w)操作: ルートからノードvまでの経路上の全エッジに重みwを加算
    v = query[1]
    w = query[2]
    
    # ノードvからルートまで辿りながら重みを加算
    current = v
    while nodes[current].parent != nil
      parent = nodes[current].parent
      nodes[current].weight += w
      current = parent
    end
  else
    # getSum(u)操作: ルートからノードuまでの経路上の全エッジの重みの合計を出力
    u = query[1]
    sum = 0
    
    # ノードuからルートまで辿りながら重みを合計
    current = u
    while nodes[current].parent != nil
      sum += nodes[current].weight
      current = nodes[current].parent
    end
    
    puts sum
  end
end
