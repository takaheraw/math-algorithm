def smallest_subarray_with_sum(arr, s)
  n = arr.size
  left = 0
  sum = 0
  min_length = Float::INFINITY
  
  arr.each_with_index do |val, right|
    sum += val
    
    # 現在の合計がs以上になった場合、左端を可能な限り右に移動して最小長を探す
    while sum >= s && left <= right
      min_length = [min_length, right - left + 1].min
      sum -= arr[left]
      left += 1
    end
  end
  
  # 条件を満たす部分配列が見つからなかった場合は0を返す
  min_length == Float::INFINITY ? 0 : min_length
end

# 入力処理
input = gets.split.map(&:to_i)
n, s = input[0], input[1]
arr = gets.split.map(&:to_i)

# 結果を出力
puts smallest_subarray_with_sum(arr, s)
