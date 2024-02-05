# 入力（たとえば N = 5, A = [3, 1, 4, 1, 5] を入力したとする）
n = gets.to_i
a = gets.chomp.split.map(&:to_i)

# 配列 a 全体をソートする
a.sort!

# 出力（1, 1, 3, 4, 5 の順に出力される）
a.each do |element|
  puts element
end
