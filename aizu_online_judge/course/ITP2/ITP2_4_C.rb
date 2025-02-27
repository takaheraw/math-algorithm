n = gets.to_i
a = gets.split.map(&:to_i)
q = gets.to_i

q.times do
  b, e, t = gets.split.map(&:to_i)
  (0...(e - b)).each do |k|
    a[b + k], a[t + k] = a[t + k], a[b + k]
  end
end

puts a.join(" ")
