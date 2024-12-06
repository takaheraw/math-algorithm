def minkowski_distance
  # 次元数 n を取得
  n = gets.to_i

  # ベクトル x, y を取得
  x = gets.split.map(&:to_i)
  y = gets.split.map(&:to_i)

  # p = 1 (マンハッタン距離)
  d1 = x.zip(y).sum { |xi, yi| (xi - yi).abs }

  # p = 2 (ユークリッド距離)
  d2 = Math.sqrt(x.zip(y).sum { |xi, yi| (xi - yi).abs**2 })

  # p = 3
  d3 = (x.zip(y).sum { |xi, yi| (xi - yi).abs**3 })**(1.0 / 3)

  # p = ∞ (チェビシェフ距離)
  d_inf = x.zip(y).map { |xi, yi| (xi - yi).abs }.max

  # 結果を小数点以下6桁で出力
  puts format("%.6f", d1)
  puts format("%.6f", d2)
  puts format("%.6f", d3)
  puts format("%.6f", d_inf)
end

minkowski_distance
