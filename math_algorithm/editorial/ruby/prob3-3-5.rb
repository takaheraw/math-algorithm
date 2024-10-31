# 入力
n = gets.to_i
a = gets.split.map(&:to_i)

# 答えを求める
x = a.count(1)
y = a.count(2)
z = a.count(3)

# 出力
puts x * (x - 1) / 2 + y * (y - 1) / 2 + z * (z - 1) / 2
