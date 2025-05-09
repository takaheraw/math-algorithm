# 多角形の面積計算プログラム
# 座標点が反時計回りに与えられると仮定します

# 多角形の面積を計算する関数
# 測量士の公式（ショーレスの公式とも呼ばれる）を使用
def calculate_polygon_area(points)
  n = points.length
  area = 0.0
  
  # 多角形の頂点をループ
  for i in 0...n
    j = (i + 1) % n  # 次の点（最後の点の次は最初の点）
    area += points[i][0] * points[j][1]
    area -= points[j][0] * points[i][1]
  end
  
  # 負の面積が出る場合（時計回りの場合）は絶対値を取る
  return (area.abs / 2.0)
end

# 入力処理
n = gets.to_i
points = []

n.times do
  x, y = gets.split.map(&:to_i)
  points << [x, y]
end

# 面積計算
area = calculate_polygon_area(points)

# 結果出力（小数点以下1桁で）
puts format("%.1f", area)
