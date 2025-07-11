n = gets.to_i
s = gets.chomp

stroke_count = {
  'j' => 2,
  'o' => 1,
  'i' => 2
}

total_strokes = 0
s.each_char do |char|
  total_strokes += stroke_count[char]
end

# 結果を出力
puts total_strokes
