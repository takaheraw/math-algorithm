# 選択ソート
def selection_sort(array)
  n = array.length
  (0...n).each do |i|
    # i番目以降の要素の中から最小値のインデックスを見つける
    min_index = i
    (i+1...n).each do |j|
      min_index = j if array[j] < array[min_index]
    end
    # 最小値が見つかった位置とi番目の要素を交換する
    array[i], array[min_index] = array[min_index], array[i] if min_index != i
  end
  array
end

unsorted = [64, 25, 12, 22, 11]
sorted = selection_sort(unsorted)
puts sorted.inspect  # => [11, 12, 22, 25, 64]

# マージソート
def merge_sort(array)
  # 配列のサイズが1以下なら、それ以上分割する必要がないのでそのまま返す
  return array if array.size <= 1

  mid = array.size / 2
  # 左右に配列を分割して再帰的にソートする
  left = merge_sort(array[0...mid])
  right = merge_sort(array[mid..-1])
  
  # 分割してソートされた配列を統合する
  merge(left, right)
end

def merge(left, right)
  sorted = []
  # 左右の配列の先頭から比較して小さい方を順に取り出す
  until left.empty? || right.empty?
    if left.first <= right.first
      sorted << left.shift
    else
      sorted << right.shift
    end
  end
  # 残った要素を全て結合する
  sorted + left + right
end

unsorted = [38, 27, 43, 3, 9, 82, 10]
sorted = merge_sort(unsorted)
puts sorted.inspect  # => [3, 9, 10, 27, 38, 43, 82]


# バブルソート
def bubble_sort(array)
  n = array.length
  (0...n).each do |i|
    (0...n - i - 1).each do |j|
      # 隣り合う要素を比較して大小が逆なら入れ替える
      array[j], array[j + 1] = array[j + 1], array[j] if array[j] > array[j + 1]
    end
  end
  array
end

unsorted = [64, 34, 25, 12, 22, 11, 90]
sorted = bubble_sort(unsorted)
puts sorted.inspect  # => [11, 12, 22, 25, 34, 64, 90]

# クイックソート
def quick_sort(array)
  # 配列が空か1要素ならそのまま返す
  return array if array.size <= 1

  # ピボットを選択し、ピボットより小さい要素と大きい要素に分ける
  pivot = array.delete_at(rand(array.size))
  left, right = array.partition { |n| n < pivot }

  # 分割した配列を再帰的にソートして結合する
  quick_sort(left) + [pivot] + quick_sort(right)
end

unsorted = [33, 10, 55, 71, 29, 42, 18]
sorted = quick_sort(unsorted)
puts sorted.inspect  # => [10, 18, 29, 33, 42, 55, 71]
