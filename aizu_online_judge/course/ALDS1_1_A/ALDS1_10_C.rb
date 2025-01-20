def lcs_length(x, y)
  m = x.length
  n = y.length

  # DPテーブルの初期化
  dp = Array.new(m + 1) { Array.new(n + 1, 0) }

  # DPループ
  (1..m).each do |i|
    (1..n).each do |j|
      if x[i - 1] == y[j - 1]
        dp[i][j] = dp[i - 1][j - 1] + 1
      else
        dp[i][j] = [dp[i - 1][j], dp[i][j - 1]].max
      end
    end
  end

  dp[m][n]
end

# 入力の処理
q = gets.to_i
results = []

q.times do
  x = gets.strip
  y = gets.strip
  results << lcs_length(x, y)
end

# 結果の出力
results.each { |result| puts result }
