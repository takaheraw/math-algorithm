MOD = 10**9 + 7

def solve(n, k)
  # n < k の場合、各ボックスに少なくとも1つのボールを入れることは不可能
  return 0 if n < k
  
  # 第2種スターリング数を動的プログラミングで計算
  # dp[i][j] = S(i, j) = i個の区別できる要素をj個の空でない部分集合に分割する方法の数
  dp = Array.new(n + 1) { Array.new(k + 1, 0) }
  
  # 初期条件
  dp[0][0] = 1
  
  # 動的プログラミングで第2種スターリング数を計算
  (1..n).each do |i|
    (1..k).each do |j|
      # S(i,j) = j * S(i-1,j) + S(i-1,j-1)
      dp[i][j] = (j * dp[i-1][j] + dp[i-1][j-1]) % MOD
    end
  end
  
  # k!を計算
  factorial_k = 1
  (1..k).each do |i|
    factorial_k = (factorial_k * i) % MOD
  end
  
  # 答えは S(n,k) * k!
  result = (dp[n][k] * factorial_k) % MOD
  return result
end

# 入力を読み取り
n, k = gets.split.map(&:to_i)

# 結果を出力
puts solve(n, k)
