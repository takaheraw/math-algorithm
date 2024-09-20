defmodule GreedyAlgorithm do
  def knapsack(values, weights, capacity) do
    items = Enum.zip(values, weights)
    |> Enum.with_index(1)
    |> Enum.map(fn {{value, weight}, index} ->
      %{index: index, value: value, weight: weight, ratio: value / weight}
    end)
    |> Enum.sort_by(&(&1.ratio), :desc)

    {total_value, total_weight, selected_items} =
      Enum.reduce_while(items, {0, 0, []}, fn item, {value, weight, selected} ->
        if weight + item.weight <= capacity do
          {:cont, {value + item.value, weight + item.weight, [item.index | selected]}}
        else
          {:halt, {value, weight, selected}}
        end
      end)

    {total_value, Enum.reverse(selected_items)}
  end
end

# 使用例
values = [60, 100, 120]
weights = [10, 20, 30]
capacity = 50

{value, items} = GreedyAlgorithm.knapsack(values, weights, capacity)
IO.puts "Total value: #{value}"
IO.puts "Items selected: #{Enum.join(items, ", ")}"
