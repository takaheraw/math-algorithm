defmodule Shakutori do
  def solve(arr, k) do
    n = length(arr)
    do_shakutori(arr, k, n, 0, 0, 0, 0)
  end

  defp do_shakutori(arr, k, n, left, right, sum, res) when left < n do
    {new_right, new_sum} = advance_right(arr, k, n, right, sum)
    new_res = res + (new_right - left)

    if new_right == left do
      do_shakutori(arr, k, n, left + 1, new_right + 1, 0, new_res)
    else
      do_shakutori(arr, k, n, left + 1, new_right, new_sum - Enum.at(arr, left), new_res)
    end
  end

  defp do_shakutori(_, _, _, _, _, _, res), do: res

  defp advance_right(arr, k, n, right, sum) when right < n and sum + Enum.at(arr, right) <= k do
    advance_right(arr, k, n, right + 1, sum + Enum.at(arr, right))
  end
  defp advance_right(_, _, _, right, sum), do: {right, sum}
end

# Example usage:
input_array = IO.gets("Enter the array elements separated by space: ")
              |> String.trim()
              |> String.split()
              |> Enum.map(&String.to_integer/1)

k = IO.gets("Enter the value of k: ")
    |> String.trim()
    |> String.to_integer()

result = Shakutori.solve(input_array, k)
IO.puts("Number of subarrays with sum <= #{k}: #{result}")
