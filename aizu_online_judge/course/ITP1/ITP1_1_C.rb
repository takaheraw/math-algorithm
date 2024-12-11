a, b = gets.split.map(&:to_i)
area = a * b
perimeter = 2 * (a + b)
puts "#{area} #{perimeter}"
