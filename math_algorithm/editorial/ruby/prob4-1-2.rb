# 入力
n = gets.to_i
x = Array.new(n, 0)
y = Array.new(n, 0)
n.times do |i|
  x[i], y[i] = gets.split.map(&:to_i)
end

# 全探索
answer = 1_000_000_000.0
(0...n).each do |i|
  (i + 1...n).each do |j|
    dist = Math.sqrt((x[i] - x[j])**2 + (y[i] - y[j])**2)
    answer = [answer, dist].min
  end
end

# 答えの出力
puts '%.12f' % answer
