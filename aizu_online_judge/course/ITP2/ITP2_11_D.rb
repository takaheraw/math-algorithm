def solve(n, k)
  # Generate all combinations with their corresponding integer representation
  combinations = []
  
  # Generate all possible combinations using bit manipulation
  (0...(1 << n)).each do |mask|
    # Count the number of set bits in the current mask
    bits_count = mask.to_s(2).count('1')
    
    # Check if the number of set bits matches k
    if bits_count == k
      # Find the indices of set bits (selected elements)
      selected_elements = (0...n).select { |i| (mask & (1 << i)) != 0 }
      
      # Store the combination with its integer representation
      combinations << [mask, selected_elements]
    end
  end
  
  # Sort combinations by their integer representation
  combinations.sort_by! { |mask, _| mask }
  
  # Print the combinations in the specified format
  combinations.each do |mask, elements|
    puts "#{mask}: #{elements.join(' ')}"
  end
end

# Read input
n, k = gets.split.map(&:to_i)

# Solve the problem
solve(n, k)
