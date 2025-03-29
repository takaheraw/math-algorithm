class DisjointSet
  def initialize(size)
    @parent = Array.new(size) { |i| i }
    @rank = Array.new(size, 0)
  end

  def find(x)
    @parent[x] = find(@parent[x]) if @parent[x] != x
    @parent[x]
  end

  def unite(x, y)
    x_root = find(x)
    y_root = find(y)
    return if x_root == y_root

    if @rank[x_root] < @rank[y_root]
      @parent[x_root] = y_root
    else
      @parent[y_root] = x_root
      @rank[x_root] += 1 if @rank[x_root] == @rank[y_root]
    end
  end

  def same?(x, y)
    find(x) == find(y)
  end
end

# 入力処理
n, q = gets.split.map(&:to_i)
ds = DisjointSet.new(n)

q.times do
  com, x, y = gets.split.map(&:to_i)
  if com == 0
    ds.unite(x, y)
  else
    puts ds.same?(x, y) ? 1 : 0
  end
end
