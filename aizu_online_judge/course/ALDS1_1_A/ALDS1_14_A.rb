# 入力の読み込み
text = gets.chomp
pattern = gets.chomp

# パターンの長さを取得
pattern_length = pattern.length

# text の各インデックスに対してパターンと比較
(0..(text.length - pattern_length)).each do |i|
  # 文字列 text の i から pattern_length 文字を抽出して比較
  puts i if text[i, pattern_length] == pattern
end
