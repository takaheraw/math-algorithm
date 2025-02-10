n = gets.to_i

# 隣接行列を初期化
adj_matrix = Array.new(n) { Array.new(n, 0) }

n.times do
  input = gets.split.map(&:to_i)
  u = input[0] - 1       # 頂点IDを0始まりに変換
  k = input[1]           # 隣接頂点の数
  neighbors = input[2..] # 隣接頂点リスト

  neighbors.each do |v|
    adj_matrix[u][v - 1] = 1 # 隣接行列に辺を設定
  end
end

# 隣接行列を出力
adj_matrix.each do |row|
  puts row.join(" ")
end
