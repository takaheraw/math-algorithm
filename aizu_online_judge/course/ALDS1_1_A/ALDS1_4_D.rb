def check(p, n, k, w)
  trucks = 1
  current_weight = 0
  w.each do |weight|
    if current_weight + weight > p
      trucks += 1
      current_weight = weight
    else
      current_weight += weight
    end
  end
  trucks <= k
end

n, k = gets.split.map(&:to_i)
w = []
n.times do
  w << gets.to_i
end

left = w.max
right = w.sum

while left <= right
  mid = (left + right) / 2
  if check(mid, n, k, w)
    right = mid - 1
  else
    left = mid + 1
  end
end

puts left
