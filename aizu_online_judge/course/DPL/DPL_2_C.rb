def solve_bitonic_tsp
  # 入力を読み取り
  n = gets.to_i
  
  points = []
  n.times do
    x, y = gets.split.map(&:to_f)
    points << [x, y]
  end
  
  # 2点間のユークリッド距離を計算
  def dist(i, j, points)
    dx = points[i][0] - points[j][0]
    dy = points[i][1] - points[j][1]
    Math.sqrt(dx * dx + dy * dy)
  end
  
  # Bitonic TSP using dynamic programming
  # T[i][j] = length of shortest bitonic path from 0 to i and back to j
  # where i >= j and all points 0, 1, ..., i have been visited
  
  inf = 1e9
  t = Array.new(n) { Array.new(n, inf) }
  
  # Base case
  t[1][0] = dist(0, 1, points)
  
  # Fill the table
  (2...n).each do |i|
    (0...i).each do |j|
      if i == j + 1
        # Adjacent case: need to find best k < j to connect to i
        (0...j).each do |k|
          if t[j][k] < inf
            t[i][j] = [t[i][j], t[j][k] + dist(k, i, points)].min
          end
        end
      else
        # Non-adjacent case: extend path from i-1 to i
        if t[i-1][j] < inf
          t[i][j] = [t[i][j], t[i-1][j] + dist(i-1, i, points)].min
        end
      end
    end
  end
  
  # Find minimum cost to complete the tour
  result = inf
  (0...n-1).each do |j|
    if t[n-1][j] < inf
      result = [result, t[n-1][j] + dist(j, n-1, points)].min
    end
  end
  
  printf("%.8f\n", result)
end

solve_bitonic_tsp
