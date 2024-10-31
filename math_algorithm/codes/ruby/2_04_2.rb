# 入力
n, x, y = gets.split.map(&:to_i)

# 答えを求める
cnt = 0
(1..n).each do |i|
  cnt += 1 if i % x == 0 || i % y == 0
end

# 出力
puts cnt
