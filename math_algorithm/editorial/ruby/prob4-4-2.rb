n = 1000
answer = 0.0

n.times do |i|
  x = 1.0 * (2 * i + 1) / (2 * n)
  value = 2.0**(x * x)
  answer += value
end

puts format('%.12f', (answer / n))
