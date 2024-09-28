defmodule SimulatedAnnealing do
  def optimize(initial_solution, cost_function) do
    current_solution = initial_solution
    current_cost = cost_function.(current_solution)
    temperature = 100.0
    min_temperature = 0.01
    alpha = 0.9

    optimize_loop(current_solution, current_cost, temperature, min_temperature, alpha, cost_function)
  end

  defp optimize_loop(current_solution, current_cost, temperature, min_temperature, alpha, cost_function) do
    if temperature > min_temperature do
      next_solution = generate_neighbor(current_solution)
      next_cost = cost_function.(next_solution)

      {new_solution, new_cost} =
        if should_accept?(current_cost, next_cost, temperature) do
          {next_solution, next_cost}
        else
          {current_solution, current_cost}
        end

      new_temperature = temperature * alpha
      optimize_loop(new_solution, new_cost, new_temperature, min_temperature, alpha, cost_function)
    else
      current_solution
    end
  end

  defp generate_neighbor(solution) do
    i = :rand.uniform(length(solution)) - 1
    j = :rand.uniform(length(solution)) - 1
    List.replace_at(solution, i, Enum.at(solution, j))
    |> List.replace_at(j, Enum.at(solution, i))
  end

  defp should_accept?(current_cost, next_cost, temperature) do
    next_cost < current_cost or :math.exp((current_cost - next_cost) / temperature) > :rand.uniform()
  end
end

# Example usage:
input_array = IO.gets("Enter numbers separated by spaces: ")
              |> String.trim()
              |> String.split()
              |> Enum.map(&String.to_integer/1)

cost_function = fn arr -> Enum.reduce(arr, 0, fn num, sum -> sum + :math.pow(num, 2) end) end

optimized_array = SimulatedAnnealing.optimize(input_array, cost_function)
IO.puts("Optimized Array using Simulated Annealing: #{inspect(optimized_array)}")
