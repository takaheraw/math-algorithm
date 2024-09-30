defmodule SegmentTree do
  defstruct [:tree, :n]

  def new(data) do
    n = length(data)
    tree = List.duplicate(0, 2 * n)
    segment_tree = %SegmentTree{tree: tree, n: n}
    build(segment_tree, data)
  end

  defp build(%SegmentTree{tree: tree, n: n} = segment_tree, data) do
    # Initialize leaves
    tree = Enum.with_index(data, n)
    |> Enum.reduce(tree, fn {value, index}, acc ->
      List.replace_at(acc, index, value)
    end)

    # Build the tree by calculating parents
    tree = Enum.reduce((n-1)..1, tree, fn i, acc ->
      List.replace_at(acc, i, Enum.at(acc, 2*i) + Enum.at(acc, 2*i+1))
    end)

    %{segment_tree | tree: tree}
  end

  def update(%SegmentTree{tree: tree, n: n} = segment_tree, index, value) do
    # Set value at position p
    index = index + n
    tree = List.replace_at(tree, index, value)

    # Move upward and update parents
    tree = update_parents(tree, div(index, 2))

    %{segment_tree | tree: tree}
  end

  defp update_parents(tree, index) when index > 0 do
    tree = List.replace_at(tree, index, Enum.at(tree, 2*index) + Enum.at(tree, 2*index+1))
    update_parents(tree, div(index, 2))
  end
  defp update_parents(tree, _), do: tree

  def query(%SegmentTree{tree: tree, n: n}, left, right) do
    # sum on interval [l, r)
    query_range(tree, left + n, right + n, 0)
  end

  defp query_range(tree, left, right, result) when left < right do
    result = if rem(left, 2) == 1 do
      result + Enum.at(tree, left)
    else
      result
    end

    result = if rem(right, 2) == 1 do
      result + Enum.at(tree, right - 1)
    else
      result
    end

    query_range(tree, div(left + 1, 2), div(right, 2), result)
  end
  defp query_range(_, _, _, result), do: result
end

# 使用例
data = [1, 3, 5, 7, 9, 11]
seg_tree = SegmentTree.new(data)

# 配列の範囲 [1, 4) の合計をクエリ
IO.puts SegmentTree.query(seg_tree, 1, 4) # 3 + 5 + 7 = 15

# インデックス 2 の値を 10 に更新
seg_tree = SegmentTree.update(seg_tree, 2, 10)

# 再度クエリ
IO.puts SegmentTree.query(seg_tree, 1, 4) # 3 + 10 + 7 = 20
