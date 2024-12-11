# Ruby program to print a rectangle made of '#'

while true
  h, w = gets.split.map(&:to_i)
  break if h == 0 && w == 0

  h.times { puts '#' * w }
  puts
end
