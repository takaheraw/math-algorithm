def count_inversions(arr)
  def merge_and_count(arr, temp, left, mid, right)
    i = left      # 左側の開始インデックス
    j = mid + 1   # 右側の開始インデックス
    k = left      # 一時配列の開始インデックス
    inv_count = 0

    # 左右の部分配列をマージしながら逆転数をカウント
    while i <= mid && j <= right
      if arr[i] <= arr[j]
        temp[k] = arr[i]
        i += 1
      else
        temp[k] = arr[j]
        inv_count += (mid - i + 1) # 左側の残りの要素全てが逆転数になる
        j += 1
      end
      k += 1
    end

    # 左側の残りをコピー
    while i <= mid
      temp[k] = arr[i]
      i += 1
      k += 1
    end

    # 右側の残りをコピー
    while j <= right
      temp[k] = arr[j]
      j += 1
      k += 1
    end

    # 一時配列から元の配列にコピー
    (left..right).each do |index|
      arr[index] = temp[index]
    end

    inv_count
  end

  def merge_sort_and_count(arr, temp, left, right)
    inv_count = 0
    if left < right
      mid = (left + right) / 2

      # 左側の逆転数を計算
      inv_count += merge_sort_and_count(arr, temp, left, mid)
      # 右側の逆転数を計算
      inv_count += merge_sort_and_count(arr, temp, mid + 1, right)
      # マージしながら逆転数を計算
      inv_count += merge_and_count(arr, temp, left, mid, right)
    end
    inv_count
  end

  temp = Array.new(arr.size)
  merge_sort_and_count(arr, temp, 0, arr.size - 1)
end

# 入力の読み込み
n = gets.to_i
arr = gets.split.map(&:to_i)

# 逆転数の計算と出力
puts count_inversions(arr)
