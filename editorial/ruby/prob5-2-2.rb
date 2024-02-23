# 入力
n = gets.to_i

# n = 2^k-1 の形で表せるかどうかを調べる
flag = false
(1..60).each do |i|
  flag = true if n == (2**i) - 1
end

if flag == true
  puts 'Second'
else
  puts 'First'
end
