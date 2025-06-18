MOD = 10**9 + 7

def solve(n, k)
  # 第2種スターリング数を計算するためのDP表
  # dp[i][j] = S(i, j) = i個の区別できる要素をj個の区別できないグループに分ける場合の数
  dp = Array.new(n + 1) { Array.new(k + 1, 0) }
  
  # 初期条件
  dp[0][0] = 1
  
  # 第2種スターリング数の計算
  (1..n).each do |i|
    (1..[i, k].min).each do |j|
      # S(i, j) = j * S(i-1, j) + S(i-1, j-1)
      dp[i][j] = (j * dp[i-1][j] + dp[i-1][j-1]) % MOD
    end
  end
  
  # 答えはS(n,1) + S(n,2) + ... + S(n,k)
  result = 0
  (1..[n, k].min).each do |i|
    result = (result + dp[n][i]) % MOD
  end
  
  result
end

# 入力を読み取り
n, k = gets.split.map(&:to_i)

# 結果を出力
puts solve(n, k)
