# 入力
n = gets.to_i

# 答えの計算
answer = 0.0
(1..n).each do |i|
  answer += 1.0 * n / i
end

# 出力
puts '%.12f' % answer
