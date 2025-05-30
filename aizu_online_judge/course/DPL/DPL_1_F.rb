# 0-1 Knapsack Problem II
# 価値をインデックスにするDPを使用

def solve_knapsack
  # 入力読み込み
  n, w = gets.split.map(&:to_i)
  items = []
  n.times do
    v, weight = gets.split.map(&:to_i)
    items << [v, weight]
  end
  
  # 最大価値を計算
  max_value = items.sum { |v, _| v }
  
  # dp[i][j] = アイテム0〜i-1を使って価値jを達成するのに必要な最小重量
  # 達成不可能な場合はFloat::INFINITY
  inf = Float::INFINITY
  dp = Array.new(n + 1) { Array.new(max_value + 1, inf) }
  
  # 初期化：価値0は重量0で達成可能
  (0..n).each { |i| dp[i][0] = 0 }
  
  # DPテーブル構築
  (0...n).each do |i|
    value, weight = items[i]
    (0..max_value).each do |j|
      # アイテムiを選ばない場合
      dp[i + 1][j] = dp[i][j]
      
      # アイテムiを選ぶ場合
      if j >= value && dp[i][j - value] != inf
        new_weight = dp[i][j - value] + weight
        dp[i + 1][j] = [dp[i + 1][j], new_weight].min
      end
    end
  end
  
  # 重量制限w以下で達成可能な最大価値を探す
  max_achievable_value = 0
  (0..max_value).each do |j|
    if dp[n][j] <= w
      max_achievable_value = j
    end
  end
  
  max_achievable_value
end

# 実行
puts solve_knapsack
