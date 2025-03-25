def solve(n)
  # Total number of subsets will be 2^n
  (0...(1 << n)).each do |subset|
    # Find elements in the current subset
    elements = (0...n).select { |i| (subset & (1 << i)) != 0 }
    
    # Print subset in the required format
    puts "#{subset}: #{elements.join(' ')}"
  end
end

# Read input
n = gets.to_i
solve(n)
