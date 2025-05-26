# 0-1 Knapsack Problem Solution
# 動的プログラミングを使用して最適解を求める

# 入力の読み込み
n, w = gets.split.map(&:to_i)
items = []

n.times do
  v, weight = gets.split.map(&:to_i)
  items << [v, weight]
end

# DP配列の初期化
# dp[i][j] = i番目までのアイテムを使って重さjまでで得られる最大価値
dp = Array.new(n + 1) { Array.new(w + 1, 0) }

# DPテーブルの構築
(1..n).each do |i|
  value, weight = items[i - 1]
  
  (0..w).each do |j|
    # i番目のアイテムを選ばない場合
    dp[i][j] = dp[i - 1][j]
    
    # i番目のアイテムを選ぶ場合（重さが許可する場合のみ）
    if j >= weight
      dp[i][j] = [dp[i][j], dp[i - 1][j - weight] + value].max
    end
  end
end

# 結果の出力
puts dp[n][w]
