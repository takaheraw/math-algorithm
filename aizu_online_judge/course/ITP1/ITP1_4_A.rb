# Ruby program to calculate integer division, remainder, and real division

a, b = gets.split.map(&:to_i)

d = a / b
r = a % b
f = a.to_f / b

puts "#{d} #{r} #{'%.5f' % f}"
