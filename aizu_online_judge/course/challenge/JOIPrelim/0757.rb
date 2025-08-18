n = gets.to_i
s = gets.chomp

if s[-1] == 'G'
  puts s[0...-1]
else
  puts s + 'G'
end
