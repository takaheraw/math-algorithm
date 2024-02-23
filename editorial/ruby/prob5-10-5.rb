# 入力
a, b, c = gets.split.map(&:to_i)

# c = 1 のときの場合分け
if c == 1
  puts 'No'
  exit
end

# 右辺の計算（c の b 乗）
v = 1
b.times do
  v *= c
  if a < v
    puts 'Yes'
    exit
  end
end

# 出力（No の場合）
puts 'No'
