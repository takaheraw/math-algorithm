#!/usr/bin/env ruby

# 2点間の距離を計算する関数
def distance(x1, y1, x2, y2)
  Math.sqrt((x2 - x1) ** 2 + (y2 - y1) ** 2)
end

# 点pから線分p1p2への射影点を計算する関数
def projection(xp1, yp1, xp2, yp2, xp, yp)
  # ベクトルp1p2のx成分とy成分
  vec_x = xp2 - xp1
  vec_y = yp2 - yp1
  
  # ベクトルp1pのx成分とy成分
  p1p_x = xp - xp1
  p1p_y = yp - yp1
  
  # p1p2の長さの二乗
  line_length_squared = vec_x ** 2 + vec_y ** 2
  
  # ベクトルp1pとp1p2の内積をp1p2の長さの二乗で割る
  # これにより、p1からの射影点までの距離の比率が求められる
  t = (p1p_x * vec_x + p1p_y * vec_y) / line_length_squared.to_f
  
  # 射影点の座標を計算
  x = xp1 + t * vec_x
  y = yp1 + t * vec_y
  
  [x, y]
end

# 入力を読み込む
xp1, yp1, xp2, yp2 = gets.split.map(&:to_i)
q = gets.to_i

# 各クエリに対して射影点を計算し出力する
q.times do
  xp, yp = gets.split.map(&:to_i)
  x, y = projection(xp1, yp1, xp2, yp2, xp, yp)
  puts "#{format("%.10f", x)} #{format("%.10f", y)}"
end
