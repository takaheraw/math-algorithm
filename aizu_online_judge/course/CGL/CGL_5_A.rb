#!/usr/bin/env ruby

# 点の集合から最近点対を求める
# 愚直なO(n^2)のアルゴリズムとO(n log n)の分割統治法を実装

class Point
  attr_accessor :x, :y
  
  def initialize(x, y)
    @x = x
    @y = y
  end
  
  def distance_to(other)
    dx = @x - other.x
    dy = @y - other.y
    Math.sqrt(dx * dx + dy * dy)
  end
end

# 愚直な実装（計算量O(n^2)）
def brute_force_closest_pair(points)
  n = points.size
  min_dist = Float::INFINITY
  
  (0...n).each do |i|
    ((i + 1)...n).each do |j|
      dist = points[i].distance_to(points[j])
      min_dist = dist if dist < min_dist
    end
  end
  
  min_dist
end

# 分割統治法（計算量O(n log n)）
def closest_pair(points)
  # 点数が少ない場合は総当たりで計算
  return brute_force_closest_pair(points) if points.size <= 3
  
  # x座標でソート
  points_x = points.sort_by(&:x)
  
  # 真ん中で分割
  mid = points.size / 2
  mid_x = points_x[mid].x
  
  # 左右の部分問題を再帰的に解く
  left_points = points_x[0...mid]
  right_points = points_x[mid..-1]
  
  left_min = closest_pair(left_points)
  right_min = closest_pair(right_points)
  
  # 左右それぞれの最小距離の小さい方
  delta = [left_min, right_min].min
  
  # 分割線付近の点のチェック
  # x座標がmid_x - delta以上mid_x + delta以下の点を抽出
  strip = points_x.select { |p| (p.x - mid_x).abs < delta }
  
  # y座標でソート
  strip.sort_by!(&:y)
  
  # 分割線をまたぐ点対をチェック
  strip_min = delta
  n = strip.size
  
  # 各点に対して、y座標差がdelta以下の点だけをチェック（最大で7点）
  (0...n).each do |i|
    j = i + 1
    while j < n && strip[j].y - strip[i].y < delta
      dist = strip[i].distance_to(strip[j])
      strip_min = dist if dist < strip_min
      j += 1
    end
  end
  
  [delta, strip_min].min
end

# 入力読み込み
n = gets.to_i
points = []
n.times do
  x, y = gets.split.map(&:to_f)
  points << Point.new(x, y)
end

# 点数が多い場合は分割統治法、少ない場合は総当たりで解く
if n > 10000
  result = closest_pair(points)
else
  result = brute_force_closest_pair(points)
end

# 結果出力
puts result
