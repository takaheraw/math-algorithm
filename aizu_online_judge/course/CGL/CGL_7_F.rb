#!/usr/bin/env ruby

# 点と円の情報を読み込む
input = gets.chomp.split.map(&:to_i)
px, py = input[0], input[1]
cx, cy, r = input[2], input[3], input[4]

# 点Pと円の中心との距離を計算
dist_p_to_center = Math.sqrt((px - cx)**2 + (py - cy)**2)

# 接点の座標を計算
# 点Pからの接線の長さ
tangent_length = Math.sqrt(dist_p_to_center**2 - r**2)

# 点Pから円の中心Cへのベクトル
vec_pc_x = cx - px
vec_pc_y = cy - py

# ベクトルPCの長さ
len_pc = dist_p_to_center

# 点Pから円の中心Cへの単位ベクトル
unit_pc_x = vec_pc_x / len_pc
unit_pc_y = vec_pc_y / len_pc

# 単位ベクトルPCに垂直な単位ベクトル（時計回りと反時計回り）
unit_perp1_x = -unit_pc_y
unit_perp1_y = unit_pc_x
unit_perp2_x = unit_pc_y
unit_perp2_y = -unit_pc_x

# 点Pから接点までの距離（コサイン定理より）
dist_p_to_tangent = tangent_length

# 点Pから接点への方向ベクトルを計算
# cos_theta = r / dist_p_to_center
cos_theta = r / dist_p_to_center
sin_theta = tangent_length / dist_p_to_center

# 2つの接点への方向ベクトル
dir1_x = cos_theta * unit_pc_x + sin_theta * unit_perp1_x
dir1_y = cos_theta * unit_pc_y + sin_theta * unit_perp1_y

dir2_x = cos_theta * unit_pc_x + sin_theta * unit_perp2_x
dir2_y = cos_theta * unit_pc_y + sin_theta * unit_perp2_y

# 接点の座標を計算
tangent1_x = cx + r * dir1_x
tangent1_y = cy + r * dir1_y

tangent2_x = cx + r * dir2_x
tangent2_y = cy + r * dir2_y

# 接点を適切な順序にソート
tangent_points = [[tangent1_x, tangent1_y], [tangent2_x, tangent2_y]]
tangent_points.sort_by! { |point| [point[0], point[1]] }

# 結果を出力
tangent_points.each do |point|
  puts format("%.10f %.10f", point[0], point[1])
end
