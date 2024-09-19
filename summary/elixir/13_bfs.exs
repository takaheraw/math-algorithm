defmodule BreadthFirstSearch do
  def bfs(graph, start_vertex) do
    queue = :queue.from_list([start_vertex])
    visited = MapSet.new([start_vertex])
    do_bfs(graph, queue, visited, [])
  end

  defp do_bfs(graph, queue, visited, order) do
    case :queue.out(queue) do
      {{:value, vertex}, rest} ->
        {new_queue, new_visited, new_order} =
          graph[vertex]
          |> Enum.reduce({rest, visited, [vertex | order]}, fn neighbor, {q, v, o} ->
            if MapSet.member?(v, neighbor) do
              {q, v, o}
            else
              {:queue.in(neighbor, q), MapSet.put(v, neighbor), o}
            end
          end)

        do_bfs(graph, new_queue, new_visited, new_order)

      {:empty, _} ->
        Enum.reverse(order)
    end
  end
end

# 使用例
graph = %{
  "A" => ["B", "C"],
  "B" => ["A", "D", "E"],
  "C" => ["A", "F"],
  "D" => ["B"],
  "E" => ["B", "F"],
  "F" => ["C", "E"]
}

IO.inspect(BreadthFirstSearch.bfs(graph, "A"))
