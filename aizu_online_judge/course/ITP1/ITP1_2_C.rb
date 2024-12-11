# Ruby program to sort three integers in ascending order

numbers = gets.split.map(&:to_i).sort
puts numbers.join(" ")
