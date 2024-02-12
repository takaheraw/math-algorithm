# 入力
n = gets.to_i
a = gets.split.map(&:to_i)

# 配列の初期化
dp1 = Array.new(n + 1)
dp2 = Array.new(n + 1)
dp1[0] = 0
dp2[0] = 0

# 動的計画法
(1..n).each do |i|
  dp1[i] = dp2[i - 1] + a[i - 1]
  dp2[i] = [dp1[i - 1], dp2[i - 1]].max
end

# 出力
answer = [dp1[n], dp2[n]].max
puts answer
