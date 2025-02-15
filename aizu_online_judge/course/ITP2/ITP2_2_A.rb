n, q = gets.split.map(&:to_i)
stacks = Array.new(n) { [] }

q.times do
  query = gets.split
  op = query[0].to_i
  t = query[1].to_i

  case op
  when 0 # push(t, x)
    x = query[2].to_i
    stacks[t].push(x)
  when 1 # top(t)
    puts stacks[t].empty? ? "" : stacks[t].last
  when 2 # pop(t)
    stacks[t].pop unless stacks[t].empty?
  end
end
