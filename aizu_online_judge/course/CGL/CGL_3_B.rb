# 点を表すクラス
class Point
  attr_reader :x, :y
  
  def initialize(x, y)
    @x = x
    @y = y
  end
end

# ベクトルの外積を計算する関数
def cross_product(p1, p2, p3)
  (p2.x - p1.x) * (p3.y - p2.y) - (p2.y - p1.y) * (p3.x - p2.x)
end

# 多角形が凸かどうかをチェックする関数
def is_convex?(points)
  n = points.length
  return false if n < 3
  
  # 最初の3つの点で向きを決定
  first_cross = cross_product(points[0], points[1], points[2])
  sign = first_cross > 0 ? 1 : -1
  
  # すべての連続した3点のセットで外積の符号をチェック
  (0...n).each do |i|
    j = (i + 1) % n
    k = (i + 2) % n
    
    current_cross = cross_product(points[i], points[j], points[k])
    
    # 外積の符号が変わると、多角形は凸ではない
    return false if (current_cross * sign) < 0
  end
  
  # すべてのチェックをパスした場合、多角形は凸
  return true
end

# 入力を読み込む
n = gets.to_i
points = []

n.times do
  x, y = gets.split.map(&:to_i)
  points << Point.new(x, y)
end

# 凸性をチェックして結果を出力
if is_convex?(points)
  puts "1"
else
  puts "0"
end
