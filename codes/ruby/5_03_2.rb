# 入力 → 数列の要素の総和 S を求める
n, k = gets.split.map(&:to_i)
a = gets.split.map(&:to_i)
s = a.sum

# 答えの出力
if s % 2 != k % 2
  puts 'No'
elsif s > k
  puts 'No'
else
  puts 'Yes'
end
