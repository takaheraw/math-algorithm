def solve(n, given_set)
  # Create a set from the given elements
  initial_set = given_set.to_set

  # Generate all possible subsets that contain the initial set
  valid_subsets = []
  
  # Iterate through all possible subset combinations (from 0 to 2^n - 1)
  (0...(1 << n)).each do |subset_mask|
    # Convert the subset mask to a set of elements
    current_subset = (0...n).select { |i| (subset_mask & (1 << i)) > 0 }.to_set
    
    # Check if the initial set is a subset of the current subset
    if initial_set.subset?(current_subset)
      valid_subsets << {
        mask: subset_mask,
        elements: current_subset.to_a.sort
      }
    end
  end

  # Sort subsets by their decimal representation
  valid_subsets.sort_by! { |subset| subset[:mask] }

  # Print the results in the specified format
  valid_subsets.each do |subset|
    puts "#{subset[:mask]}: #{subset[:elements].join(' ')}"
  end
end

# Read input
n = gets.to_i
given_set = gets.split.map(&:to_i)

# Solve the problem
solve(n, given_set)
