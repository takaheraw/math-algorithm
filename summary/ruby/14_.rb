def greedy_algorithm(values, weights, capacity)
  items = values.zip(weights).map.with_index(1) { |(value, weight), index| {index: index, value: value, weight: weight, ratio: value.to_f / weight} }
  items.sort_by! { |item| -item[:ratio] }

  total_value = 0
  total_weight = 0
  selected_items = []

  items.each do |item|
    if total_weight + item[:weight] <= capacity
      selected_items << item[:index]
      total_value += item[:value]
      total_weight += item[:weight]
    end
  end

  return total_value, selected_items
end

# Example usage:
values = [60, 100, 120]
weights = [10, 20, 30]
capacity = 50
value, items = greedy_algorithm(values, weights, capacity)
puts "Total value: #{value}"
puts "Items selected: #{items.join(', ')}"
