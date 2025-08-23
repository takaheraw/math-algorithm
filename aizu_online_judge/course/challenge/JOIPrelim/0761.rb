class UnionFind
  def initialize(n)
    @parent = (0...n).to_a
    @rank = Array.new(n, 0)
    @count = n
  end
  
  def find(x)
    if @parent[x] != x
      @parent[x] = find(@parent[x])
    end
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
    
    @count -= 1
  end
  
  def connected?(x, y)
    find(x) == find(y)
  end
  
  def count_components
    @count
  end
end

def solve_canal
  h, w = gets.split.map(&:to_i)
  grid = []
  h.times do
    row = gets.split.map(&:to_i)
    grid << row
  end
  
  min_plains = Float::INFINITY
  
  (1...w).each do |k|
    uf = UnionFind.new(h * w)
    
    (0...h).each do |i|
      (0...w).each do |j|
        next if j == k - 1  # k列目の右端は k+1列目と結合しない
        
        current_id = i * w + j
        
        if j + 1 < w && j + 1 != k  # 運河を越えない場合のみ
          right_id = i * w + (j + 1)
          if grid[i][j] == grid[i][j + 1]
            uf.union(current_id, right_id)
          end
        end
        
        if i + 1 < h
          down_id = (i + 1) * w + j
          if grid[i][j] == grid[i + 1][j]
            uf.union(current_id, down_id)
          end
        end
      end
    end
    
    roots = Set.new
    (0...h).each do |i|
      (0...w).each do |j|
        id = i * w + j
        roots.add(uf.find(id))
      end
    end
    
    plains_count = roots.size
    min_plains = [min_plains, plains_count].min
  end
  
  puts min_plains
end

solve_canal
