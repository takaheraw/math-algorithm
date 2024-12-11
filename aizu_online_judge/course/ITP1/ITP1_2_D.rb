# Ruby program to check if a circle is inside a rectangle

w, h, x, y, r = gets.split.map(&:to_i)

if x - r >= 0 && x + r <= w && y - r >= 0 && y + r <= h
  puts "Yes"
else
  puts "No"
end
