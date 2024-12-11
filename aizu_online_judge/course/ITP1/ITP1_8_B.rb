# Ruby program to calculate the sum of digits of an integer

while true
  x = gets.chomp
  break if x == "0"

  # Calculate the sum of digits
  sum_of_digits = x.chars.map(&:to_i).sum

  # Print the result
  puts sum_of_digits
end
