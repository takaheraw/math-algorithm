def solve
  h, w = gets.split.map(&:to_i)
  grid = []
  h.times do
    grid << gets.split.map(&:to_i)
  end
  
  dx = [-1, 1, 0, 0]
  dy = [0, 0, -1, 1]
  
  max_score = 0
  
  (0...h).each do |x|
    (0...w).each do |y|
      colors = Set.new
      (0...h).each do |i|
        (0...w).each do |j|
          colors.add(grid[i][j])
        end
      end
      
      colors.each do |c|
        next if grid[x][y] == c # 同じ色なら意味がない
        
        temp_grid = grid.map(&:dup)
        
        original_color = grid[x][y]
        queue = [[x, y]]
        visited = Set.new([[x, y]])
        paint_cells = [[x, y]]
        
        while !queue.empty?
          cx, cy = queue.shift
          
          4.times do |i|
            nx, ny = cx + dx[i], cy + dy[i]
            next if nx < 0 || nx >= h || ny < 0 || ny >= w
            next if visited.include?([nx, ny])
            next if grid[nx][ny] != original_color
            
            visited.add([nx, ny])
            queue.push([nx, ny])
            paint_cells.push([nx, ny])
          end
        end
        
        paint_cells.each do |px, py|
          temp_grid[px][py] = c
        end
        
        queue = [[x, y]]
        visited = Set.new([[x, y]])
        region_size = 1
        
        while !queue.empty?
          cx, cy = queue.shift
          
          4.times do |i|
            nx, ny = cx + dx[i], cy + dy[i]
            next if nx < 0 || nx >= h || ny < 0 || ny >= w
            next if visited.include?([nx, ny])
            next if temp_grid[nx][ny] != c
            
            visited.add([nx, ny])
            queue.push([nx, ny])
            region_size += 1
          end
        end
        
        max_score = [max_score, region_size].max
      end
    end
  end
  
  puts max_score
end

solve
