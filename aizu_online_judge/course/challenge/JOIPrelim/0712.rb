input = gets.split.map(&:to_i)
a, b = input[0], input[1]

result = (a + b - 1) % 12 + 1

puts result
