# 入力
n = gets.to_i

# 答えを求める
mod = 1_000_000_007
val = n * (n + 1) / 2
puts val * val % mod
