# Ruby program to evaluate student grades

while true
  m, f, r = gets.split.map(&:to_i)
  break if m == -1 && f == -1 && r == -1

  if m == -1 || f == -1
    puts "F"
    next
  end

  total = m + f

  case total
  when 80..Float::INFINITY
    puts "A"
  when 65...80
    puts "B"
  when 50...65
    puts "C"
  when 30...50
    if r >= 50
      puts "C"
    else
      puts "D"
    end
  else
    puts "F"
  end
end
