n = gets.to_i
a = gets.split.map(&:to_i)
m = gets.to_i
b = gets.split.map(&:to_i)

puts (b <=> a) > 0 ? 1 : 0
