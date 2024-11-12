# Ruby program to find the minimum, maximum, and sum of a sequence of integers

n = gets.to_i
array = gets.split.map(&:to_i)

min = array.min
max = array.max
sum = array.sum

puts "#{min} #{max} #{sum}"
