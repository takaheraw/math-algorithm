n = gets.to_i
a = gets.split.map(&:to_i)
m = gets.to_i
b = gets.split.map(&:to_i)

b_set = b.to_set

score = 0

n.times do |i|
  score += a[i]
  
  if b_set.include?(score)
    score = 0
  end
end

puts score
