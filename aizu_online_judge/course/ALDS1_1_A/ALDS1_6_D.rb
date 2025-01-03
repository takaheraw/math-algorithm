def minimum_cost_sort(weights)
  sorted_weights = weights.sort
  min_weight = sorted_weights.first
  visited = Array.new(weights.size, false)
  total_cost = 0

  weights.each_with_index do |_, i|
    next if visited[i]

    current = i
    cycle_sum = 0
    cycle_min = Float::INFINITY
    cycle_length = 0

    while !visited[current]
      visited[current] = true
      cycle_weight = weights[current]
      cycle_sum += cycle_weight
      cycle_min = [cycle_min, cycle_weight].min
      cycle_length += 1
      current = weights.index(sorted_weights[current])
    end

    if cycle_length > 1
      cost_with_cycle_min = cycle_sum + (cycle_length - 2) * cycle_min
      cost_with_global_min = cycle_sum + cycle_min + (cycle_length + 1) * min_weight
      total_cost += [cost_with_cycle_min, cost_with_global_min].min
    end
  end

  total_cost
end

# 入力の読み込み
n = gets.to_i
weights = gets.split.map(&:to_i)

# 最小コストを計算して出力
puts minimum_cost_sort(weights)
