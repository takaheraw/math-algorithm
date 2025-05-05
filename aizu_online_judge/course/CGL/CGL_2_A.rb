#!/usr/bin/env ruby

# 2つの直線が平行、直交、またはそれ以外かを判定する関数
def check_lines(p0x, p0y, p1x, p1y, p2x, p2y, p3x, p3y)
  # 各線分のベクトル成分を計算
  v1x = p1x - p0x
  v1y = p1y - p0y
  v2x = p3x - p2x
  v2y = p3y - p2y
  
  # 内積を計算
  dot_product = v1x * v2x + v1y * v2y
  
  # 外積を計算（絶対値）
  cross_product = v1x * v2y - v1y * v2x
  
  # 平行か確認（外積が0）
  if cross_product == 0 && dot_product != 0
    return 2
  # 直交か確認（内積が0）
  elsif dot_product == 0 && cross_product != 0
    return 1
  # それ以外
  else
    return 0
  end
end

# クエリ数を読み込む
q = gets.to_i

# 各クエリに対して処理
q.times do
  # 8つの整数を読み込む
  p0x, p0y, p1x, p1y, p2x, p2y, p3x, p3y = gets.split.map(&:to_i)
  
  # 線分の関係を判定
  result = check_lines(p0x, p0y, p1x, p1y, p2x, p2y, p3x, p3y)
  
  # 結果を出力
  puts result
end
