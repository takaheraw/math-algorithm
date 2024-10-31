# 入力
n = gets.chomp.to_i
a = gets.chomp.split.map(&:to_i)

# 答えの計算
answer = 0
a.each { |num| answer += num }

# 出力
puts answer % 100
