# Read the initial state of the puzzle
initial = []
3.times do
  initial += gets.split.map(&:to_s)
end
initial_state = initial.join

target = "123456780"

# Use BFS to find the shortest path
require 'set'

visited = Set.new
visited.add(initial_state)
queue = [[initial_state, 0]]

# Define possible movement directions (up, down, left, right)
directions = [[-1, 0], [1, 0], [0, -1], [0, 1]]

loop do
  current_state, steps = queue.shift

  if current_state == target
    puts steps
    exit
  end

  # Find the position of '0'
  index = current_state.index('0')
  row = index / 3
  col = index % 3

  directions.each do |d_row, d_col|
    new_row = row + d_row
    new_col = col + d_col

    if new_row.between?(0, 2) && new_col.between?(0, 2)
      new_index = new_row * 3 + new_col
      # Generate new state by swapping
      chars = current_state.chars.to_a
      chars[index], chars[new_index] = chars[new_index], chars[index]
      new_state = chars.join

      unless visited.include?(new_state)
        visited.add(new_state)
        queue << [new_state, steps + 1]
      end
    end
  end
end
