# 入力
n = gets.to_i
a = gets.split.map(&:to_i)
m = gets.to_i
b = Array.new(m)
m.times do |i|
  b[i] = gets.to_i
end

# 累積和をとる
s = [0]
(n - 1).times do |i|
  s << s[i] + a[i]
end

# 答えを求める
# B[i] - 1 などになっているのは、配列の index が 0 始まりだから
answer = 0
(m - 1).times do |i|
  answer += if b[i] < b[i + 1]
              s[b[i + 1] - 1] - s[b[i] - 1]
            else
              s[b[i] - 1] - s[b[i + 1] - 1]
            end
end

# 出力
puts answer
