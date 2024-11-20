# Ruby program to perform matrix-vector multiplication

# Read the dimensions of the matrix
n, m = gets.split.map(&:to_i)

# Read the matrix A
matrix_a = []
n.times do
  matrix_a << gets.split.map(&:to_i)
end

# Read the vector b
vector_b = []
m.times do
  vector_b << gets.to_i
end

# Perform matrix-vector multiplication
result = matrix_a.map do |row|
  row.zip(vector_b).map { |aij, bj| aij * bj }.sum
end

# Output the result
puts result
