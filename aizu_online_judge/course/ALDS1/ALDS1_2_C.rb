def bubble_sort(cards)
  n = cards.size
  (0...n).each do |i|
    (n-1).downto(i+1) do |j|
      if cards[j][1].to_i < cards[j-1][1].to_i
        cards[j], cards[j-1] = cards[j-1], cards[j]
      end
    end
  end
  cards
end

def selection_sort(cards)
  n = cards.size
  (0...n).each do |i|
    mini = i
    (i...n).each do |j|
      if cards[j][1].to_i < cards[mini][1].to_i
        mini = j
      end
    end
    cards[i], cards[mini] = cards[mini], cards[i] unless i == mini
  end
  cards
end

def is_stable(original, sorted)
  value_positions = Hash.new { |h, k| h[k] = [] }
  original.each_with_index { |card, index| value_positions[card[1].to_i] << index }

  sorted.each_with_index do |card, index|
    expected_index = value_positions[card[1].to_i].shift
    return false unless index == expected_index
  end
  true
end

# 入力の読み取り
n = gets.to_i
cards = gets.split

# バブルソート
bubble_sorted = bubble_sort(cards.clone)
puts bubble_sorted.join(" ")
puts is_stable(cards, bubble_sorted) ? "Stable" : "Not stable"

# 選択ソート
selection_sorted = selection_sort(cards.clone)
puts selection_sorted.join(" ")
puts is_stable(cards, selection_sorted) ? "Stable" : "Not stable"
