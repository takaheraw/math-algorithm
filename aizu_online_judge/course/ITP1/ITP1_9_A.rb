def count_word_occurrences
  # 最初の行で単語 W を取得
  w = gets.chomp.downcase
  
  count = 0
  
  loop do
    # テキスト T の各行を取得
    line = gets.chomp
    break if line == "END_OF_TEXT"
    
    # 各行をスペースで分割し、単語ごとにチェック
    words = line.split
    count += words.count { |word| word.downcase == w }
  end
  
  # 結果を出力
  puts count
end

count_word_occurrences
