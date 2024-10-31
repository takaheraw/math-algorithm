# 入力
n, s = gets.split.map(&:to_i)

# 答えを求める
answer = 0
(1..n).each do |i|
  (1..n).each do |j|
    answer += 1 if i + j <= s
  end
end

# 出力
puts answer
