# 入力を読み込む
n = gets.to_i
a = gets.split.map(&:to_i)
m = gets.to_i
b = gets.split.map(&:to_i)

# 配列Aと配列Bの差分を計算
# 差分とはAに属し、Bに属さない要素の集合
difference = []
a_index = 0
b_index = 0

while a_index < n
  if b_index >= m || a[a_index] < b[b_index]
    # Bにa[a_index]が存在しない場合、差分に追加
    difference << a[a_index]
    a_index += 1
  elsif a[a_index] > b[b_index]
    # a[a_index]がb[b_index]より大きい場合、bのインデックスを進める
    b_index += 1
  else
    # a[a_index]とb[b_index]が等しい場合、両方のインデックスを進める
    a_index += 1
    b_index += 1
  end
end

# 結果を出力
difference.each do |num|
  puts num
end
