# Ruby program to find the missing cards in a deck

# Create a complete deck of cards
suits = ['S', 'H', 'C', 'D']
ranks = (1..13).to_a
complete_deck = suits.product(ranks)

# Read input
n = gets.to_i
cards_present = []

n.times do
  suit, rank = gets.split
  cards_present << [suit, rank.to_i]
end

# Find the missing cards
missing_cards = complete_deck - cards_present

# Print the missing cards in the required order
missing_cards.each do |suit, rank|
  puts "#{suit} #{rank}"
end
