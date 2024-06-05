def local_search_algorithm(arr)
  n = arr.length
  best_solution = arr.dup
  best_cost = yield(best_solution)

  loop do
    current_solution = best_solution.dup
    improved = false

    (0...n).each do |i|
      (i+1...n).each do |j|
        current_solution[i], current_solution[j] = current_solution[j], current_solution[i]
        current_cost = yield(current_solution)
        if current_cost < best_cost
          best_solution = current_solution.dup
          best_cost = current_cost
          improved = true
        end
        current_solution[i], current_solution[j] = current_solution[j], current_solution[i]
      end
    end

    break unless improved
  end

  best_solution
end

# Example usage:
input_array = gets.chomp.split.map(&:to_i)
best_array = local_search_algorithm(input_array) { |arr| arr.reduce(0) { |sum, num| sum + num ** 2 } }
puts "Optimized Array: #{best_array}"
