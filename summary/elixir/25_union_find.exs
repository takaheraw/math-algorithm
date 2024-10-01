defmodule UnionFind do
  defstruct [:parent, :rank]

  def new(size) do
    parent = Enum.map(0..(size-1), & &1)
    rank = List.duplicate(0, size)
    %UnionFind{parent: parent, rank: rank}
  end

  def find(%UnionFind{parent: parent} = uf, x) do
    if parent[x] != x do
      new_parent = List.replace_at(parent, x, find(uf, parent[x]))
      {parent[x], %{uf | parent: new_parent}}
    else
      {x, uf}
    end
  end

  def union(%UnionFind{parent: parent, rank: rank} = uf, x, y) do
    {root_x, uf} = find(uf, x)
    {root_y, uf} = find(uf, y)

    if root_x != root_y do
      cond do
        rank[root_x] > rank[root_y] ->
          new_parent = List.replace_at(parent, root_y, root_x)
          %{uf | parent: new_parent}
        rank[root_x] < rank[root_y] ->
          new_parent = List.replace_at(parent, root_x, root_y)
          %{uf | parent: new_parent}
        true ->
          new_parent = List.replace_at(parent, root_y, root_x)
          new_rank = List.update_at(rank, root_x, & &1 + 1)
          %{uf | parent: new_parent, rank: new_rank}
      end
    else
      uf
    end
  end

  def connected?(%UnionFind{} = uf, x, y) do
    {root_x, uf} = find(uf, x)
    {root_y, _} = find(uf, y)
    root_x == root_y
  end
end

# 使用例
uf = UnionFind.new(10)
uf = UnionFind.union(uf, 1, 2)
uf = UnionFind.union(uf, 2, 3)
IO.puts UnionFind.connected?(uf, 1, 3) # true
IO.puts UnionFind.connected?(uf, 1, 4) # false
