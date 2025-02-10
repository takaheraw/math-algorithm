class UnionFind
  def initialize(size)
    @parent = Array.new(size) { |i| i }
    @rank = Array.new(size, 0)
  end

  def find(x)
    @parent[x] = find(@parent[x]) if x != @parent[x]
    @parent[x]
  end

  def union(x, y)
    root_x = find(x)
    root_y = find(y)

    return if root_x == root_y

    if @rank[root_x] < @rank[root_y]
      @parent[root_x] = root_y
    elsif @rank[root_x] > @rank[root_y]
      @parent[root_y] = root_x
    else
      @parent[root_y] = root_x
      @rank[root_x] += 1
    end
  end

  def connected?(x, y)
    find(x) == find(y)
  end
end

n, m = gets.split.map(&:to_i)
uf = UnionFind.new(n)

m.times do
  s, t = gets.split.map(&:to_i)
  uf.union(s, t)
end

q = gets.to_i
q.times do
  s, t = gets.split.map(&:to_i)
  puts uf.connected?(s, t) ? "yes" : "no"
end
