def shuffle_deck
  loop do
    # デッキ文字列を取得
    deck = gets.chomp
    break if deck == "-" # 終了条件

    # シャッフル回数を取得
    m = gets.to_i
    m.times do
      # 各シャッフルにおける h を取得
      h = gets.to_i
      # デッキの先頭 h 文字を末尾に移動
      deck = deck[h..] + deck[0...h]
    end

    # 結果を出力
    puts deck
  end
end

shuffle_deck
