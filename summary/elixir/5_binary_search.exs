defmodule BinarySearch do
  # 二分探索関数
  def binary_search(array, target) when is_list(array) do
    binary_search(array, target, 0, length(array) - 1)
  end

  # 二分探索の再帰関数
  defp binary_search(array, target, low, high) when low <= high do
    mid = div(low + high, 2)
    case Enum.fetch(array, mid) do
      {mid_value, _} when mid_value == target -> mid
      {mid_value, _} when mid_value > target ->
        binary_search(array, target, low, mid - 1)
      _ ->
        binary_search(array, target, mid + 1, high)
    end
  end
  defp binary_search(_, _, _, _), do: -1  # 見つからなかった場合のデフォルト値
end

# 例として、配列と探索対象の数字を与えてみる
array = [1, 3, 5, 7, 9, 11, 13, 15, 17, 19]
target = 13
index = BinarySearch.binary_search(array, target)
IO.puts("要素 #{target} は配列の #{index} 番目にあります。")
