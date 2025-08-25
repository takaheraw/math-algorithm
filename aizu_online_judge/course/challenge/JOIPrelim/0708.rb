# 標準入力から X, Y, Z を読み込み
x = gets.to_i
y = gets.to_i
z = gets.to_i

total_time = x + y

time_limit = z + 0.5

if total_time <= time_limit
  puts 1
else
  puts 0
end
