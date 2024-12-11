# Ruby program to print a frame made of '#' and '.'

while true
  h, w = gets.split.map(&:to_i)
  break if h == 0 && w == 0

  h.times do |i|
    if i == 0 || i == h - 1
      puts '#' * w
    else
      puts '#' + '.' * (w - 2) + '#'
    end
  end
  puts
end
