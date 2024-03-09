defmodule QuickSort do
  def sort([]), do: []
  def sort([pivot | rest]) do
    {less, greater} = Enum.split_with(rest, &(&1 <= pivot))
    sort(less) ++ [pivot] ++ sort(greater)
  end
end

# 例としてリストを用意してソートを試してみます
unsorted_list = [3, 1, 4, 1, 5, 9, 2, 6, 5, 3, 5]
sorted_list = QuickSort.sort(unsorted_list)
IO.inspect(sorted_list)
