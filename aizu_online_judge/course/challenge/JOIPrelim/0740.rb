a, b = gets.split.map(&:to_i)

# 三方比較を実行
if a < b
  puts -1
elsif a == b
  puts 0
else
  puts 1
end
