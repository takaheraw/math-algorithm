# 入力
n = gets.chomp.to_i

# 答えの計算
answer = 1
(1..n).each { |i| answer *= i }

# 出力
puts answer
