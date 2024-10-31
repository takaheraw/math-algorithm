# 入力
h, w = gets.split.map(&:to_i)

# 場合分け
if h == 1 || w == 1
  puts 1
else
  puts (h * w + 1) / 2
end
