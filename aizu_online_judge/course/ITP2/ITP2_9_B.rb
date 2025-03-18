# 入力の読み取り
n = gets.to_i
a_set = gets.split.map(&:to_i)
m = gets.to_i
b_set = gets.split.map(&:to_i)

# 共通部分（交差）を計算し、昇順にソート
intersection = a_set & b_set

# 結果を出力（各要素を1行に1つずつ）
intersection.each do |element|
  puts element
end
