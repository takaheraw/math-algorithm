# 2つの円の交差面積を計算
c1x, c1y, c1r = gets.split.map(&:to_f)
c2x, c2y, c2r = gets.split.map(&:to_f)

# 円の中心間の距離
d = Math.sqrt((c1x - c2x) ** 2 + (c1y - c2y) ** 2)

# 交差面積の計算
def intersection_area(r1, r2, d)
  # 円が重ならない場合
  return 0.0 if d >= r1 + r2
  
  # 一方の円が他方に完全に含まれる場合
  if d <= (r1 - r2).abs
    # 小さい円の面積を返す
    return Math::PI * [r1, r2].min ** 2
  end
  
  # 部分的に重なる場合
  # 各円について、交点から中心への角度を計算
  theta1 = 2 * Math.acos((r1 * r1 + d * d - r2 * r2) / (2 * r1 * d))
  theta2 = 2 * Math.acos((r2 * r2 + d * d - r1 * r1) / (2 * r2 * d))
  
  # 各扇形の面積から三角形の面積を引く
  area1 = 0.5 * r1 * r1 * (theta1 - Math.sin(theta1))
  area2 = 0.5 * r2 * r2 * (theta2 - Math.sin(theta2))
  
  area1 + area2
end

result = intersection_area(c1r, c2r, d)
printf("%.20f\n", result)
