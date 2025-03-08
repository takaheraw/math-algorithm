def lower_bound(a, k)
  lo = 0
  hi = a.size
  while lo < hi
    mid = (lo + hi) / 2
    if a[mid] < k
      lo = mid + 1
    else
      hi = mid
    end
  end
  lo
end

def upper_bound(a, k)
  lo = 0
  hi = a.size
  while lo < hi
    mid = (lo + hi) / 2
    if a[mid] <= k
      lo = mid + 1
    else
      hi = mid
    end
  end
  lo
end

n = gets.to_i
a = gets.split.map(&:to_i)
q = gets.to_i

q.times do
  k = gets.to_i
  l = lower_bound(a, k)
  r = upper_bound(a, k)
  puts "#{l} #{r}"
end
