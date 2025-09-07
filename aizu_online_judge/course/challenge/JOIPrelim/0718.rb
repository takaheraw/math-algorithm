n, m = gets.split.map(&:to_i)

ball_position = Array.new(n + 1)

(1..n).each do |i|
  ball_position[i] = i
end

m.times do
  x, y = gets.split.map(&:to_i)
  ball_position[x] = y
end

(1..n).each do |i|
  puts ball_position[i]
end
