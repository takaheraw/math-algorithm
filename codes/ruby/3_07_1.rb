# 入力
n = gets.chomp.to_i
h = gets.chomp.split.map(&:to_i)

# 動的計画法
dp = Array.new(n)
dp[0] = 0
(1...n).each do |i|
  if i == 1
    dp[i] = (h[i - 1] - h[i]).abs
  elsif i >= 2
    v1 = dp[i - 1] + (h[i - 1] - h[i]).abs # 1 個前の足場からジャンプするとき
    v2 = dp[i - 2] + (h[i - 2] - h[i]).abs # 2 個前の足場からジャンプするとき
    dp[i] = [v1, v2].min
  end
end

# 答えの出力
puts dp[n - 1]
