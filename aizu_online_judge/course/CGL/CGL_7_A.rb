#!/usr/bin/env ruby

# 2つの円の位置関係を判定し、共通接線の数を返す
def count_common_tangent_lines(c1x, c1y, c1r, c2x, c2y, c2r)
  # 2点間の距離を計算
  distance = Math.sqrt((c1x - c2x) ** 2 + (c1y - c2y) ** 2)
  
  # 半径の和と差を計算
  r_sum = c1r + c2r
  r_diff = (c1r - c2r).abs
  
  # 位置関係の判定
  if distance > r_sum
    # 離れている場合: 4本の共通接線
    return 4
  elsif distance == r_sum
    # 外接している場合: 3本の共通接線
    return 3
  elsif distance > r_diff
    # 交差している場合: 2本の共通接線
    return 2
  elsif distance == r_diff
    # 内接している場合: 1本の共通接線
    return 1
  else
    # 一方が他方を内包する場合: 共通接線なし
    return 0
  end
end

# 入力を読み込む
input_line1 = gets.chomp.split.map(&:to_i)
input_line2 = gets.chomp.split.map(&:to_i)
c1x, c1y, c1r = input_line1
c2x, c2y, c2r = input_line2

# 結果を計算して出力
result = count_common_tangent_lines(c1x, c1y, c1r, c2x, c2y, c2r)
puts result
