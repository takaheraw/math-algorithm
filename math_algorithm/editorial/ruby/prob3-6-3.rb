def merge_sort(arr)
  # 長さが 1 の場合、すでにソートされているので何もしない
  return arr if arr.length <= 1

  # 2 つに分割した後、小さい配列をソート
  mid = arr.length / 2
  left_half = merge_sort(arr[0...mid])
  right_half = merge_sort(arr[mid..-1])

  # 以下が Merge 操作となります。
  merge(left_half, right_half)
end

def merge(left, right)
  result = []
  until left.empty? || right.empty?
    if left.first <= right.first
      result << left.shift
    else
      result << right.shift
    end
  end
  result + left + right
end

# 以下、メイン部分
n = gets.to_i
a = gets.split.map(&:to_i)

# マージソート → 答えの出力
answer = merge_sort(a)
puts answer.join(' ')
