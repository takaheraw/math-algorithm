def transformation
  # 初期文字列を取得
  str = gets.chomp

  # コマンドの数を取得
  q = gets.to_i

  q.times do
    # 各コマンドを読み込み、分割
    command = gets.chomp.split
    cmd_type = command[0]
    a = command[1].to_i
    b = command[2].to_i

    case cmd_type
    when "print"
      # aからbまでの部分文字列を出力
      puts str[a..b]
    when "reverse"
      # aからbまでの部分文字列を反転
      str[a..b] = str[a..b].reverse
    when "replace"
      # aからbまでの部分文字列を置換
      p = command[3]
      str[a..b] = p
    end
  end
end

transformation
