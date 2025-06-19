MOD = 10**9 + 7

# 入力を読み取り
n, k = gets.split.map(&:to_i)

# n > k の場合、全てのボールを箱に入れることができない
# n ≤ k の場合、区別できない箱なので方法は1通り
if n > k
  puts 0
else
  puts 1
end
