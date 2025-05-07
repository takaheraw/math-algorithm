#!/usr/bin/env ruby

# 浮動小数点の誤差を考慮して比較する
def equals(a, b)
  (a - b).abs < 1e-10
end

# 線分の交点を計算する
def cross_point(x0, y0, x1, y1, x2, y2, x3, y3)
  # 線分を表すベクトル
  vec1_x = x1 - x0
  vec1_y = y1 - y0
  vec2_x = x3 - x2
  vec2_y = y3 - y2
  
  # 外積を計算
  denominator = vec1_x * vec2_y - vec1_y * vec2_x
  
  # 平行な場合は処理しない（問題の制約で平行線は与えられないと仮定）
  if equals(denominator, 0)
    return nil
  end
  
  # 線分1の始点から線分2の始点へのベクトル
  d_x = x2 - x0
  d_y = y2 - y0
  
  # パラメータt, sを求める
  t = (d_x * vec2_y - d_y * vec2_x) / denominator
  s = (d_x * vec1_y - d_y * vec1_x) / denominator
  
  # 交点の座標を計算
  cross_x = x0 + vec1_x * t
  cross_y = y0 + vec1_y * t
  
  return [cross_x, cross_y]
end

# クエリ数を読み込む
q = gets.to_i

# 各クエリを処理
q.times do
  # 8つの整数を読み込む
  x0, y0, x1, y1, x2, y2, x3, y3 = gets.split.map(&:to_f)
  
  # 交点を計算
  cross_x, cross_y = cross_point(x0, y0, x1, y1, x2, y2, x3, y3)
  
  # 結果を出力
  puts "#{format("%.10f", cross_x)} #{format("%.10f", cross_y)}"
end
