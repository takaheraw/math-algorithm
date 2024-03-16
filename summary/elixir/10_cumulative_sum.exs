defmodule CumulativeSum do
  # 累積和を計算する関数
  def cumulative_sum(list) when is_list(list) do
    cumulative_sum(list, 0, [])
  end

  # 再帰的に累積和を計算するヘルパー関数
  defp cumulative_sum([], _, result), do: Enum.reverse(result)
  defp cumulative_sum([head | tail], acc, result) do
    new_acc = acc + head
    cumulative_sum(tail, new_acc, [new_acc | result])
  end

  # 指定された範囲の合計を計算する関数
  def sum_range(list, start, end_) when is_list(list) and is_integer(start) and is_integer(end_) do
    cumulative_sum(list) |> Enum.slice(start - 1..end_ - 1) |> Enum.sum()
  end
end

# テスト
IO.inspect CumulativeSum.cumulative_sum([1, 2, 3, 4, 5])  # [1, 3, 6, 10, 15]
IO.inspect CumulativeSum.cumulative_sum([5, 3, 8, 2, 1])  # [5, 8, 16, 18, 19]

# 1から3までの合計を計算するテスト
IO.inspect CumulativeSum.sum_range([1, 2, 3, 4, 5], 1, 3)
IO.inspect CumulativeSum.sum_range([5, 3, 8, 2, 1], 1, 3)
