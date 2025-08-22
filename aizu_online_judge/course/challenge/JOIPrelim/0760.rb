h, w = gets.split.map(&:to_i)
grid = []
h.times do
  grid << gets.chomp
end

def calculate_best_score_for_aoi_choice(grid, h, w, aoi_row)
  best_aoi_score = -1
  best_rin_score = -1
  
  w.times do |rin_col|
    aoi_score = 0
    rin_score = 0
    
    h.times do |i|
      w.times do |j|
        is_front = (grid[i][j] == '#')
        
        if i == aoi_row
          is_front = !is_front
        end
        
        if j == rin_col
          is_front = !is_front
        end
        
        if is_front
          aoi_score += 1
        else
          rin_score += 1
        end
      end
    end
    
    if best_aoi_score == -1 || aoi_score < best_aoi_score
      best_aoi_score = aoi_score
      best_rin_score = rin_score
    end
  end
  
  [best_aoi_score, best_rin_score]
end

best_aoi_score = -1
best_rin_score = -1

h.times do |aoi_row|
  aoi_score, rin_score = calculate_best_score_for_aoi_choice(grid, h, w, aoi_row)
  
  if best_aoi_score == -1 || aoi_score > best_aoi_score
    best_aoi_score = aoi_score
    best_rin_score = rin_score
  end
end

puts "#{best_aoi_score} #{best_rin_score}"
