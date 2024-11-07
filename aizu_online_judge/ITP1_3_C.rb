# Ruby program to read pairs of integers and print them in ascending order

while true
  x, y = gets.split.map(&:to_i)
  break if x == 0 && y == 0

  if x > y
    puts "#{y} #{x}"
  else
    puts "#{x} #{y}"
  end
end
