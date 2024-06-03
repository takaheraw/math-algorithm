def bit_dp(weights, values, capacity)
  n = weights.length
  dp = Array.new(1 << n, 0)

  (1...(1 << n)).each do |s|
    (0...n).each do |i|
      if s & (1 << i) != 0 
        prev_subset = s ^ (1 << i)
        if weights[i] <= capacity
          dp[s] = [dp[s], dp[prev_subset] + values[i]].max
        end
      end
    end
  end

  dp[(1 << n) - 1]
end

# Example usage:
weights = gets.chomp.split.map(&:to_i)
values = gets.chomp.split.map(&:to_i)
capacity = gets.to_i
max_value = bit_dp(weights, values, capacity)
puts "Maximum value using bit DP: #{max_value}"
