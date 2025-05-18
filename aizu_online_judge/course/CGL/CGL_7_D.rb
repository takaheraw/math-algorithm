#!/usr/bin/env ruby

# 入力を処理
cx, cy, r = gets.split.map(&:to_f)
q = gets.to_i

q.times do
  x1, y1, x2, y2 = gets.split.map(&:to_f)
  
  # 直線の方向ベクトル
  dx = x2 - x1
  dy = y2 - y1
  
  # 円の中心から直線への垂線の長さを計算
  # 垂線の長さ = |ax0 + by0 + c| / sqrt(a^2 + b^2)
  # 直線の方程式は ax + by + c = 0 の形式
  # 点を通る直線なので、(y - y1) = (dy/dx) * (x - x1)
  # これを ax + by + c = 0 の形式に変換
  # -dy * x + dx * y + (dy*x1 - dx*y1) = 0
  
  # 直線の方程式の係数
  a = -dy
  b = dx
  c = dy * x1 - dx * y1
  
  # 円の中心から直線への距離
  dist = (a * cx + b * cy + c).abs / Math.sqrt(a**2 + b**2)
  
  # 交点がない場合（この問題ではこのケースはないとされています）
  if dist > r
    next
  end
  
  # 円と直線の交点を計算
  # 円の中心から直線への垂線の足を求める
  t = -(a * cx + b * cy + c) / (a**2 + b**2)
  foot_x = cx + a * t
  foot_y = cy + b * t
  
  # 垂線の足からの距離を計算
  if dist == r
    # 接する場合（交点が1つ）
    puts "#{format("%.8f", foot_x)} #{format("%.8f", foot_y)} #{format("%.8f", foot_x)} #{format("%.8f", foot_y)}"
  else
    # 2つの交点がある場合
    # 垂線の足から交点までの距離
    d = Math.sqrt(r**2 - dist**2)
    
    # 直線の単位方向ベクトル
    len = Math.sqrt(dx**2 + dy**2)
    udx = dx / len
    udy = dy / len
    
    # 2つの交点の座標
    ix1 = foot_x + d * udx
    iy1 = foot_y + d * udy
    ix2 = foot_x - d * udx
    iy2 = foot_y - d * udy
    
    # 交点をソート（x座標が小さい順、x座標が同じなら y座標が小さい順）
    if ix1 < ix2 || (ix1 == ix2 && iy1 < iy2)
      puts "#{format("%.8f", ix1)} #{format("%.8f", iy1)} #{format("%.8f", ix2)} #{format("%.8f", iy2)}"
    else
      puts "#{format("%.8f", ix2)} #{format("%.8f", iy2)} #{format("%.8f", ix1)} #{format("%.8f", iy1)}"
    end
  end
end
