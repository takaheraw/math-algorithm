# 入力
n = gets.to_i
a = gets.chomp.split.map(&:to_i)

# 答えを求める
answer = 0
a.each_with_index do |ai, i|
  answer += ai * (-n + 2 * i + 1)
end

# 答えの出力
puts answer
