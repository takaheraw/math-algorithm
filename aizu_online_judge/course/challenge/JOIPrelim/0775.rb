n = gets.to_i
cards = gets.split.map(&:to_i)

card_set = cards.to_set

found = false
cards.each do |x|
  if card_set.include?(x + 3) && card_set.include?(x + 6)
    found = true
    break
  end
end

if found
  puts "Yes"
else
  puts "No"
end
