# LCA (Lowest Common Ancestor) の実装
# 深さ優先探索でノードの深さと親を記録し、その後LCAを求める

# 木構造を読み込む
n = gets.to_i
tree = Array.new(n) { [] }

n.times do |i|
  input = gets.split.map(&:to_i)
  k = input[0]
  children = input[1, k]
  
  children.each do |child|
    tree[i] << child  # 親から子への辺を追加
  end
end

# 各ノードの親と深さを計算する
parent = Array.new(n, -1)
depth = Array.new(n, 0)

def dfs(node, par, d, tree, parent, depth)
  parent[node] = par
  depth[node] = d
  
  tree[node].each do |child|
    dfs(child, node, d + 1, tree, parent, depth)
  end
end

# ルートノード0から探索開始
dfs(0, -1, 0, tree, parent, depth)

# LCAを求める関数
def find_lca(u, v, parent, depth)
  # uとvの深さが同じになるまで、深い方をさかのぼる
  if depth[u] > depth[v]
    u, v = v, u
  end
  
  while depth[v] > depth[u]
    v = parent[v]
  end
  
  # uとvが同じノードになるまで、両方を同時にさかのぼる
  while u != v
    u = parent[u]
    v = parent[v]
  end
  
  return u
end

# クエリを処理
q = gets.to_i
q.times do
  u, v = gets.split.map(&:to_i)
  lca = find_lca(u, v, parent, depth)
  puts lca
end
