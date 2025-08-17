n, q = gets.split.map(&:to_i)
heights = gets.split.map(&:to_i)

q.times do
  t, x = gets.split.map(&:to_i)
  
  case t
  when 1  # 西風の嵐
    (0...[n, x].min).each do |i|
      can_decrease = true
      (0...i).each do |k|
        if heights[k] > heights[i]
          can_decrease = false
          break
        end
      end
      
      if can_decrease
        heights[i] -= 1
      end
    end
    
  when 2  # 東風の嵐
    start_idx = [0, n - x].max
    (start_idx...n).each do |i|
      can_decrease = true
      ((i + 1)...n).each do |k|
        if heights[k] > heights[i]
          can_decrease = false
          break
        end
      end
      
      if can_decrease
        heights[i] -= 1
      end
    end
    
  when 3  # クエリ
    puts heights[x - 1]
  end
end
