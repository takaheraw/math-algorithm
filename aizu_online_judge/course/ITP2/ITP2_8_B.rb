q = gets.to_i

m = {}

q.times do
  query = gets.split

  case query[0]
  when '0'
    key, x = query[1], query[2].to_i
    m[key] = x
  when '1'
    key = query[1]
    puts m[key] || 0
  when '2'
    key = query[1]
    m.delete(key)
  end
end
