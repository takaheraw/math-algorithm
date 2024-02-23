# 入力
n = gets.to_i
x = Array.new(n)
y = Array.new(n)
n.times do |i|
  x[i], y[i] = gets.split.map(&:to_i)
end

# 配列 x, y をソートする
x.sort!
y.sort!

# パーツ 1 の答え（x 座標の差の絶対値の総和）
part1 = 0
(1..n).each do |i|
  part1 += x[i - 1] * (-n + 2 * i - 1)
end

# パーツ 2 の答え（y 座標の差の絶対値の総和）
part2 = 0
(1..n).each do |i|
  part2 += y[i - 1] * (-n + 2 * i - 1)
end

# 出力
puts part1 + part2
