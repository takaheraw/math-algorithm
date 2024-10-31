# 入力
a, b, h, m = gets.split.map(&:to_f)

# 座標を求める
pi = Math::PI
angle_h = 30.0 * h + 0.5 * m
angle_m = 6.0 * m
hx = a * Math.cos(angle_h * pi / 180.0)
hy = a * Math.sin(angle_h * pi / 180.0)
mx = b * Math.cos(angle_m * pi / 180.0)
my = b * Math.sin(angle_m * pi / 180.0)

# 答えを出力
d = Math.sqrt((hx - mx)**2 + (hy - my)**2)
puts '%.12f' % d
