# Ruby program to manage tenant notices in buildings

# Initialize a 4D array representing buildings, floors, and rooms
buildings = Array.new(4) { Array.new(3) { Array.new(10, 0) } }

# Read number of notices
n = gets.to_i

# Process each notice
n.times do
  b, f, r, v = gets.split.map(&:to_i)
  buildings[b - 1][f - 1][r - 1] += v
end

# Print the output
buildings.each_with_index do |building, index|
  building.each do |floor|
    puts ' ' + floor.join(' ')
  end
  # Print separator between buildings except after the last one
  puts "####################" if index < buildings.size - 1
end
