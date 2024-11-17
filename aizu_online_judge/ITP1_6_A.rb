# Ruby program to print a sequence in reverse order

n = gets.to_i
sequence = gets.split.map(&:to_i)

puts sequence.reverse.join(" ")
