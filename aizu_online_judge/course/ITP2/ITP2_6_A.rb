n = gets.to_i
a = gets.split.map(&:to_i)
q = gets.to_i

q.times do
  k = gets.to_i
  # a.bsearchで、条件を満たす最初の要素を取得し、
  # それがkと等しいかどうかで存在チェックを行う
  res = a.bsearch { |x| x >= k }
  puts res == k ? 1 : 0
end
