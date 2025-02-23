# Read the number of elements
n = gets.to_i

# Read the array of integers
arr = gets.split.map(&:to_i)

# Read the number of queries
q = gets.to_i

# Process each query
q.times do
  b, e, k = gets.split.map(&:to_i)
  # Count the occurrences of k in the subarray from index b to e-1
  count = arr[b...e].count(k)
  puts count
end
