def matrix_chain_order(dimensions)
  n = dimensions.size
  dp = Array.new(n) { Array.new(n, Float::INFINITY) }

  # The cost of multiplying one matrix is 0
  (0...n).each { |i| dp[i][i] = 0 }

  # l is the chain length
  (2..n).each do |l|
    (0..n - l).each do |i|
      j = i + l - 1
      (i...j).each do |k|
        cost = dp[i][k] + dp[k + 1][j] + dimensions[i][0] * dimensions[k][1] * dimensions[j][1]
        dp[i][j] = [dp[i][j], cost].min
      end
    end
  end

  dp[0][n - 1]
end

# Input
n = gets.to_i
dimensions = []
n.times do
  dimensions << gets.split.map(&:to_i)
end

# Calculate minimum scalar multiplications
puts matrix_chain_order(dimensions)
