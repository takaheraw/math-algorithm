# 入力
n = gets.to_i
a = gets.split.map(&:to_i)

# 答えを求める
cnt = Hash.new(0)
a.each { |num| cnt[num] += 1 }

answer = 0
(1..49_999).each { |i| answer += cnt[i] * cnt[100_000 - i] }

answer += cnt[50_000] * (cnt[50_000] - 1) / 2

# 出力
puts answer
