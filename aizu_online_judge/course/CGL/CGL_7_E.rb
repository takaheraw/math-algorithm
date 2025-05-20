#!/usr/bin/env ruby

# 2つの円の交点を計算する関数
def find_intersection_points(c1x, c1y, c1r, c2x, c2y, c2r)
  # 2つの円の中心間の距離を計算
  dx = c2x - c1x
  dy = c2y - c1y
  d = Math.sqrt(dx*dx + dy*dy)
  
  # 中心が同じで半径が同じ場合は無限個の交点があるが、制約により中心は異なるため考慮しない
  
  # 交点が1つの場合（円が内接または外接する場合）
  if (d == c1r + c2r) || (d == (c1r - c2r).abs)
    # 外接または内接する円の交点を計算
    # 第1円から第2円の中心への方向に c1r の距離だけ進んだ点が交点
    t = c1r / d
    x = c1x + t * dx
    y = c1y + t * dy
    return [[x, y], [x, y]]
  end
  
  # 余弦定理を使用して交点を見つける
  # 第1円の中心から交点までの距離 h を計算するための式
  a = (c1r*c1r - c2r*c2r + d*d) / (2 * d)
  
  # ピタゴラスの定理で h（中心線から交点までの垂直距離）を計算
  h = Math.sqrt(c1r*c1r - a*a)
  
  # 第1円の中心から第2円の中心への方向に a だけ進んだ点
  x0 = c1x + a * dx / d
  y0 = c1y + a * dy / d
  
  # 交点は、(x0, y0) から中心線に垂直な方向に h だけ進んだ点
  x1 = x0 + h * dy / d
  y1 = y0 - h * dx / d
  x2 = x0 - h * dy / d
  y2 = y0 + h * dx / d
  
  # x座標が小さい順、同じならy座標が小さい順に並べる
  points = [[x1, y1], [x2, y2]].sort_by { |p| [p[0], p[1]] }
  
  return points
end

# 入力読み込み
c1x, c1y, c1r = gets.split.map(&:to_i)
c2x, c2y, c2r = gets.split.map(&:to_i)

# 交点計算
points = find_intersection_points(c1x, c1y, c1r, c2x, c2y, c2r)

# 出力
puts "%.8f %.8f %.8f %.8f" % [points[0][0], points[0][1], points[1][0], points[1][1]]
