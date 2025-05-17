#!/usr/bin/env ruby

# 三角形の外接円を計算する関数
def circumscribed_circle(x1, y1, x2, y2, x3, y3)
  # 行列式を使って計算する方法（より安定した方法）
  
  # 行列のための係数を準備
  a = x1 * (y2 - y3) - y1 * (x2 - x3) + x2 * y3 - x3 * y2
  bx = (x1*x1 + y1*y1) * (y3 - y2) + (x2*x2 + y2*y2) * (y1 - y3) + (x3*x3 + y3*y3) * (y2 - y1)
  by = (x1*x1 + y1*y1) * (x2 - x3) + (x2*x2 + y2*y2) * (x3 - x1) + (x3*x3 + y3*y3) * (x1 - x2)
  c = (x1*x1 + y1*y1) * (x3*y2 - x2*y3) + (x2*x2 + y2*y2) * (x1*y3 - x3*y1) + (x3*x3 + y3*y3) * (x2*y1 - x1*y2)
  
  # 外接円の中心座標
  cx = -bx / (2.0 * a)
  cy = -by / (2.0 * a)
  
  # 半径を計算
  r = Math.sqrt((cx - x1)**2 + (cy - y1)**2)
  
  return cx, cy, r
end

# 入力を読み込む
x1, y1 = gets.split.map(&:to_i)
x2, y2 = gets.split.map(&:to_i)
x3, y3 = gets.split.map(&:to_i)

# 外接円を計算
cx, cy, r = circumscribed_circle(x1, y1, x2, y2, x3, y3)

# 結果を出力（サンプル出力のフォーマットに合わせる）
puts "%.20f %.20f %.20f" % [cx, cy, r]
