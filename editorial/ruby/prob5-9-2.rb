# 入力
n = gets.to_i
a = gets.split.map(&:to_i)
b = gets.split.map(&:to_i)

# 配列 a, b をソートする
a.sort!
b.sort!

# 答えを求める
answer = 0
n.times do |i|
  answer += (a[i] - b[i]).abs
end

# 出力
puts answer
