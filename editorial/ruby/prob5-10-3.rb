# 入力
a, b, c = gets.split.map(&:to_i)

# 計算
mod = 998_244_353
d = a * (a + 1) / 2
e = b * (b + 1) / 2
f = c * (c + 1) / 2

# 答えを出力
puts (d * e * f) % mod
