#!/usr/bin/env ruby

# 点pから線分p1-p2への反射点を計算する関数
def calculate_reflection(p1, p2, p)
  # 線分ベクトル
  line_vec = [p2[0] - p1[0], p2[1] - p1[1]]
  
  # 線分の長さの二乗
  line_len_squared = line_vec[0]**2 + line_vec[1]**2
  
  # 点pから点p1へのベクトル
  p_to_p1 = [p[0] - p1[0], p[1] - p1[1]]
  
  # 線分ベクトルと点pから点p1へのベクトルの内積
  dot_product = p_to_p1[0] * line_vec[0] + p_to_p1[1] * line_vec[1]
  
  # 線分上の最近接点を計算（tは線分上のパラメータ）
  t = dot_product.to_f / line_len_squared
  
  # 最近接点の座標
  closest_x = p1[0] + t * line_vec[0]
  closest_y = p1[1] + t * line_vec[1]
  
  # 点pから最近接点へのベクトル
  to_closest = [closest_x - p[0], closest_y - p[1]]
  
  # 反射点の計算（pから最近接点への距離を2倍にした位置）
  reflection_x = p[0] + 2 * to_closest[0]
  reflection_y = p[1] + 2 * to_closest[1]
  
  return [reflection_x, reflection_y]
end

# 入力を読み込む
line1 = gets.chomp.split.map(&:to_i)
p1 = [line1[0], line1[1]]
p2 = [line1[2], line1[3]]

q = gets.chomp.to_i

q.times do
  p_coords = gets.chomp.split.map(&:to_i)
  p = [p_coords[0], p_coords[1]]
  
  reflection = calculate_reflection(p1, p2, p)
  puts "#{format("%.10f", reflection[0])} #{format("%.10f", reflection[1])}"
end
