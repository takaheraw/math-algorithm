# 入力を受け取る
n = gets.to_i
A = gets.split.map(&:to_i)
q = gets.to_i

# 各クエリを処理する
q.times do
  b, m, e = gets.split.map(&:to_i)

  # 回転操作を行う
  rotated = A[b..e-1]
  new_rotated = Array.new(rotated.length)

  # 指定された位置に要素を移動
  (0...rotated.length).each do |k|
    new_position = (k + (e - m)) % rotated.length
    new_rotated[new_position] = rotated[k]
  end

  # 回転後の部分を元の配列に反映
  A[b..e-1] = new_rotated
end

# 結果を出力
puts A.join(" ")
