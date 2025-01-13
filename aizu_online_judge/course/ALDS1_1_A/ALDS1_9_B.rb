def left(i)
  2 * i
end

def right(i)
  2 * i + 1
end

def max_heapify(array, i, heap_size)
  l = left(i)
  r = right(i)
  largest = i

  if l <= heap_size && array[l - 1] > array[i - 1]
    largest = l
  end

  if r <= heap_size && array[r - 1] > array[largest - 1]
    largest = r
  end

  if largest != i
    array[i - 1], array[largest - 1] = array[largest - 1], array[i - 1]
    max_heapify(array, largest, heap_size)
  end
end

def build_max_heap(array)
  heap_size = array.size
  (heap_size / 2).downto(1) do |i|
    max_heapify(array, i, heap_size)
  end
end

# 入力を受け取る
h = gets.to_i
array = gets.split.map(&:to_i)

# 最大ヒープを構築
build_max_heap(array)

# 結果を出力
puts " " + array.join(" ")
