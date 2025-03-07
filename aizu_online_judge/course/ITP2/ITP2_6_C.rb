n = gets.to_i
a = gets.split.map(&:to_i)
q = gets.to_i

q.times do
  k = gets.to_i
  lo = 0
  hi = n
  while lo < hi
    mid = (lo + hi) / 2
    if a[mid] < k
      lo = mid + 1
    else
      hi = mid
    end
  end
  puts lo
end
