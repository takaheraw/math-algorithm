# 入力
n = gets.to_i
a = gets.split.map(&:to_i)

# 2^i を求める
mod = 1_000_000_007
power = Array.new(n, 0)
power[0] = 1
(1..n - 1).each do |i|
  power[i] = (2 * power[i - 1]) % mod
end

# 答えを求める
answer = 0
n.times do |i|
  answer += power[i] * a[i]
  answer %= mod
end

# 出力
puts answer
