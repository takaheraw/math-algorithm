def longest_increasing_subsequence(arr)
  return 0 if arr.empty?
  
  # tails[i] は長さ i+1 の増加部分列の末尾の最小値を保持
  tails = []
  
  arr.each do |num|
    # 二分探索で num を挿入する位置を見つける
    left, right = 0, tails.length
    
    while left < right
      mid = (left + right) / 2
      if tails[mid] < num
        left = mid + 1
      else
        right = mid
      end
    end
    
    # left の位置に num を挿入（既存の値を置き換えるか、末尾に追加）
    if left == tails.length
      tails << num
    else
      tails[left] = num
    end
  end
  
  tails.length
end

# 入力を読み取り
n = gets.to_i
arr = []
n.times do
  arr << gets.to_i
end

# 結果を出力
puts longest_increasing_subsequence(arr)
