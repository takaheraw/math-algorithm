n = gets.to_i
a = gets.split.map(&:to_i)
q = gets.to_i

q.times do
  op, b, e = gets.split.map(&:to_i)
  sub_arr = a[b...e]
  if op == 0
    puts sub_arr.min
  else
    puts sub_arr.max
  end
end
