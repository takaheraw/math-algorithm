def binary_search(arr, target)
  left  = 0
  right = arr.length - 1

  while left <= right
    mid = (left + right) / 2

    if arr[mid] == target
      return mid
    elsif arr[mid] < target
      left = mid + 1
    else
      right = mid - 1
    end
  end
end

# テスト用の配列
arr = [1, 3, 5, 7, 9, 11, 13, 15]

# 二分探索を実行
target_index = binary_search(arr, 11)

if target_index != -1
  puts "要素 11 は配列の #{target_index} 番目にあります。"
else
  puts '要素 11 は配列内に見つかりませんでした。'
end
