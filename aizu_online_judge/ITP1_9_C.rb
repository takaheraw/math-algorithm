def card_game
  # カードの枚数を取得
  n = gets.to_i
  
  # 初期スコアを設定
  taro_score = 0
  hanako_score = 0
  
  # n回のターンを処理
  n.times do
    taro_card, hanako_card = gets.split
    if taro_card > hanako_card
      taro_score += 3
    elsif taro_card < hanako_card
      hanako_score += 3
    else
      taro_score += 1
      hanako_score += 1
    end
  end
  
  # 最終スコアを出力
  puts "#{taro_score} #{hanako_score}"
end

card_game
