# 入力
ax, ay = gets.split.map(&:to_i)
bx, by = gets.split.map(&:to_i)
cx, cy = gets.split.map(&:to_i)

# ベクトル BA, BC, CA, CB の成分表示を求める
BAx = ax - bx
BAy = ay - by
BCx = cx - bx
BCy = cy - by
CAx = ax - cx
CAy = ay - cy
CBx = bx - cx
CBy = by - cy

# どのパターンに当てはまるか判定する
pattern = 2
pattern = 1 if BAx * BCx + BAy * BCy < 0
pattern = 3 if CAx * CBx + CAy * CBy < 0

# 点と直線の距離を求める
if pattern == 1
  answer = Math.sqrt(BAx**2 + BAy**2)
elsif pattern == 3
  answer = Math.sqrt(CAx**2 + CAy**2)
else
  s = (BAx * BCy - BAy * BCx).abs
  bc_length = Math.sqrt(BCx**2 + BCy**2)
  answer = s / bc_length
end

# 答えの出力
puts '%.12f' % answer
