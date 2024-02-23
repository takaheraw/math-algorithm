# 入力
n = gets.to_i
a = gets.split.map(&:to_i)

# 配列 a 全体をソートする
a.sort!

# 答えを求める
answer = 0
(1..n).each do |i|
  answer += a[i - 1] * (-n + 2 * i - 1)
end

# 出力
puts answer
