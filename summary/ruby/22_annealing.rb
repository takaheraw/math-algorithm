def simulated_annealing(initial_solution)
  current_solution = initial_solution.dup
  current_cost = yield(current_solution)
  temperature = 100.0
  min_temperature = 0.01
  alpha = 0.9

  while temperature > min_temperature
    next_solution = current_solution.dup
    i, j = rand(current_solution.size), rand(current_solution.size)
    next_solution[i], next_solution[j] = next_solution[j], next_solution[i]
    next_cost = yield(next_solution)

    if next_cost < current_cost or Math.exp((current_cost - next_cost) / temperature) > rand
      current_solution = next_solution
      current_cost = next_cost
    end

    temperature *= alpha
  end

  current_solution
end

# Example usage:
input_array = gets.chomp.split.map(&:to_i)
optimized_array = simulated_annealing(input_array) { |arr| arr.reduce(0) { |sum, num| sum + num ** 2 } }
puts "Optimized Array using Simulated Annealing: #{optimized_array}"
