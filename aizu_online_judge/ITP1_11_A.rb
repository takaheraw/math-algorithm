def roll_dice
  # ダイスの各面に割り当てられた整数を取得
  faces = gets.split.map(&:to_i)

  # コマンド列を取得
  commands = gets.chomp

  # ダイスの初期状態を定義 (面のラベルに対応)
  # top, front, right, left, back, bottom
  dice = [0, 1, 2, 3, 4, 5]

  # ロール動作を定義
  commands.each_char do |command|
    case command
    when 'E' # East
      dice = [dice[3], dice[1], dice[0], dice[5], dice[4], dice[2]]
    when 'W' # West
      dice = [dice[2], dice[1], dice[5], dice[0], dice[4], dice[3]]
    when 'N' # North
      dice = [dice[1], dice[5], dice[2], dice[3], dice[0], dice[4]]
    when 'S' # South
      dice = [dice[4], dice[0], dice[2], dice[3], dice[5], dice[1]]
    end
  end

  # 最終状態のtop面に対応する値を出力
  puts faces[dice[0]]
end

roll_dice
