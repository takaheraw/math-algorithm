def count_characters
  # 標準入力から複数行を取得し、すべて結合して1つの文字列にする
  input = gets.chomp

  # アルファベットごとにカウントして出力
  ('a'..'z').each do |char|
    count = input.count(char)
    puts "#{char} : #{count}"
  end
end

count_characters
