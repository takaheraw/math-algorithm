# Ruby program to print a chessboard pattern

while true
  h, w = gets.split.map(&:to_i)
  break if h == 0 && w == 0

  h.times do |i|
    if i.even?
      puts (['#', '.'] * (w / 2 + 1)).join[0, w]
    else
      puts (['.', '#'] * (w / 2 + 1)).join[0, w]
    end
  end
  puts
end
