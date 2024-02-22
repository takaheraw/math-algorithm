# 入力
x1, y1, r1 = gets.split.map(&:to_f)
x2, y2, r2 = gets.split.map(&:to_f)

# 円の中心間距離を求める
d = Math.sqrt((x1 - x2)**2 + (y1 - y2)**2)

# 答えを出力
if d < (r1 - r2).abs
  puts '1'
elsif d == (r1 - r2).abs
  puts '2'
elsif d < (r1 + r2)
  puts '3'
elsif d == (r1 + r2)
  puts '4'
else
  puts '5'
end
