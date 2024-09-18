defmodule Dijkstra do
  def shortest_paths(graph, source) do
    distances = Map.new(Map.keys(graph), fn vertex -> {vertex, :infinity} end)
    distances = Map.put(distances, source, 0)
    priority_queue = :gb_sets.singleton({0, source})

    do_dijkstra(graph, distances, priority_queue)
  end

  defp do_dijkstra(graph, distances, priority_queue) do
    case :gb_sets.is_empty(priority_queue) do
      true ->
        distances
      false ->
        {{_, current_vertex}, priority_queue} = :gb_sets.take_smallest(priority_queue)

        {distances, priority_queue} =
          Enum.reduce(Map.get(graph, current_vertex, %{}), {distances, priority_queue}, fn {neighbor, weight}, {distances, queue} ->
            new_distance = Map.get(distances, current_vertex) + weight

            if new_distance < Map.get(distances, neighbor, :infinity) do
              distances = Map.put(distances, neighbor, new_distance)
              queue = :gb_sets.add({new_distance, neighbor}, queue)
              {distances, queue}
            else
              {distances, queue}
            end
          end)

        do_dijkstra(graph, distances, priority_queue)
    end
  end
end

# Example usage:
graph = %{
  "A" => %{"B" => 1, "C" => 4},
  "B" => %{"A" => 1, "C" => 2, "D" => 5},
  "C" => %{"A" => 4, "B" => 2, "D" => 1},
  "D" => %{"B" => 5, "C" => 1}
}

IO.inspect Dijkstra.shortest_paths(graph, "A")
