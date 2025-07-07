n = gets.to_i
s = gets.chomp
t = gets.chomp

hamming_distance = 0
n.times do |i|
  if s[i] != t[i]
    hamming_distance += 1
  end
end

puts hamming_distance
