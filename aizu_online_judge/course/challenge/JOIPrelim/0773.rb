n = gets.to_i
s = gets.chomp

first_char = s[0]

if s.chars.all? { |char| char == first_char }
  puts "Yes"
else
  puts "No"
end
