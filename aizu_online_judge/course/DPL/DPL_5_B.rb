MOD = 10**9 + 7

def solve(n, k)
  # n個のボールをk個の箱に入れる
  # 各箱には最大1個のボールしか入らない
  
  # n > k の場合、すべてのボールを入れることができない
  return 0 if n > k
  
  # n <= k の場合、k個の箱からn個を選んで順列を作る
  # P(k, n) = k! / (k-n)!
  
  result = 1
  (k - n + 1..k).each do |i|
    result = (result * i) % MOD
  end
  
  result
end

# 入力読み込み
n, k = gets.split.map(&:to_i)

# 解答出力
puts solve(n, k)
