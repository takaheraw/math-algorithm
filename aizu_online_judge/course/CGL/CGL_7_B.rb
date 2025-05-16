#!/usr/bin/env ruby

# 三角形の内接円を計算するプログラム

# 点から点への距離を計算する関数
def distance(x1, y1, x2, y2)
  Math.sqrt((x2 - x1) ** 2 + (y2 - y1) ** 2)
end

# 内接円を計算する関数
def incircle(x1, y1, x2, y2, x3, y3)
  # 各辺の長さを計算
  a = distance(x2, y2, x3, y3)
  b = distance(x3, y3, x1, y1)
  c = distance(x1, y1, x2, y2)
  
  # 半周長
  s = (a + b + c) / 2.0
  
  # 三角形の面積（ヘロンの公式）
  area = Math.sqrt(s * (s - a) * (s - b) * (s - c))
  
  # 内接円の半径
  r = area / s
  
  # 内心の座標を計算
  cx = (a * x1 + b * x2 + c * x3) / (a + b + c)
  cy = (a * y1 + b * y2 + c * y3) / (a + b + c)
  
  [cx, cy, r]
end

# 入力を読み込む
x1, y1 = gets.split.map(&:to_i)
x2, y2 = gets.split.map(&:to_i)
x3, y3 = gets.split.map(&:to_i)

# 内接円を計算
cx, cy, r = incircle(x1, y1, x2, y2, x3, y3)

# 結果を出力
puts "#{cx} #{cy} #{r}"
