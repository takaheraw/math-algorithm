# Ruby program to perform matrix multiplication

# Read dimensions of matrices
n, m, l = gets.split.map(&:to_i)

# Read matrix A (n x m)
matrix_a = []
n.times do
  matrix_a << gets.split.map(&:to_i)
end

# Read matrix B (m x l)
matrix_b = []
m.times do
  matrix_b << gets.split.map(&:to_i)
end

# Initialize result matrix C (n x l) with zeros
matrix_c = Array.new(n) { Array.new(l, 0) }

# Perform matrix multiplication
n.times do |i|
  l.times do |j|
    m.times do |k|
      matrix_c[i][j] += matrix_a[i][k] * matrix_b[k][j]
    end
  end
end

# Print the result matrix
matrix_c.each do |row|
  puts row.join(" ")
end
