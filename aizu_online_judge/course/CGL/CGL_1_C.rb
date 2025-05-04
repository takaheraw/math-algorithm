#!/usr/bin/env ruby

# 外積を計算する関数
def cross_product(x0, y0, x1, y1, x2, y2)
  # ベクトル p0->p1 と p0->p2 の外積
  # (x1 - x0) * (y2 - y0) - (y1 - y0) * (x2 - x0)
  (x1 - x0) * (y2 - y0) - (y1 - y0) * (x2 - x0)
end

# 内積を計算する関数
def dot_product(x0, y0, x1, y1, x2, y2)
  # ベクトル p0->p1 と p0->p2 の内積
  (x1 - x0) * (x2 - x0) + (y1 - y0) * (y2 - y0)
end

# 点の位置関係を判定する関数
def determine_orientation(x0, y0, x1, y1, x2, y2)
  cross = cross_product(x0, y0, x1, y1, x2, y2)
  
  if cross > 0
    return "COUNTER_CLOCKWISE"
  elsif cross < 0
    return "CLOCKWISE"
  else
    # 外積が0の場合、3点は一直線上にある
    dot = dot_product(x0, y0, x1, y1, x2, y2)
    
    if dot < 0
      return "ONLINE_BACK"
    elsif dot > (x1 - x0) ** 2 + (y1 - y0) ** 2
      return "ONLINE_FRONT"
    else
      return "ON_SEGMENT"
    end
  end
end

# 入力を読み込む
p0_p1 = gets.chomp.split.map(&:to_i)
x0, y0, x1, y1 = p0_p1

q = gets.chomp.to_i

q.times do
  p2 = gets.chomp.split.map(&:to_i)
  x2, y2 = p2
  
  puts determine_orientation(x0, y0, x1, y1, x2, y2)
end
