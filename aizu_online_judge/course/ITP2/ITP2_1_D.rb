n, q = gets.split.map(&:to_i)
arrays = Array.new(n) { [] }
output = []

q.times do
  query = gets.split
  case query[0]
  when "0"
    t, x = query[1].to_i, query[2].to_i
    arrays[t] << x
  when "1"
    t = query[1].to_i
    output << arrays[t].join(" ")
  when "2"
    t = query[1].to_i
    arrays[t].clear
  end
end

puts output
