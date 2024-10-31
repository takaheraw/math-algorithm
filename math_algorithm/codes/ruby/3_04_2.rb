# 入力
n = gets.to_i
p_values = Array.new(n)
q_values = Array.new(n)
n.times do |i|
  p_values[i], q_values[i] = gets.chomp.split.map(&:to_i)
end

# 答えの計算
answer = 0.0
n.times do |i|
  answer += q_values[i].to_f / p_values[i]
end

# 出力
puts format('%.12f', answer)
