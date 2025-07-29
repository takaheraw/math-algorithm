n = gets.to_i

tens_digit = n / 10
ones_digit = n % 10

if tens_digit == ones_digit
  puts 1
else
  puts 0
end
