n = gets.to_i
arr = gets.split.map(&:to_i)
result = []
arr.each do |num|
  if result.empty? || result.last != num
    result << num
  end
end
puts result.join(" ")
