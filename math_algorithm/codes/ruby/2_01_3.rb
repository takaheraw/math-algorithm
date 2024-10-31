n = gets.chomp.to_i
a = gets.chomp.split.map(&:to_i)
answer = 0

a.each do |item|
  answer += item
end

puts answer
