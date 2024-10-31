l = 1.0
r = 2.0
repeats = 20

(1..repeats).each do |i|
  m = (l + r) / 2.0
  if m * m < 2.0
    l = m
  else
    r = m
  end
  puts "Step ##{i}: m = %.12f" % m
end
