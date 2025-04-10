def smallest_window(arr, k)
  n = arr.length
  
  # 配列内の要素がk未満の場合、1からkまでをすべて含むことは不可能
  unique_elements_in_range = arr.select { |x| x >= 1 && x <= k }.uniq.size
  return 0 if unique_elements_in_range < k
  
  # 1からkまでの数字を含むwindowを見つける
  min_window_size = Float::INFINITY
  window_count = Hash.new(0)
  required_count = 0
  
  left = 0
  
  arr.each_with_index do |num, right|
    # 現在の数字が1〜kの範囲内で、まだカウントされていない場合
    if num <= k && num >= 1 && window_count[num] == 0
      required_count += 1
    end
    
    # ウィンドウに現在の数字を追加
    window_count[num] += 1
    
    # ウィンドウが必要な全ての数字を含む場合、ウィンドウを縮小して最小サイズを更新
    while required_count == k
      # 現在のウィンドウサイズを計算
      current_window_size = right - left + 1
      min_window_size = [min_window_size, current_window_size].min
      
      # 左端の要素を除去
      window_count[arr[left]] -= 1
      
      # もし除去した要素が必要な数字で、カウントが0になった場合
      if arr[left] <= k && arr[left] >= 1 && window_count[arr[left]] == 0
        required_count -= 1
      end
      
      # 左端を右に移動
      left += 1
    end
  end
  
  # 解が見つからなかった場合は0を返す
  min_window_size == Float::INFINITY ? 0 : min_window_size
end

# 入力を処理
line = gets.chomp.split.map(&:to_i)
n, k = line[0], line[1]
arr = gets.chomp.split.map(&:to_i)

puts smallest_window(arr, k)
