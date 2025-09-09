def solve_carpet
  h, w = gets.split.map(&:to_i)
  grid = []
  h.times do
    grid << gets.chomp
  end
  
  start_row, start_col = 0, 0
  end_row, end_col = h - 1, w - 1
  
  if grid[start_row][start_col] == grid[end_row][end_col]
    puts -1
    return
  end
  
  queue = [[start_row, start_col, 0]]  # [行, 列, 移動回数]
  visited = Set.new
  visited.add([start_row, start_col])
  
  directions = [[-1, 0], [1, 0], [0, -1], [0, 1]]
  
  while !queue.empty?
    current_row, current_col, moves = queue.shift
    
    if current_row == end_row && current_col == end_col
      puts moves
      return
    end
    
    current_color = grid[current_row][current_col]
    
    directions.each do |dr, dc|
      new_row = current_row + dr
      new_col = current_col + dc
      
      next if new_row < 0 || new_row >= h || new_col < 0 || new_col >= w
      
      next if visited.include?([new_row, new_col])
      
      next if grid[new_row][new_col] == current_color
      
      visited.add([new_row, new_col])
      queue.push([new_row, new_col, moves + 1])
    end
  end
  
  puts -1
end

solve_carpet
