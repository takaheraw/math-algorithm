def calculate_distance
  # 入力を取得し、x1, y1, x2, y2 に分割
  x1, y1, x2, y2 = gets.split.map(&:to_f)

  # 距離を計算
  distance = Math.sqrt((x2 - x1)**2 + (y2 - y1)**2)

  # 結果を小数点以下8桁で出力
  puts format("%.8f", distance)
end

calculate_distance
