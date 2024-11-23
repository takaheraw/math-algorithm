# Ruby program to perform a simple table calculation

# Read the dimensions of the table
r, c = gets.split.map(&:to_i)

# Initialize the table and read input rows
table = []
r.times do
  table << gets.split.map(&:to_i)
end

# Add sums for each row
table.each do |row|
  row << row.sum
end

# Compute column sums (including the new last column)
column_sums = Array.new(c + 1, 0)
table.each do |row|
  row.each_with_index do |value, col_index|
    column_sums[col_index] += value
  end
end

# Add the column sums as the last row
table << column_sums

# Print the final table
table.each do |row|
  puts row.join(" ")
end
