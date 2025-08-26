n = gets.to_i
s = gets.chomp

unique_chars = s.chars.to_set

if unique_chars.size >= 3
  puts "Yes"
else
  puts "No"
end
