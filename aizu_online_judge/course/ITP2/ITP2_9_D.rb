# 標準入力から値を読み込む
n = gets.to_i
a_set = gets.split.map(&:to_i).to_set
m = gets.to_i
b_set = gets.split.map(&:to_i).to_set

# 対称差を計算する
# (A和B) - (A交B) = (A-B)和(B-A)
symmetric_difference = (a_set - b_set) | (b_set - a_set)

# 昇順でソートして出力
symmetric_difference.sort.each do |element|
  puts element
end
