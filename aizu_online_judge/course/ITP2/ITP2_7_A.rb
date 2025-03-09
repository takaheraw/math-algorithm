s = {}
count = 0
q = gets.to_i

q.times do
  op, x = gets.split.map(&:to_i)
  if op == 0
    unless s.key?(x)
      s[x] = true
      count += 1
    end
    puts count
  else
    puts s.key?(x) ? 1 : 0
  end
end
