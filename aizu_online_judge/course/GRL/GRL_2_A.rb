# Union-Find データ構造
class UnionFind
  def initialize(n)
    @parent = Array.new(n) { |i| i }
    @rank = Array.new(n, 0)
  end

  # xの根を見つける
  def find(x)
    if @parent[x] != x
      @parent[x] = find(@parent[x])  # 経路圧縮
    end
    @parent[x]
  end

  # xとyの属する集合を併合
  def unite(x, y)
    root_x = find(x)
    root_y = find(y)
    return if root_x == root_y

    # ランクによる併合
    if @rank[root_x] < @rank[root_y]
      @parent[root_x] = root_y
    else
      @parent[root_y] = root_x
      @rank[root_x] += 1 if @rank[root_x] == @rank[root_y]
    end
  end

  # xとyが同じ集合に属するか判定
  def same?(x, y)
    find(x) == find(y)
  end
end

# 入力を処理
v, e = gets.split.map(&:to_i)
edges = []
e.times do
  s, t, w = gets.split.map(&:to_i)
  edges << [s, t, w]
end

# 辺を重みでソート
edges.sort_by! { |edge| edge[2] }

# クラスカルアルゴリズムで最小全域木を求める
uf = UnionFind.new(v)
total_weight = 0
selected_edges = 0

edges.each do |s, t, w|
  # サイクルを形成しない場合のみ辺を追加
  unless uf.same?(s, t)
    uf.unite(s, t)
    total_weight += w
    selected_edges += 1
    # 最小全域木の辺数は(頂点数-1)
    break if selected_edges == v - 1
  end
end

# 結果を出力
puts total_weight
