def solve_knapsack
  # 入力の読み取り
  n, w = gets.split.map(&:to_i)
  items = []
  
  n.times do
    v, weight, m = gets.split.map(&:to_i)
    items << [v, weight, m]
  end
  
  # 重みが大きすぎる場合は価値密度による貪欲法を使用
  if w > 100000
    return greedy_solution(items, w)
  end
  
  # 通常のDP解法
  dp_solution(items, w)
end

def dp_solution(items, w)
  # dp[i][j] = i番目までのアイテムを使って、重さjでの最大価値
  dp = Array.new(items.size + 1) { Array.new(w + 1, 0) }
  
  items.each_with_index do |(value, weight, limit), i|
    (0..w).each do |current_weight|
      # アイテムi+1を使わない場合
      dp[i + 1][current_weight] = dp[i][current_weight]
      
      # アイテムi+1を使う場合（1個から限界まで）
      (1..limit).each do |count|
        total_weight = weight * count
        break if current_weight < total_weight
        
        total_value = value * count
        new_value = dp[i][current_weight - total_weight] + total_value
        dp[i + 1][current_weight] = [dp[i + 1][current_weight], new_value].max
      end
    end
  end
  
  dp[items.size][w]
end

def greedy_solution(items, w)
  # 価値密度でソート（価値/重量の降順）
  sorted_items = items.map.with_index do |(value, weight, limit), i|
    density = value.to_f / weight
    [density, value, weight, limit, i]
  end.sort_by { |item| -item[0] }
  
  total_value = 0
  remaining_weight = w
  
  sorted_items.each do |density, value, weight, limit, original_index|
    # このアイテムを何個取れるか計算
    max_count_by_weight = remaining_weight / weight
    max_count_by_limit = limit
    
    count = [max_count_by_weight, max_count_by_limit].min
    
    if count > 0
      total_value += value * count
      remaining_weight -= weight * count
    end
    
    break if remaining_weight == 0
  end
  
  total_value
end

# メイン処理
puts solve_knapsack
