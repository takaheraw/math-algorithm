defmodule LocalSearch do
  def calculate_cost(arr) do
    Enum.sum(Enum.map(arr, fn x -> x * x end))
  end

  def local_search(arr) do
    n = length(arr)
    best_solution = arr
    best_cost = calculate_cost(best_solution)

    Stream.iterate(0, &(&1 + 1))
    |> Enum.reduce_while(best_solution, fn _, solution ->
      {improved, new_solution, new_cost} =
        Enum.reduce(0..(n - 2), {false, solution, best_cost}, fn i, {improved, current_solution, current_cost} ->
          Enum.reduce((i + 1)..(n - 1), {improved, current_solution, current_cost}, fn k, {imp, sol, cost} ->
            new_sol = List.update_at(sol, i, fn _ -> Enum.at(sol, k) end)
            |> List.update_at(k, fn _ -> Enum.at(sol, i) end)
            new_cost = calculate_cost(new_sol)

            if new_cost < cost do
              {true, new_sol, new_cost}
            else
              {imp, sol, cost}
            end
          end)
        end)

      if improved do
        {:cont, new_solution}
      else
        {:halt, solution}
      end
    end)
  end
end

# Example usage
input_array = [10, 20, 30, 40, 50]
optimized_array = LocalSearch.local_search(input_array)
IO.puts("Optimized Array: #{inspect(optimized_array)}")
