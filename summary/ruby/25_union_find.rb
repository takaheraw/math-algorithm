class UnionFind
  def initialize(size)
    @parent = Array.new(size, &:itself)
    @rank = Array.new(size, 0)
  end

  def find(x)
    @parent[x] = find(@parent[x]) if @parent[x] != x
    @parent[x]
  end

  def union(x, y)
    root_x = find(x)
    root_y = find(y)
    return if root_x == root_y

    if @rank[root_x] > @rank[root_y]
      @parent[root_y] = root_x
    elsif @rank[root_x] < @rank[root_y]
      @parent[root_x] = root_y
    else
      @parent[root_y] = root_x
      @rank[root_x] += 1
    end
  end

  def connected?(x, y)
    find(x) == find(y)
  end
end

# 使用例
uf = UnionFind.new(10)
uf.union(1, 2)
uf.union(2, 3)
puts uf.connected?(1, 3) # true
puts uf.connected?(1, 4) # false
