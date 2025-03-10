s = {}
count = 0
q = gets.to_i

q.times do
  op, x = gets.split.map(&:to_i)
  case op
  when 0  # insert operation
    unless s.key?(x)
      s[x] = true
      count += 1
    end
    puts count
  when 1  # find operation
    puts s.key?(x) ? 1 : 0
  when 2  # delete operation
    if s.key?(x)
      s.delete(x)
      count -= 1
    end
  end
end
