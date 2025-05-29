def edit_distance(s1, s2)
  m, n = s1.length, s2.length
  
  # DPテーブルを初期化
  dp = Array.new(m + 1) { Array.new(n + 1, 0) }
  
  # ベースケース：空文字列からの変換
  (0..m).each { |i| dp[i][0] = i }
  (0..n).each { |j| dp[0][j] = j }
  
  # DPテーブルを埋める
  (1..m).each do |i|
    (1..n).each do |j|
      if s1[i-1] == s2[j-1]
        # 文字が同じ場合、コストは増加しない
        dp[i][j] = dp[i-1][j-1]
      else
        # 文字が異なる場合、3つの操作の最小値を選択
        dp[i][j] = [
          dp[i-1][j] + 1,     # 削除
          dp[i][j-1] + 1,     # 挿入
          dp[i-1][j-1] + 1    # 置換
        ].min
      end
    end
  end
  
  dp[m][n]
end

# 入力を読み取り
s1 = gets.chomp
s2 = gets.chomp

# 編集距離を計算して出力
puts edit_distance(s1, s2)
