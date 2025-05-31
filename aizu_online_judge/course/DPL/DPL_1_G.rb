# 多重ナップサック問題の解法
def solve_knapsack
  # 入力の読み取り
  n, w = gets.split.map(&:to_i)
  
  items = []
  n.times do
    v, weight, m = gets.split.map(&:to_i)
    items << [v, weight, m]
  end
  
  # DP配列の初期化
  # dp[i][j] = i番目までのアイテムを使って重さjのときの最大価値
  dp = Array.new(n + 1) { Array.new(w + 1, 0) }
  
  # 各アイテムについて処理
  (1..n).each do |i|
    value, weight, limit = items[i - 1]
    
    # 各重さについて処理
    (0..w).each do |j|
      # そのアイテムを使わない場合
      dp[i][j] = dp[i - 1][j]
      
      # そのアイテムを使う場合（1個から限界個数まで）
      (1..limit).each do |k|
        if j >= weight * k
          # k個使う場合の価値を計算
          new_value = dp[i - 1][j - weight * k] + value * k
          dp[i][j] = [dp[i][j], new_value].max
        else
          break
        end
      end
    end
  end
  
  # 答えを出力
  puts dp[n][w]
end

solve_knapsack
