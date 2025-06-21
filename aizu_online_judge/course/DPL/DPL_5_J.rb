MOD = 10**9 + 7

def solve(n, k)
  # dp[i][j] = i個のボールをj個以下の箱に入れる方法の数
  dp = Array.new(n + 1) { Array.new(k + 1, 0) }
  
  # 初期化：0個のボールは1通り（何もしない）
  (0..k).each { |j| dp[0][j] = 1 }
  
  # 動的プログラミング
  (1..n).each do |i|
    (1..k).each do |j|
      # j-1個以下の箱を使う場合
      dp[i][j] = dp[i][j-1]
      
      # j個の箱すべてに少なくとも1個ずつ入れる場合
      if i >= j
        dp[i][j] = (dp[i][j] + dp[i-j][j]) % MOD
      end
    end
  end
  
  dp[n][k]
end

# 入力読み込み
n, k = gets.split.map(&:to_i)

# 結果出力
puts solve(n, k)
