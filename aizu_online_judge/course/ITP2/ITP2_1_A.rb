n = gets.to_i
array = []

n.times do
  query = gets.split

  case query[0].to_i
  when 0 # pushBack
    x = query[1].to_i
    array.push(x)
  when 1 # randomAccess
    p = query[1].to_i
    puts array[p]
  when 2 # popBack
    array.pop
  end
end
