# 凸包問題を解くためのRubyプログラム

# 点を表現するクラス
class Point
  attr_accessor :x, :y
  
  def initialize(x, y)
    @x = x
    @y = y
  end
  
  def to_s
    "#{@x} #{@y}"
  end
end

# 3点間の外積を計算
# p0→p1, p0→p2 の外積
# 正: p0, p1, p2が反時計回り
# 負: p0, p1, p2が時計回り
# 0: p0, p1, p2が一直線上
def cross_product(p0, p1, p2)
  (p1.x - p0.x) * (p2.y - p0.y) - (p1.y - p0.y) * (p2.x - p0.x)
end

# Graham's Scanアルゴリズムで凸包を計算
def convex_hull(points)
  n = points.length
  return points if n <= 3  # 3点以下の場合はそのまま返す
  
  # 最も低い点を見つける（y座標が最小で、複数ある場合はx座標が最小のもの）
  min_idx = 0
  min_y = points[0].y
  min_x = points[0].x
  
  points.each_with_index do |p, i|
    if p.y < min_y || (p.y == min_y && p.x < min_x)
      min_y = p.y
      min_x = p.x
      min_idx = i
    end
  end
  
  # 最小点を先頭に移動
  points[0], points[min_idx] = points[min_idx], points[0]
  p0 = points[0]
  
  # 残りの点を極角でソート
  points[1..-1] = points[1..-1].sort_by do |p|
    # atan2を使用して極角を計算
    angle = Math.atan2(p.y - p0.y, p.x - p0.x)
    
    # 同じ角度の場合は、p0からの距離が近い点を先に
    dist = (p.x - p0.x) * (p.x - p0.x) + (p.y - p0.y) * (p.y - p0.y)
    [angle, dist]
  end
  
  # 同じ角度の点を除去せず、全て保持する（境界上の点も含める）
  # 角度が同じ場合、距離が遠い点からソートし直す
  i = 1
  while i < points.length - 1
    # 現在の点と次の点が同じ極角を持つか確認
    angle_curr = Math.atan2(points[i].y - p0.y, points[i].x - p0.x)
    angle_next = Math.atan2(points[i+1].y - p0.y, points[i+1].x - p0.x)
    
    if (angle_curr - angle_next).abs < 1e-9
      # 同じ角度の点のグループを見つけ、距離の降順でソート
      j = i
      while j < points.length - 1 && (Math.atan2(points[j+1].y - p0.y, points[j+1].x - p0.x) - angle_curr).abs < 1e-9
        j += 1
      end
      
      if j > i
        # 距離の降順でソート（遠い順）
        points[i..j] = points[i..j].sort_by do |p|
          -((p.x - p0.x) * (p.x - p0.x) + (p.y - p0.y) * (p.y - p0.y))
        end
        i = j  # ソートした最後の点へ
      end
    end
    i += 1
  end
  
  # Graham's Scanでスタックを構築
  stack = [points[0], points[1]]
  
  for i in 2...points.length
    # スタックの最後の2点と現在の点が「左折」するまでpop
    while stack.length > 1 && cross_product(stack[-2], stack[-1], points[i]) < 0
      stack.pop
    end
    stack.push(points[i])
  end
  
  return stack
end

# 入力を読み込み
n = gets.to_i
points = []
n.times do
  x, y = gets.split.map(&:to_i)
  points << Point.new(x, y)
end

# 凸包を計算
hull = convex_hull(points)

# 結果を出力
puts hull.size
hull.each do |point|
  puts point.to_s
end
