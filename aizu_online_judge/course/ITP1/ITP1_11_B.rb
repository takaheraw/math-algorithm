# 入力を受け取る
faces = gets.split.map(&:to_i) # サイコロの6面の整数
q = gets.to_i # クエリの数

# サイコロの状態管理を作成
# faces 配列の順番: [Top, Bottom, Front, Back, Left, Right]
dice = [
  faces[0], # Top
  faces[5], # Bottom
  faces[1], # Front
  faces[4], # Back
  faces[2], # Left
  faces[3]  # Right
]

# サイコロを回転させるメソッド
def roll(dice, direction)
  top, bottom, front, back, left, right = dice
  case direction
  when :north
    [front, back, bottom, top, left, right]
  when :south
    [back, front, top, bottom, left, right]
  when :west
    [left, right, front, back, bottom, top]
  when :east
    [right, left, front, back, top, bottom]
  end
end

# トップ面とフロント面から右面を探す
def find_right_face(dice, top_face, front_face)
  # すべての方向を試す
  4.times do
    # 現在の状態で正しい面が見つかるかチェック
    if dice[0] == top_face && dice[2] == front_face
      return dice[5] # 右面を返す
    end
    # 横回転を試す
    dice = roll(dice, :east)
  end

  # 上面を変える（南側を上にする）
  dice = roll(dice, :south)
  4.times do
    if dice[0] == top_face && dice[2] == front_face
      return dice[5]
    end
    dice = roll(dice, :east)
  end

  # 上面を変える（北側を上にする）
  dice = roll(dice, :north)
  4.times do
    if dice[0] == top_face && dice[2] == front_face
      return dice[5]
    end
    dice = roll(dice, :east)
  end
end

# クエリを処理
q.times do
  top_face, front_face = gets.split.map(&:to_i)
  puts find_right_face(dice, top_face, front_face)
end
