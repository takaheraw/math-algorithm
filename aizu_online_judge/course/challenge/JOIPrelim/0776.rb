n, m, q = gets.split.map(&:to_i)

products = [nil]

n.times do
  price, type = gets.split.map(&:to_i)
  products << [price, type]
end

q.times do
  day, left, right = gets.split.map(&:to_i)
  
  total_cost = 0
  
  (left..right).each do |i|
    price = products[i][0]
    type = products[i][1]
    
    if day == type
      total_cost += price / 2
    else
      total_cost += price
    end
  end
  
  puts total_cost
end
