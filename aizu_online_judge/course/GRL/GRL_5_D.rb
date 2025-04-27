class Node
  attr_accessor :parent, :children
  
  def initialize
    @parent = nil
    @children = []
  end
end

n = gets.to_i
nodes = Array.new(n) { Node.new }

# 木の構造を読み込む
n.times do |i|
  input = gets.split.map(&:to_i)
  k = input[0]
  
  k.times do |j|
    child_id = input[j + 1]
    nodes[i].children << child_id
    nodes[child_id].parent = i
  end
end

# 各ノードから根までのパスを格納
paths = Array.new(n)
n.times do |i|
  path = []
  current = i
  
  while current != nil
    path.unshift(current)
    current = nodes[current].parent
  end
  
  paths[i] = path
end

# エッジの重みを管理
weights = {}
n.times do |i|
  parent = nodes[i].parent
  if parent != nil
    weights[[parent, i]] = 0
  end
end

# クエリの処理
q = gets.to_i

q.times do
  query = gets.split.map(&:to_i)
  type = query[0]
  
  if type == 0
    # add(v, w): vとその親を結ぶエッジに重み w を追加
    v = query[1]
    w = query[2]
    parent = nodes[v].parent
    weights[[parent, v]] += w
  else
    # getSum(u): 根からノード u までのすべてのエッジの重みの合計を報告
    u = query[1]
    path = paths[u]
    sum = 0
    
    (1...path.length).each do |i|
      parent = path[i-1]
      child = path[i]
      sum += weights[[parent, child]]
    end
    
    puts sum
  end
end
