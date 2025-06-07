# 入力を読み込み
h, w = gets.split.map(&:to_i)
matrix = []
h.times do
  row = gets.split.map(&:to_i)
  matrix << row
end

# DP配列を初期化
# dp[i][j] = 位置(i,j)を右下角とする最大正方形の一辺の長さ
dp = Array.new(h) { Array.new(w, 0) }

max_size = 0

# DPテーブルを埋める
(0...h).each do |i|
  (0...w).each do |j|
    if matrix[i][j] == 0
      if i == 0 || j == 0
        # 最初の行または列の場合
        dp[i][j] = 1
      else
        # それ以外の場合は、左、上、左上の最小値 + 1
        dp[i][j] = [dp[i-1][j], dp[i][j-1], dp[i-1][j-1]].min + 1
      end
      # 最大サイズを更新
      max_size = [max_size, dp[i][j]].max
    else
      # 1の場合は正方形を作れない
      dp[i][j] = 0
    end
  end
end

# 面積（正方形のサイズの2乗）を出力
puts max_size * max_size
