def solve_huge_knapsack
  # 入力の読み込み
  n, w = gets.split.map(&:to_i)
  items = []
  n.times do
    v, weight = gets.split.map(&:to_i)
    items << [v, weight]
  end
  
  # アイテムを前半と後半に分割
  mid = n / 2
  first_half = items[0...mid]
  second_half = items[mid..-1]
  
  # 前半のアイテムで可能な全ての組み合わせを生成
  first_combinations = generate_combinations(first_half)
  
  # 後半のアイテムで可能な全ての組み合わせを生成
  second_combinations = generate_combinations(second_half)
  
  # 後半の組み合わせを重み順でソートし、各重みに対する最大価値を前計算
  second_combinations.sort!
  max_values = []
  current_max = 0
  
  second_combinations.each do |weight, value|
    current_max = [current_max, value].max
    max_values << [weight, current_max]
  end
  
  max_total_value = 0
  
  # 前半の各組み合わせに対して、後半から最適な組み合わせを探す
  first_combinations.each do |first_weight, first_value|
    remaining_capacity = w - first_weight
    next if remaining_capacity < 0
    
    # 二分探索で remaining_capacity 以下の最大重みを持つ組み合わせを探す
    best_second_value = binary_search_max_value(max_values, remaining_capacity)
    
    total_value = first_value + best_second_value
    max_total_value = [max_total_value, total_value].max
  end
  
  max_total_value
end

# 与えられたアイテム配列から全ての可能な組み合わせ（重み、価値）を生成
def generate_combinations(items)
  combinations = []
  n = items.length
  
  # 2^n 通りの組み合わせを全て試す
  (0...(1 << n)).each do |mask|
    total_weight = 0
    total_value = 0
    
    n.times do |i|
      if (mask >> i) & 1 == 1
        total_value += items[i][0]   # 価値
        total_weight += items[i][1]  # 重み
      end
    end
    
    combinations << [total_weight, total_value]
  end
  
  combinations
end

# 二分探索で指定された容量以下で最大の価値を持つ組み合わせの価値を返す
def binary_search_max_value(sorted_combinations, max_weight)
  left = 0
  right = sorted_combinations.length - 1
  best_value = 0
  
  while left <= right
    mid = (left + right) / 2
    weight, value = sorted_combinations[mid]
    
    if weight <= max_weight
      best_value = [best_value, value].max
      left = mid + 1
    else
      right = mid - 1
    end
  end
  
  best_value
end

# メイン処理
puts solve_huge_knapsack
