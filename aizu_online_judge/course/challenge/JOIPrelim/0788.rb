def count_digits(n)
  case n
  when 0...10
    1
  when 10...100
    2
  when 100...1000
    3
  when 1000...10000
    4
  when 10000...100000
    5
  when 100000...1000000
    6
  when 1000000...10000000
    7
  when 10000000...100000000
    8
  when 100000000...1000000000
    9
  when 1000000000...10000000000
    10
  else
    n.to_s.length
  end
end

n = gets.to_i
a = gets.split.map(&:to_i)
b = gets.split.map(&:to_i)

total_digits = 0

n.times do |i|
  n.times do |j|
    value = a[i] + b[j]
    total_digits += count_digits(value)
  end
end

puts total_digits
