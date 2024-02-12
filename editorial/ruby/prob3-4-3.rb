# 入力
n = gets.to_i
a = gets.split.map(&:to_i)
b = gets.split.map(&:to_i)

# 答えを求める
answer = 0.0
n.times do |i|
  answer += (1.0 / 3.0) * a[i] + (2.0 / 3.0) * b[i]
end

# 出力
puts '%.12f' % answer
