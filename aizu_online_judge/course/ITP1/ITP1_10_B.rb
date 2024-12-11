def triangle_properties
  # 入力を取得し、a, b, Cに分割
  a, b, c = gets.split.map(&:to_f)

  # ラジアンに変換 (角度からラジアンへ)
  angle_c = c * Math::PI / 180

  # 三角形の面積 S
  s = 0.5 * a * b * Math.sin(angle_c)

  # 3番目の辺の長さを余弦定理で計算
  c_side = Math.sqrt(a**2 + b**2 - 2 * a * b * Math.cos(angle_c))

  # 周長 L
  l = a + b + c_side

  # 高さ h
  h = (2 * s) / a

  # 結果を小数点以下8桁で出力
  puts format("%.8f %.8f %.8f", s, l, h)
end

triangle_properties
