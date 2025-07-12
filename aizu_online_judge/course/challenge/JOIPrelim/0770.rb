x, n = gets.split.map(&:to_i)

count = 0

while x < n
  r = x % 3
  
  case r
  when 0
    x = x + 1
  when 1
    x = x * 2
  when 2
    x = x * 3
  end
  
  count += 1
end

puts count
