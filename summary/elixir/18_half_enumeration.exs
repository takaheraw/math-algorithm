defmodule HalfEnumeration do
  def solve(arr, target_sum) do
    n = length(arr)
    half = div(n, 2)

    first_half_subsets = generate_subsets(Enum.take(arr, half))
    second_half_subsets = generate_subsets(Enum.drop(arr, half))

    count = 0
    Enum.reduce(first_half_subsets, 0, fn {sum1, count1}, acc ->
      needed = target_sum - sum1
      acc + count1 * Map.get(second_half_subsets, needed, 0)
    end)
  end

  defp generate_subsets(arr) do
    Enum.reduce(0..(1 <<< length(arr)) - 1, %{}, fn i, acc ->
      sum = Enum.with_index(arr)
      |> Enum.reduce(0, fn {num, j}, sum ->
        if (i &&& (1 <<< j)) != 0, do: sum + num, else: sum
      end)
      Map.update(acc, sum, 1, &(&1 + 1))
    end)
  end
end

# Example usage:
input_array = IO.gets("Enter the array elements separated by space: ")
              |> String.trim()
              |> String.split()
              |> Enum.map(&String.to_integer/1)

target_sum = IO.gets("Enter the target sum: ")
             |> String.trim()
             |> String.to_integer()

result = HalfEnumeration.solve(input_array, target_sum)
IO.puts("Number of ways to achieve sum #{target_sum}: #{result}")
