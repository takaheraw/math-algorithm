n = gets.to_i
players = []

n.times do |i|
  c, x = gets.split.map(&:to_i)
  players << [c, x, i]  # [出身国, 座席位置, 元のインデックス]
end

players.sort_by! { |player| player[1] }

answers = Array.new(n)

n.times do |i|
  current_country = players[i][0]
  current_position = players[i][1]
  original_index = players[i][2]
  
  min_distance = Float::INFINITY
  
  (i - 1).downto(0) do |j|
    if players[j][0] != current_country
      distance = (current_position - players[j][1]).abs
      min_distance = [min_distance, distance].min
      break  # ソート済みなので最初に見つかった異なる国の選手が最も近い
    end
  end
  
  (i + 1).upto(n - 1) do |j|
    if players[j][0] != current_country
      distance = (current_position - players[j][1]).abs
      min_distance = [min_distance, distance].min
      break  # ソート済みなので最初に見つかった異なる国の選手が最も近い
    end
  end
  
  answers[original_index] = min_distance
end

answers.each do |answer|
  puts answer
end
