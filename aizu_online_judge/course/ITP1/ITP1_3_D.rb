# Ruby program to count the number of divisors of c between a and b

a, b, c = gets.split.map(&:to_i)
count = 0

(a..b).each do |i|
  count += 1 if c % i == 0
end

puts count
