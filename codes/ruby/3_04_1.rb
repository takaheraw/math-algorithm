# 入力
n = gets.to_i
b = gets.chomp.split.map(&:to_i)
r = gets.chomp.split.map(&:to_i)

# 答えの計算
blue = 0.0
red = 0.0
n.times do |i|
  blue += b[i].to_f / n
  red += r[i].to_f / n
end

# 出力
puts format('%.12f', blue + red)
