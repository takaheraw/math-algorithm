class Point
  attr_reader :x, :y, :id

  def initialize(x, y, id)
    @x = x
    @y = y
    @id = id
  end
end

class KDTree
  attr_reader :root

  def initialize(points)
    @root = build_tree(points, 0)
  end

  def build_tree(points, depth)
    return nil if points.empty?
    
    # x座標でソート（深さが偶数）または y座標でソート（深さが奇数）
    axis = depth % 2
    points.sort_by! { |point| axis == 0 ? point.x : point.y }
    
    median = points.length / 2
    
    node = {
      point: points[median],
      left: build_tree(points[0...median], depth + 1),
      right: build_tree(points[median + 1..-1], depth + 1)
    }
    
    return node
  end

  def range_search(sx, tx, sy, ty)
    result = []
    search(@root, sx, tx, sy, ty, 0, result)
    result.sort_by(&:id)
  end

  def search(node, sx, tx, sy, ty, depth, result)
    return if node.nil?
    
    point = node[:point]
    
    # 点が範囲内にあるかチェック
    if point.x >= sx && point.x <= tx && point.y >= sy && point.y <= ty
      result << point
    end
    
    axis = depth % 2
    
    # 左側の部分木を探索
    if (axis == 0 && sx <= point.x) || (axis == 1 && sy <= point.y)
      search(node[:left], sx, tx, sy, ty, depth + 1, result)
    end
    
    # 右側の部分木を探索
    if (axis == 0 && tx >= point.x) || (axis == 1 && ty >= point.y)
      search(node[:right], sx, tx, sy, ty, depth + 1, result)
    end
  end
end

# 入力を解析
n = gets.to_i
points = []
n.times do |i|
  x, y = gets.split.map(&:to_i)
  points << Point.new(x, y, i)
end

# kDツリーを構築
kdtree = KDTree.new(points)

# クエリを処理
q = gets.to_i
q.times do
  sx, tx, sy, ty = gets.split.map(&:to_i)
  result = kdtree.range_search(sx, tx, sy, ty)
  
  # 結果を出力
  result.each do |point|
    puts point.id
  end
  puts ""
end
