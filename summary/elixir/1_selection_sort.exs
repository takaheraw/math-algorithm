defmodule SelectionSort do
  def sort(arr) do
    do_sort(arr, 0)
  end

  defp do_sort(arr, index) when index >= length(arr) - 1, do: arr

  defp do_sort(arr, index) do
    min_index = find_min_index(arr, index, index + 1)
    swapped_arr = swap(arr, index, min_index)
    do_sort(swapped_arr, index + 1)
  end

  defp find_min_index(arr, min_index, current_index) when current_index >= length(arr), do: min_index

  defp find_min_index(arr, min_index, current_index) do
    if Enum.at(arr, min_index) > Enum.at(arr, current_index) do
      find_min_index(arr, current_index, current_index + 1)
    else
      find_min_index(arr, min_index, current_index + 1)
    end
  end

  defp swap(arr, i, j) do
    elem_i = Enum.at(arr, i)
    elem_j = Enum.at(arr, j)
    arr = List.replace_at(arr, i, elem_j)
    List.replace_at(arr, j, elem_i)
  end
end

# 使用例
arr = [5, 3, 8, 1, 2, 7]
sorted_arr = SelectionSort.sort(arr)
IO.puts("Sorted array: #{inspect(sorted_arr)}")
