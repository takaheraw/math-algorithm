r = 2.0 # √2 を求めたいから
a = 2.0 # 初期値を適当に 2.0 にセットする
repeats = 5

(1..repeats).each do |i|
  # 点 (a, f(a)) の x 座標と y 座標を求める
  zahyou_x = a
  zahyou_y = a * a

  # 接線の式 y = sessen_a * x + sessen_b を求める
  sessen_a = 2.0 * zahyou_x
  sessen_b = zahyou_y - sessen_a * zahyou_x

  # 次の a の値 next_a を求める
  next_a = (r - sessen_b) / sessen_a
  puts format("Step ##{i}: a = %.12f -> %.12f", a, next_a)
  a = next_a
end
