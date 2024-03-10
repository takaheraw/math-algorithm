defmodule BubbleSort do
  def sort(list) when is_list(list) do
    sort(list, length(list))
  end

  defp sort(list, 0), do: list
  defp sort(list, n) do
    list |> bubble(n) |> sort(n - 1)
  end

  defp bubble(list, 0), do: list
  defp bubble([], _), do: []
  defp bubble([a, b | t], n) when a > b do
    [b, a | bubble(t, n - 1)]
  end
  defp bubble([h | t], n), do: [h | bubble(t, n - 1)]
end

# 使用例
unsorted_list = [5, 3, 8, 4, 2, 1, 6, 7]
sorted_list = BubbleSort.sort(unsorted_list)
IO.inspect(sorted_list)
