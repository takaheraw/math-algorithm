def ring_contains_pattern
  # 入力を取得
  s = gets.chomp
  p = gets.chomp
  
  # リング状にするため文字列を2倍に結合
  ring = s + s
  
  # パターンが含まれているか確認
  if ring.include?(p)
    puts "Yes"
  else
    puts "No"
  end
end

ring_contains_pattern
