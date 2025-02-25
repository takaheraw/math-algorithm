# Read the number of elements
n = gets.to_i

# Read the sequence of integers and convert them to an array of integers
arr = gets.split.map(&:to_i)

# Read the number of queries
q = gets.to_i

# Process each query: reverse the subarray from index b to e-1
q.times do
  b, e = gets.split.map(&:to_i)
  arr[b...e] = arr[b...e].reverse
end

# Print the modified array with elements separated by a space
puts arr.join(" ")
