# 入力
n = gets.chomp.to_i

# 動的計画法
dp = Array.new(n + 1)
(0..n).each do |i|
  dp[i] = if i <= 1
            1
          else
            dp[i - 1] + dp[i - 2]
          end
end

# 答えの出力
puts dp[n]
