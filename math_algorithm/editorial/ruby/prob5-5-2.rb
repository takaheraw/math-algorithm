# 入力
n = gets.to_i
a = Array.new(n, 0.0)
b = Array.new(n, 0.0)
c = Array.new(n, 0.0)

n.times do |i|
  a[i], b[i], c[i] = gets.split.map(&:to_f)
end

# 交点を全探索
answer = 0.0
(0..n - 1).each do |i|
  (i + 1..n - 1).each do |j|
    # 交点を持たない場合
    next if a[i] * b[j] == a[j] * b[i]

    # i 番目の直線（条件式の境界）と j 番目の直線（条件式の境界）の交点を求める
    px = (c[i] * b[j] - c[j] * b[i]) / (a[i] * b[j] - a[j] * b[i])
    py = (c[i] * a[j] - c[j] * a[i]) / (b[i] * a[j] - b[j] * a[i])

    # 座標 (px, py) が N 個の条件すべてを満たすか調べる
    # C++ のコードにおける check 関数に相当
    ret = true
    (0..n - 1).each do |k|
      ret = false if a[k] * px + b[k] * py > c[k]
    end

    answer = [answer, px + py].max if ret == true
  end
end

# 出力
puts '%.12f' % answer
