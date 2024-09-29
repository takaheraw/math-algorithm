defmodule BeamSearch do
  defstruct [:start, :goal, :beam_width]

  def new(start, goal, beam_width) do
    %BeamSearch{start: start, goal: goal, beam_width: beam_width}
  end

  def search(%BeamSearch{start: start, goal: goal, beam_width: beam_width}) do
    initial_node = Node.new(start, nil, 0, heuristic(start, goal))
    beam = [initial_node]

    search_loop(beam, goal, beam_width)
  end

  defp search_loop([], _goal, _beam_width), do: nil
  defp search_loop(beam, goal, beam_width) do
    case Enum.find(beam, fn node -> node.state == goal end) do
      %Node{} = goal_node -> construct_path(goal_node)
      nil ->
        new_beam =
          beam
          |> Enum.flat_map(&expand(&1, goal))
          |> Enum.sort_by(& &1.estimated_cost)
          |> Enum.take(beam_width)

        search_loop(new_beam, goal, beam_width)
    end
  end

  defp expand(node, goal) do
    # この部分は問題に応じて適切に実装する必要があります
    transitions = [{1, 2}, {2, 3}, {3, 4}]

    Enum.map(transitions, fn {state, cost} ->
      new_cost = node.cost + cost
      estimated_cost = new_cost + heuristic(state, goal)
      Node.new(state, node, new_cost, estimated_cost)
    end)
  end

  defp heuristic(state, goal) do
    # この部分も問題に応じて適切なヒューリスティック関数を実装する必要があります
    abs(goal - state)
  end

  defp construct_path(node) do
    construct_path(node, [])
  end

  defp construct_path(%Node{parent: nil} = node, path) do
    [node.state | path]
  end
  defp construct_path(%Node{} = node, path) do
    construct_path(node.parent, [node.state | path])
  end
end

defmodule Node do
  defstruct [:state, :parent, :cost, :estimated_cost]

  def new(state, parent, cost, estimated_cost) do
    %Node{state: state, parent: parent, cost: cost, estimated_cost: estimated_cost}
  end
end

# 使用例
start = 0
goal = 10
beam_width = 2
beam_search = BeamSearch.new(start, goal, beam_width)
path = BeamSearch.search(beam_search)
IO.puts("Path found: #{inspect(path)}")
