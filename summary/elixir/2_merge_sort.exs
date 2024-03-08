defmodule MergeSort do
  def sort([]), do: []
  def sort([x]), do: [x]

  def sort(list) do
    {left, right} = split(list)
    merge(sort(left), sort(right))
  end

  defp split(list) do
    {list |> Enum.take(div(Enum.count(list), 2)), list |> Enum.drop(div(Enum.count(list), 2))}
  end

  defp merge([], right), do: right
  defp merge(left, []), do: left
  defp merge([left_head | left_tail], [right_head | right_tail]) when left_head <= right_head do
    [left_head | merge(left_tail, [right_head | right_tail])]
  end
  defp merge(left, [right_head | right_tail]) do
    [right_head | merge(left, right_tail)]
  end
end

# テスト
list = [5, 3, 8, 2, 7, 1, 4, 6]
sorted_list = MergeSort.sort(list)
IO.inspect(sorted_list)  # 出力: [1, 2, 3, 4, 5, 6, 7, 8]
