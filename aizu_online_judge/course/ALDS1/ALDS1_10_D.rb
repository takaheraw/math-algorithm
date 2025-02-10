def optimal_bst(n, p, q)
  # 定義
  e = Array.new(n + 2) { Array.new(n + 1, 0.0) }
  w = Array.new(n + 2) { Array.new(n + 1, 0.0) }
  root = Array.new(n + 1) { Array.new(n + 1, 0) }

  # 初期化
  (1..n + 1).each do |i|
    e[i][i - 1] = q[i - 1]
    w[i][i - 1] = q[i - 1]
  end

  # ダイナミックプログラミングによる計算
  (1..n).each do |length|
    (1..n - length + 1).each do |i|
      j = i + length - 1
      e[i][j] = Float::INFINITY
      w[i][j] = w[i][j - 1] + p[j - 1] + q[j]

      (i..j).each do |r|
        t = e[i][r - 1] + e[r + 1][j] + w[i][j]
        if t < e[i][j]
          e[i][j] = t
          root[i][j] = r
        end
      end
    end
  end

  # 結果を返す
  e[1][n]
end

# 入力の受け取り
n = gets.to_i
p = gets.split.map(&:to_f)
q = gets.split.map(&:to_f)

# 出力
puts format('%.8f', optimal_bst(n, p, q))
