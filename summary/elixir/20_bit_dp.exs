defmodule BitDP do
  def solve(weights, values, capacity) do
    n = length(weights)
    dp = List.duplicate(0, 1 <<< n)

    Enum.reduce(1..(1 <<< n) - 1, dp, fn s, dp ->
      Enum.reduce(0..(n - 1), dp, fn i, dp ->
        if (s &&& (1 <<< i)) != 0 do
          prev_subset = s ^^^ (1 <<< i)
          if Enum.at(weights, i) <= capacity do
            List.update_at(dp, s, fn current_value ->
              max(current_value, Enum.at(dp, prev_subset) + Enum.at(values, i))
            end)
          else
            dp
          end
        else
          dp
        end
      end)
    end)
    |> List.last()
  end
end

# Example usage:
weights = IO.gets("Enter weights (space-separated): ") |> String.trim() |> String.split() |> Enum.map(&String.to_integer/1)
values = IO.gets("Enter values (space-separated): ") |> String.trim() |> String.split() |> Enum.map(&String.to_integer/1)
capacity = IO.gets("Enter capacity: ") |> String.trim() |> String.to_integer()

max_value = BitDP.solve(weights, values, capacity)
IO.puts("Maximum value using bit DP: #{max_value}")
