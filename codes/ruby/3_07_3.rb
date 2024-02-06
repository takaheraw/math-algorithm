# 入力
n, w = gets.chomp.split.map(&:to_i)
wr = Array.new(n)
vr = Array.new(n)
n.times do |i|
  wr[i], vr[i] = gets.chomp.split.map(&:to_i)
end

# 配列の初期化
INF = 10**18
dp = Array.new(n + 1) { Array.new(w + 1) }
dp[0][0] = 0
(1..w).each do |i|
  dp[0][i] = -INF
end

# 動的計画法
(1..n).each do |i|
  (0..w).each do |j|
    dp[i][j] = if j < wr[i - 1]
                 # j < w[i-1] のとき、方法 A だけしか選べない
                 dp[i - 1][j]
               else
                 # j >= w[i-1] のとき、方法 A・方法 B どちらも選べる
                 [dp[i - 1][j], dp[i - 1][j - wr[i - 1]] + vr[i - 1]].max
               end
  end
end

# 答えを計算して出力
answer = dp[n].max
puts answer
