def partition(cards, p, r)
  pivot = cards[r]  # ピボット要素
  i = p - 1

  (p...r).each do |j|
    if cards[j][1] <= pivot[1]
      i += 1
      cards[i], cards[j] = cards[j], cards[i] # 要素を交換
    end
  end

  cards[i + 1], cards[r] = cards[r], cards[i + 1] # ピボットを正しい位置に
  i + 1
end

def quicksort(cards, p, r)
  if p < r
    q = partition(cards, p, r)
    quicksort(cards, p, q - 1)
    quicksort(cards, q + 1, r)
  end
end

# 入力の読み込み
n = gets.to_i
cards = []
n.times do
  suit, value = gets.split
  cards << [suit, value.to_i]
end

# 元の順序を記録
original_cards = cards.dup

# クイックソートを実行
quicksort(cards, 0, n - 1)

# 安定性の確認
stable = true
value_to_suits = Hash.new { |h, k| h[k] = [] }
original_cards.each { |suit, value| value_to_suits[value] << suit }
cards.each do |suit, value|
  stable = false if value_to_suits[value].shift != suit
end

puts stable ? "Stable" : "Not stable"
cards.each { |suit, value| puts "#{suit} #{value}" }
