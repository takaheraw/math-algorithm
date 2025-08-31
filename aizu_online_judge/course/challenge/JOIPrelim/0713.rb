n = gets.to_i
s = gets.chomp

result = []

(n - 1).times do |i|
  next_char = s[i + 1]
  
  if next_char == 'J'
    result << s[i]
  end
end

result.each do |char|
  puts char
end
