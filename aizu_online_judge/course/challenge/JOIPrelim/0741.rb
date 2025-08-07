n = gets.to_i
s = gets.chomp

half_length = n / 2

first_half = s[0, half_length]
second_half = s[half_length, half_length]

if first_half == second_half
  puts "Yes"
else
  puts "No"
end
