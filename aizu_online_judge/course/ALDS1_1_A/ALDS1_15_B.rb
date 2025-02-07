def fractional_knapsack(n, w, items)
  # 価値密度（value/weight）の降順でソート
  items.sort_by! { |v, w| -v.to_f / w }

  total_value = 0.0
  remaining_weight = w

  items.each do |value, weight|
    if remaining_weight >= weight
      # すべての重さをナップサックに入れる
      total_value += value
      remaining_weight -= weight
    else
      # 一部のみ入れる
      total_value += value.to_f * remaining_weight / weight
      break
    end
  end

  total_value
end

# 入力の読み込み
n, w = gets.split.map(&:to_i)
items = Array.new(n) { gets.split.map(&:to_i) }

# 結果の出力（誤差 10⁻⁶ 以内に収める）
puts format('%.6f', fractional_knapsack(n, w, items))
