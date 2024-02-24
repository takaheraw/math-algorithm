visitors = [62, 65, 41, 13, 20, 11, 18, 44, 53, 12, 18, 17, 14, 10, 39]
accumulates = Array.new(visitors.length + 1, 0)
(1..visitors.length).each do |i|
  accumulates[i] = accumulates[i - 1] + visitors[i - 1]
end
targets = [[2, 4], [4, 13]]
targets.each do |l, r|
  puts "#{l}日目から#{r}日目までの来場者数"
  puts accumulates[r] - accumulates[l - 1]
end
