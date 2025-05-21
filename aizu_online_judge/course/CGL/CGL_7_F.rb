#!/usr/bin/env ruby

# 点の情報を読み込む
point_line = gets.chomp.split.map(&:to_i)
px, py = point_line[0], point_line[1]

# 円の情報を読み込む
circle_line = gets.chomp.split.map(&:to_i)
cx, cy, r = circle_line[0], circle_line[1], circle_line[2]

# 点と円の中心間の距離の2乗
d_squared = (px - cx)**2 + (py - cy)**2

# 接点を求める
# https://en.wikipedia.org/wiki/Tangent_lines_to_circles#Tangent_from_a_point

# 点Pから円の中心Cへのベクトル
vx = cx - px
vy = cy - py

# ベクトルの長さの2乗
len_squared = vx**2 + vy**2

# 接線の長さの2乗
tangent_len_squared = len_squared - r**2

# 接線の長さ
tangent_len = Math.sqrt(tangent_len_squared)

# 円の中心から接点へのベクトルの長さ
scale = r**2 / len_squared

# 点Pから接点Tへのベクトルの係数
t = r * tangent_len / len_squared

# 2つの接点を計算
tangent_points = []

# 1つ目の接点
t1x = px + vx * scale - t * vy
t1y = py + vy * scale + t * vx
tangent_points << [t1x, t1y]

# 2つ目の接点
t2x = px + vx * scale + t * vy
t2y = py + vy * scale - t * vx
tangent_points << [t2x, t2y]

# x座標の小さい順にソート、同じ場合はy座標の小さい順
tangent_points.sort_by! { |point| [point[0], point[1]] }

# 結果を出力（10桁の小数点）
tangent_points.each do |point|
  puts format("%.10f %.10f", point[0], point[1])
end
