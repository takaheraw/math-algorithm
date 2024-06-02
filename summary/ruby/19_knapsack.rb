def knapsack(weights, values, capacity)
  n = weights.length
  dp = Array.new(n + 1) { Array.new(capacity + 1, 0) }

  (1..n).each do |i|
    (1..capacity).each do |w|
      if weights[i - 1] <= w
        dp[i][w] = [dp[i - 1][w], values[i - 1] + dp[i - 1][w - weights[i - 1]]].max
      else
        dp[i][w] = dp[i - 1][w]
      end
    end
  end

  dp[n][capacity]
end

# Example usage:
weights = gets.chomp.split.map(&:to_i)
values = gets.chomp.split.map(&:to_i)
capacity = gets.to_i
max_value = knapsack(weights, values, capacity)
puts "Maximum value that can be accommodated: #{max_value}"
