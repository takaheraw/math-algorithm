n = gets.to_i
groups = gets.split.map(&:to_i)

count = Hash.new(0)
groups.each do |group|
  count[group] += 1
end

answer = nil
(1..n).each do |i|
  if count[i] == 1
    answer = i
    break
  end
end

puts answer
