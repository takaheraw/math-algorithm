n = gets.to_i

a = Array.new(n + 1)
a[1] = 1
a[2] = 1
(3..n).each do |i|
  a[i] = a[i - 1] + a[i - 2]
end

puts a[n] % 1_000_000_007
