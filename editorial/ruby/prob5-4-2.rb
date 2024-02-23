# 入力
h, w = gets.split.map(&:to_i)
a = Array.new(h) { Array.new(w) }

h.times do |i|
  a[i] = gets.split.map(&:to_i)
end

# 行の総和を計算する
gyou = Array.new(h, 0)
h.times do |i|
  w.times do |j|
    gyou[i] += a[i][j]
  end
end

# 列の総和を計算する
retu = Array.new(w, 0)
w.times do |j|
  h.times do |i|
    retu[j] += a[i][j]
  end
end

# 各マスに対する答えを計算する
answer = Array.new(h) { Array.new(w, 0) }
h.times do |i|
  w.times do |j|
    answer[i][j] = gyou[i] + retu[j] - a[i][j]
  end
end

# 出力
answer.each do |row|
  puts row.join(' ')
end
