def cross_product(x1, y1, x2, y2)
  x1 * y2 - x2 * y1
end

# 点pが線分ab上にあるかどうかを判定
def on_segment?(ax, ay, bx, by, px, py)
  # 点pが線分abの端点上にある場合
  return true if ax == px && ay == py
  return true if bx == px && by == py

  # 点pが線分ab上にあるか
  # 1. ベクトルapとabが同一直線上にある（外積が0）
  # 2. 点pが線分ab上にある（内積が正でaからbの間にある）
  a_to_p_x = px - ax
  a_to_p_y = py - ay
  a_to_b_x = bx - ax
  a_to_b_y = by - ay

  cross = cross_product(a_to_p_x, a_to_p_y, a_to_b_x, a_to_b_y)
  dot_product = a_to_p_x * a_to_b_x + a_to_p_y * a_to_b_y

  return false if cross != 0 # 外積が0でない場合は同一直線上にない
  return false if dot_product < 0 # 内積が負の場合はpがaの反対側
  
  return dot_product <= a_to_b_x * a_to_b_x + a_to_b_y * a_to_b_y # pがa-bの範囲内かチェック
end

# 線分の交差判定
def intersect?(x1, y1, x2, y2, x3, y3, x4, y4)
  # まず点が線分上にあるかどうかを確認
  return true if on_segment?(x1, y1, x2, y2, x3, y3)
  return true if on_segment?(x1, y1, x2, y2, x4, y4)
  return true if on_segment?(x3, y3, x4, y4, x1, y1)
  return true if on_segment?(x3, y3, x4, y4, x2, y2)

  # 次に交差判定
  # 線分1: (x1, y1) -> (x2, y2)
  # 線分2: (x3, y3) -> (x4, y4)

  # ベクトル計算のための前処理
  vector1_x = x2 - x1
  vector1_y = y2 - y1
  vector2_x = x4 - x3
  vector2_y = y4 - y3

  # 線分1に対する線分2の両端の位置関係
  d1 = cross_product(vector1_x, vector1_y, x3 - x1, y3 - y1)
  d2 = cross_product(vector1_x, vector1_y, x4 - x1, y4 - y1)

  # 線分2に対する線分1の両端の位置関係
  d3 = cross_product(vector2_x, vector2_y, x1 - x3, y1 - y3)
  d4 = cross_product(vector2_x, vector2_y, x2 - x3, y2 - y3)

  # 線分が交差する条件: d1とd2の符号が異なり、かつd3とd4の符号が異なる
  return (d1 * d2 < 0) && (d3 * d4 < 0)
end

# 入力処理
q = gets.to_i

q.times do
  x0, y0, x1, y1, x2, y2, x3, y3 = gets.split.map(&:to_i)
  
  # 線分s1: (x0, y0) -> (x1, y1)
  # 線分s2: (x2, y2) -> (x3, y3)
  
  result = intersect?(x0, y0, x1, y1, x2, y2, x3, y3) ? 1 : 0
  puts result
end
