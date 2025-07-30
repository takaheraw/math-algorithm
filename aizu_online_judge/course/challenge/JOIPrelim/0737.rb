n = gets.to_i
s = gets.chomp

current_box = 1
box3_count = 0

s.each_char do |char|
  if char == 'L'
    current_box = [current_box - 1, 1].max
  else # char == 'R'
    current_box = [current_box + 1, 3].min
  end
  
  if current_box == 3
    box3_count += 1
  end
end

puts box3_count
