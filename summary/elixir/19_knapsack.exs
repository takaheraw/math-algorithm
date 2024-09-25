defmodule Knapsack do
  def solve(weights, values, capacity) do
    n = length(weights)
    dp = for _ <- 0..n, do: List.duplicate(0, capacity + 1)

    for i <- 1..n, w <- 1..capacity, reduce: dp do
      acc ->
        new_value = if Enum.at(weights, i - 1) <= w do
          max(
            Enum.at(Enum.at(acc, i - 1), w),
            Enum.at(values, i - 1) + Enum.at(Enum.at(acc, i - 1), w - Enum.at(weights, i - 1))
          )
        else
          Enum.at(Enum.at(acc, i - 1), w)
        end
        List.replace_at(acc, i, List.replace_at(Enum.at(acc, i), w, new_value))
    end
    |> List.last()
    |> List.last()
  end
end

# Example usage:
weights = IO.gets("Enter weights: ") |> String.trim() |> String.split() |> Enum.map(&String.to_integer/1)
values = IO.gets("Enter values: ") |> String.trim() |> String.split() |> Enum.map(&String.to_integer/1)
capacity = IO.gets("Enter capacity: ") |> String.trim() |> String.to_integer()

max_value = Knapsack.solve(weights, values, capacity)
IO.puts("Maximum value that can be accommodated: #{max_value}")
