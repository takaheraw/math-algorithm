# Ruby program to calculate the area and circumference of a circle

r = gets.to_f

area = Math::PI * r**2
circumference = 2 * Math::PI * r

puts "#{'%.6f' % area} #{'%.6f' % circumference}"
