MOD = 10**9 + 7

def solve_partition(n, k)
  return 0 if n < k || k == 0
  return 1 if k == 1 || n == k
  
  # dp[i][j] = i をちょうど j 個の部分に分割する方法の数
  # 各部分は正の整数で、順序は考慮しない
  dp = Array.new(n + 1) { Array.new(k + 1, 0) }
  
  # 初期条件
  dp[0][0] = 1
  
  (1..n).each do |i|
    (1..[i, k].min).each do |j|
      # 最小の部分が 1 の場合
      dp[i][j] = dp[i - 1][j - 1]
      
      # 最小の部分が 2 以上の場合
      # 全ての部分から 1 を引く
      if i >= j
        dp[i][j] = (dp[i][j] + dp[i - j][j]) % MOD
      end
    end
  end
  
  dp[n][k]
end

# 入力読み込み
n, k = gets.split.map(&:to_i)

# 解答出力
puts solve_partition(n, k)
