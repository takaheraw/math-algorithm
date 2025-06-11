def solve_coin_combination
  # 入力を読み取り
  n, k, l, r = gets.split.map(&:to_i)
  coins = gets.split.map(&:to_i)
  
  # 配列を半分に分ける
  mid = n / 2
  left_coins = coins[0...mid]
  right_coins = coins[mid..-1]
  
  # 左半分の全ての部分集合の和を計算
  # left_sums[i] = 左半分からi個選んだ時の和の配列
  left_sums = Array.new(mid + 1) { [] }
  
  # 左半分の全ての部分集合を生成
  (0...(1 << left_coins.size)).each do |mask|
    count = 0
    sum = 0
    left_coins.each_with_index do |coin, i|
      if mask & (1 << i) != 0
        count += 1
        sum += coin
      end
    end
    left_sums[count] << sum
  end
  
  # 各配列をソート（二分探索のため）
  left_sums.each(&:sort!)
  
  # 右半分の全ての部分集合の和を計算
  right_sums = Array.new(right_coins.size + 1) { [] }
  
  (0...(1 << right_coins.size)).each do |mask|
    count = 0
    sum = 0
    right_coins.each_with_index do |coin, i|
      if mask & (1 << i) != 0
        count += 1
        sum += coin
      end
    end
    right_sums[count] << sum
  end
  
  # 各配列をソート
  right_sums.each(&:sort!)
  
  result = 0
  
  # 左からi個、右からj個選ぶ場合を考える（i + j = k）
  (0..k).each do |i|
    j = k - i
    next if i > left_coins.size || j > right_coins.size
    next if left_sums[i].empty? || right_sums[j].empty?
    
    # 左からi個選んだ各和について、右からj個選んで条件を満たす組み合わせを数える
    left_sums[i].each do |left_sum|
      # left_sum + right_sum が [L, R] の範囲に入る right_sum を探す
      min_right = l - left_sum
      max_right = r - left_sum
      
      # 二分探索で範囲内の要素数を数える
      left_idx = binary_search_left(right_sums[j], min_right)
      right_idx = binary_search_right(right_sums[j], max_right)
      
      if left_idx <= right_idx
        result += right_idx - left_idx + 1
      end
    end
  end
  
  puts result
end

# target以上の最初のインデックスを返す
def binary_search_left(arr, target)
  left, right = 0, arr.size - 1
  result = arr.size
  
  while left <= right
    mid = (left + right) / 2
    if arr[mid] >= target
      result = mid
      right = mid - 1
    else
      left = mid + 1
    end
  end
  
  result
end

# target以下の最後のインデックスを返す
def binary_search_right(arr, target)
  left, right = 0, arr.size - 1
  result = -1
  
  while left <= right
    mid = (left + right) / 2
    if arr[mid] <= target
      result = mid
      left = mid + 1
    else
      right = mid - 1
    end
  end
  
  result
end

# メイン処理実行
solve_coin_combination
