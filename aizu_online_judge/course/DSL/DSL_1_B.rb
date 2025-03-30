class WeightedUnionFind
  def initialize(n)
    @parent = Array.new(n) { |i| i }  # 親ノードのインデックス
    @rank = Array.new(n, 0)           # 木の高さ
    @diff_weight = Array.new(n, 0)    # 重みの差分
  end
  
  # 要素xの根を見つける
  def find(x)
    if @parent[x] == x
      return x
    else
      root = find(@parent[x])
      @diff_weight[x] += @diff_weight[@parent[x]]  # 経路圧縮時に重みを更新
      @parent[x] = root
      return root
    end
  end
  
  # xとyを重みwで結合する（y = x + w となるように）
  def unite(x, y, w)
    w += weight(x)
    w -= weight(y)
    x_root = find(x)
    y_root = find(y)
    
    return if x_root == y_root
    
    if @rank[x_root] < @rank[y_root]
      @parent[x_root] = y_root
      @diff_weight[x_root] = -w
    else
      @parent[y_root] = x_root
      @diff_weight[y_root] = w
      @rank[x_root] += 1 if @rank[x_root] == @rank[y_root]
    end
  end
  
  # xとyが同じ集合に属しているかどうか
  def same?(x, y)
    find(x) == find(y)
  end
  
  # xの重みを返す
  def weight(x)
    find(x)  # 経路圧縮を実行
    @diff_weight[x]
  end
  
  # yとxの差分を返す（y - x）
  def diff(x, y)
    return nil unless same?(x, y)
    weight(y) - weight(x)
  end
end

# 入力を読み込む
n, q = gets.split.map(&:to_i)
uf = WeightedUnionFind.new(n)
results = []

q.times do
  query = gets.split.map(&:to_i)
  
  if query[0] == 0
    # relate(x, y, z): ay は ax より z だけ大きい
    x, y, z = query[1], query[2], query[3]
    uf.unite(x, y, z)
  else
    # diff(x, y): ax と ay の差を報告 (ay - ax)
    x, y = query[1], query[2]
    
    if uf.same?(x, y)
      results << uf.diff(x, y)
    else
      results << "?"
    end
  end
end

# 結果を出力
results.each do |result|
  puts result
end
