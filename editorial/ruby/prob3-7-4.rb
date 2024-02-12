# 入力
n, s = gets.split.map(&:to_i)
a = gets.split.map(&:to_i)

# 配列の初期化
dp = Array.new(n + 1) { Array.new(s + 1) }
dp[0][0] = true
(1..s).each { |i| dp[0][i] = false }

# 動的計画法
(1..n).each do |i|
  (0..s).each do |j|
    dp[i][j] = if j < a[i - 1]
                 # j < a[i-1] のとき、カード i を選べない
                 dp[i - 1][j]
               else
                 # j >= a[i-1] のとき、選ぶ / 選ばない 両方の選択肢がある
                 dp[i - 1][j] || dp[i - 1][j - a[i - 1]]
               end
  end
end

# 答えを出力
puts dp[n][s] ? 'Yes' : 'No'
